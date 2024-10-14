output "prod_datadog_integration_key" {
  description = "PagerDuty Datadog Integration for prod alerts"
  value       = pagerduty_service_integration.prod.integration_key
}

output "prod_datadog_mention" {
  description = "PagerDuty Service Mention with proper formatting"
  value       = "@pagerduty-${replace(pagerduty_service.prod.name, "/[\\[\\]\\(\\) ]/", "")}"
}

output "prod_service_id" {
  description = "PagerDuty service ID for prod alerts"
  value       = pagerduty_service.prod.id
}

output "prod_service_name" {
  description = "PagerDuty service name for prod alerts"
  value       = pagerduty_service.prod.name
}

output "critical_datadog_integration_key" {
  description = "PagerDuty Datadog Integration for critiacl alerts"
  value       = pagerduty_service_integration.critical.integration_key
}

output "critical_datadog_mention" {
  description = "PagerDuty Service Mention with proper formatting"
  value       = "@pagerduty-${replace(pagerduty_service.critical.name, "/[\\[\\]\\(\\) ]/", "")}"
}

output "critical_service_id" {
  description = "PagerDuty service ID for critical alerts"
  value       = pagerduty_service.critical.id
}

output "critical_service_name" {
  description = "PagerDuty service name for critical alerts"
  value       = pagerduty_service.critical.name
}

output "nonprod_datadog_integration_key" {
  description = "PagerDuty Datadog Integration for nonprod"
  value       = pagerduty_service_integration.nonprod.integration_key
}

output "nonprod_datadog_mention" {
  description = "PagerDuty Service Mention with proper formatting"
  value       = "@pagerduty-${replace(pagerduty_service.nonprod.name, "/[\\[\\]\\(\\) ]/", "")}"
}

output "nonprod_service_id" {
  description = "PagerDuty service ID for non-prod alerts"
  value       = pagerduty_service.nonprod.id
}

output "nonprod_service_name" {
  description = "PagerDuty service name for non-prod alerts"
  value       = pagerduty_service.nonprod.name
}

output "datadog_integrations" {
  description = "All PagerDuty Datadog integrations"
  value = {
    "alerts" = {
      "name" = pagerduty_service.prod.name
      "key"  = pagerduty_service_integration.prod.integration_key
    }
    "critical" = {
      "name" = pagerduty_service.critical.name
      "key"  = pagerduty_service_integration.critical.integration_key
    }
    "nonprod" = {
      "name" = pagerduty_service.nonprod.name
      "key"  = pagerduty_service_integration.nonprod.integration_key
    }
  }
}

output "pagerduty_services" {
  description = "All PagerDuty services"
  value = [
    pagerduty_service.prod.id,
    pagerduty_service.critical.id,
    pagerduty_service.nonprod.id
  ]
}
