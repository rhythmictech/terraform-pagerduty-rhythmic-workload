locals {
  slack_engineering_critical_alerts_channel = var.enable_critical_quarantine ? var.slack_engineering_quarantine_channel : var.slack_engineering_critical_alerts_channel
}

resource "pagerduty_service" "critical" {
  name                    = "${var.workload_name} Critical Alerts [${var.customer_name}]"
  acknowledgement_timeout = 7200
  alert_creation          = "create_alerts_and_incidents"
  auto_resolve_timeout    = 86400
  escalation_policy       = local.engineering_critical_escalation_policy

  incident_urgency_rule {
    type    = "constant"
    urgency = "high"
  }
}

resource "pagerduty_service_dependency" "critical" {
  dependency {
    dependent_service {
      id   = pagerduty_business_service.workload.id
      type = pagerduty_business_service.workload.type
    }
    supporting_service {
      id   = pagerduty_service.critical.id
      type = pagerduty_service.critical.type
    }
  }
}

resource "pagerduty_slack_connection" "critical" {
  channel_id        = local.slack_engineering_critical_alerts_channel
  notification_type = "responder"
  source_id         = pagerduty_service.critical.id
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

resource "pagerduty_service_integration" "critical" {
  name    = data.pagerduty_vendor.datadog.name
  service = pagerduty_service.critical.id
  vendor  = data.pagerduty_vendor.datadog.id
}

resource "pagerduty_extension" "critical" {
  name              = "jira-${pagerduty_service.critical.id}"
  config            = templatefile("${path.module}/jira.json", {})
  extension_objects = [pagerduty_service.critical.id]
  extension_schema  = data.pagerduty_extension_schema.jira.id
}
