output "alerts_datadog_integration_key" {
  description = "PagerDuty Datadog Integration for alerts"
  value       = pagerduty_service_integration.alerts.integration_key
}

output "alerts_datadog_mention" {
  description = "PagerDuty Service Mention with proper formatting"
  value       = "@pagerduty-${replace(pagerduty_service.alerts.name, "/[\\[\\]\\(\\) ]/g", "")}"
}

output "alerts_service_id" {
  description = "PagerDuty service ID for alerts"
  value       = pagerduty_service.alerts.id
}

output "alerts_service_name" {
  description = "PagerDuty service name for alerts"
  value       = pagerduty_service.alerts.name
}

output "critical_datadog_integration_key" {
  description = "PagerDuty Datadog Integration for critiacl alerts"
  value       = pagerduty_service_integration.critical.integration_key
}

output "critical_datadog_mention" {
  description = "PagerDuty Service Mention with proper formatting"
  value       = "@pagerduty-${replace(pagerduty_service.critical.name, "/[\\[\\]\\(\\) ]/g", "")}"
}

output "critical_service_id" {
  description = "PagerDuty service ID for critical alerts"
  value       = pagerduty_service.critical.id
}

output "critical_service_name" {
  description = "PagerDuty service name for critical alerts"
  value       = pagerduty_service.critical.name
}

output "notifications_datadog_integration_key" {
  description = "PagerDuty Datadog Integration for notifications"
  value       = pagerduty_service_integration.notifications.integration_key
}

output "notification_datadog_mention" {
  description = "PagerDuty Service Mention with proper formatting"
  value       = "@pagerduty-${replace(pagerduty_service.notifications.name, "/[\\[\\]\\(\\) ]/g", "")}"
}

output "notifications_service_id" {
  description = "PagerDuty service ID for notifications"
  value       = pagerduty_service.notifications.id
}

output "notifications_service_name" {
  description = "PagerDuty service name for notifications"
  value       = pagerduty_service.notifications.name
}

output "datadog_integrations" {
  description = "All PagerDuty Datadog integrations"
  value = {
    "alerts" = {
      "name" = pagerduty_service.alerts.name
      "key"  = pagerduty_service_integration.alerts.integration_key
    }
    "critical" = {
      "name" = pagerduty_service.critical.name
      "key"  = pagerduty_service_integration.critical.integration_key
    }
    "notifications" = {
      "name" = pagerduty_service.notifications.name
      "key"  = pagerduty_service_integration.notifications.integration_key
    }
  }
}

output "pagerduty_services" {
  description = "All PagerDuty services"
  value = [
    pagerduty_service.alerts.id,
    pagerduty_service.critical.id,
    pagerduty_service.notifications.id
  ]
}
