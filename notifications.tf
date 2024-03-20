locals {
  slack_engineering_notifications_channel = var.enable_quarantine ? var.slack_engineering_quarantine_channel : var.slack_engineering_notifications_channel
}

resource "pagerduty_service" "notifications" {
  name                    = "${var.workload_name} Notifications (${var.customer_name})"
  acknowledgement_timeout = 7200
  alert_creation          = "create_alerts_and_incidents"
  auto_resolve_timeout    = 86400
  escalation_policy       = local.engineering_escalation_policy

  incident_urgency_rule {
    type    = "constant"
    urgency = "low"
  }
}

resource "pagerduty_service_dependency" "notifications" {
  dependency {
    dependent_service {
      id   = pagerduty_business_service.workload.id
      type = pagerduty_business_service.workload.type
    }
    supporting_service {
      id   = pagerduty_service.notifications.id
      type = pagerduty_service.notifications.type
    }
  }
}

resource "pagerduty_slack_connection" "notifications" {
  channel_id        = local.slack_engineering_notifications_channel
  notification_type = "responder"
  source_id         = pagerduty_service.notifications.id
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

resource "pagerduty_service_integration" "notifications" {
  name    = data.pagerduty_vendor.datadog.name
  service = pagerduty_service.notifications.id
  vendor  = data.pagerduty_vendor.datadog.id
}

resource "pagerduty_extension" "notifications" {
  name              = "jira-${pagerduty_service.notifications.id}"
  config            = templatefile("${path.module}/jira.json", {})
  extension_objects = [pagerduty_service.notifications.id]
  extension_schema  = data.pagerduty_extension_schema.jira.id
}
