data "pagerduty_vendor" "datadog" {
  name = "Datadog"
}

data "pagerduty_extension_schema" "jira" {
  name = "Jira Cloud"
}

data "pagerduty_business_service" "customer" {
  name = var.customer_name
}

data "pagerduty_team" "engineering" {
  name = "Engineering Team"
}

data "pagerduty_escalation_policy" "engineering" {
  name = "Engineering Notifications Policy"
}

resource "pagerduty_business_service" "workload" {
  name        = "${var.workload_name} - Workload Monitoring (${var.customer_name})"
  description = "Workload Monitoring & Incident Response"
  team        = data.pagerduty_team.engineering.id
}

resource "pagerduty_service_dependency" "workload" {
  dependency {
    dependent_service {
      id   = data.pagerduty_business_service.customer.id
      type = data.pagerduty_business_service.customer.type
    }
    supporting_service {
      id   = pagerduty_business_service.workload.id
      type = pagerduty_business_service.workload.type
    }
  }
}

# PagerDuty EXPANDS a Slack connection's event list server-side. A connection
# created with a subset is read back holding every event type PagerDuty supports
# for it, so a module declaring fewer produces a permanent diff that tries to
# REMOVE the remainder on every plan, and an apply silently narrows what the
# channel receives.
#
# Verified against a live connection on 2026-09-11: Terraform created it with 12
# events and PagerDuty returned the 19 below. Declaring the full set makes the
# resource converge instead of fighting the API.
#
# If PagerDuty adds another event type, the same diff reappears and the fix is to
# add it here. Never "resolve" it by letting the apply remove events.
locals {
  slack_connection_events = [
    "incident.acknowledged",
    "incident.conference_bridge.updated",
    "incident.custom_field_values.updated",
    "incident.delegated",
    "incident.escalated",
    "incident.priority_updated",
    "incident.reassigned",
    "incident.reopened",
    "incident.resolved",
    "incident.responder.added",
    "incident.responder.replied",
    "incident.service_updated",
    "incident.status_update_published",
    "incident.title_updated",
    "incident.triggered",
    "incident.unacknowledged",
    "incident.urgency_updated",
    "incident.workflow.completed",
    "incident.workflow.started",
  ]
}
