locals {
  slack_engineering_alerts_channel = var.enable_quarantine ? var.slack_engineering_quarantine_channel : var.slack_engineering_alerts_channel
}

resource "pagerduty_service" "alerts" {
  name                    = "${var.workload_name} Alerts (${var.customer_name})"
  acknowledgement_timeout = 7200
  alert_creation          = "create_alerts_and_incidents"
  auto_resolve_timeout    = 86400
  escalation_policy       = local.engineering_escalation_policy

  incident_urgency_rule {
    type = "use_support_hours"

    during_support_hours {
      type    = "constant"
      urgency = "high"
    }

    outside_support_hours {
      type    = "constant"
      urgency = "low"
    }
  }

  support_hours {
    type         = "fixed_time_per_day"
    time_zone    = "America/New_York"
    start_time   = "07:00:00"
    end_time     = "20:00:00"
    days_of_week = [1, 2, 3, 4, 5]
  }

  scheduled_actions {
    type       = "urgency_change"
    to_urgency = "high"

    at {
      type = "named_time"
      name = "support_hours_start"
    }
  }
}

resource "pagerduty_service_dependency" "alerts" {
  dependency {
    dependent_service {
      id   = pagerduty_business_service.workload.id
      type = pagerduty_business_service.workload.type
    }
    supporting_service {
      id   = pagerduty_service.alerts.id
      type = pagerduty_service.alerts.type
    }
  }
}

resource "pagerduty_slack_connection" "alerts" {
  channel_id        = local.slack_engineering_alerts_channel
  notification_type = "responder"
  source_id         = pagerduty_service.alerts.id
  source_type       = "service_reference"
  workspace_id      = var.slack_workspace_id

  config {
    events = [
      "incident.triggered",
      "incident.acknowledged",
      "incident.escalated",
      "incident.resolved",
      "incident.reassigned",
      "incident.unacknowledged",
      "incident.delegated",
      "incident.priority_updated",
      "incident.responder.added",
      "incident.responder.replied",
      "incident.status_update_published",
      "incident.reopened"
    ]
    priorities = ["*"]
  }
}

resource "pagerduty_service_integration" "alerts" {
  name    = data.pagerduty_vendor.datadog.name
  service = pagerduty_service.alerts.id
  vendor  = data.pagerduty_vendor.datadog.id
}

resource "pagerduty_extension" "alerts" {
  name              = "jira-${pagerduty_service.alerts.id}"
  config            = templatefile("${path.module}/jira.json", {})
  extension_objects = [pagerduty_service.alerts.id]
  extension_schema  = data.pagerduty_extension_schema.jira.id
}
