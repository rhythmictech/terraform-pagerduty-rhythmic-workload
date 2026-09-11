resource "pagerduty_service" "nonprod" {
  name                    = "${var.workload_name} Alerts - Non-Prod (${var.customer_name})"
  acknowledgement_timeout = 7200
  alert_creation          = "create_alerts_and_incidents"
  auto_resolve_timeout    = 86400
  escalation_policy       = data.pagerduty_escalation_policy.engineering.id

  incident_urgency_rule {
    type    = "constant"
    urgency = "low"
  }
}

resource "pagerduty_service_dependency" "nonprod" {
  dependency {
    dependent_service {
      id   = pagerduty_business_service.workload.id
      type = pagerduty_business_service.workload.type
    }
    supporting_service {
      id   = pagerduty_service.nonprod.id
      type = pagerduty_service.nonprod.type
    }
  }
}

resource "pagerduty_slack_connection" "nonprod" {
  channel_id        = var.slack_engineering_nonprod_channel
  notification_type = "responder"
  source_id         = pagerduty_service.nonprod.id
  source_type       = "service_reference"
  workspace_id      = var.slack_workspace_id

  config {
    events     = local.slack_connection_events
    priorities = ["*"]
  }
}

resource "pagerduty_service_integration" "nonprod" {
  name    = data.pagerduty_vendor.datadog.name
  service = pagerduty_service.nonprod.id
  vendor  = data.pagerduty_vendor.datadog.id
}

resource "pagerduty_extension" "nonprod" {
  name              = "jira-${pagerduty_service.nonprod.id}"
  config            = templatefile("${path.module}/jira.json", {})
  extension_objects = [pagerduty_service.nonprod.id]
  extension_schema  = data.pagerduty_extension_schema.jira.id
}
