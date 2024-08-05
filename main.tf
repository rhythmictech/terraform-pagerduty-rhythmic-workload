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
