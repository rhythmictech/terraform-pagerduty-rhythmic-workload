resource "pagerduty_service" "prod" {
  name                    = "${var.workload_name} Alerts - Prod 12x5 (${var.customer_name})"
  acknowledgement_timeout = 7200
  alert_creation          = "create_alerts_and_incidents"
  auto_resolve_timeout    = 86400
  escalation_policy       = data.pagerduty_escalation_policy.engineering.id

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
    end_time     = "19:00:00"
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

resource "pagerduty_service_dependency" "prod" {
  dependency {
    dependent_service {
      id   = pagerduty_business_service.workload.id
      type = pagerduty_business_service.workload.type
    }
    supporting_service {
      id   = pagerduty_service.prod.id
      type = pagerduty_service.prod.type
    }
  }
}

resource "pagerduty_slack_connection" "prod" {
  channel_id        = var.slack_engineering_prod_channel
  notification_type = "responder"
  source_id         = pagerduty_service.prod.id
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

resource "pagerduty_service_integration" "prod" {
  name    = data.pagerduty_vendor.datadog.name
  service = pagerduty_service.prod.id
  vendor  = data.pagerduty_vendor.datadog.id
}

resource "pagerduty_extension" "prod" {
  name              = "jira-${pagerduty_service.prod.id}"
  config            = templatefile("${path.module}/jira.json", {})
  extension_objects = [pagerduty_service.prod.id]
  extension_schema  = data.pagerduty_extension_schema.jira.id
}
