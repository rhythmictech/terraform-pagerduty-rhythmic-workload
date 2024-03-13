output "critical_service_id" {
  description = "PagerDuty service for critical alerts"
  value       = pagerduty_service.critical.id
}

output "critical_alerts_datadog_integration_key" {
  description = "PagerDuty Datadog Integration for critiacl alerts"
  value       = pagerduty_service_integration.critical.integration_key
}

output "alerts_service_name" {
  description = "PagerDuty service for alerts"
  value       = pagerduty_service.alerts.name
}

output "alerts_datadog_integration_key" {
  description = "PagerDuty Datadog Integration for alerts"
  value       = pagerduty_service_integration.alerts.integration_key
}

output "notifications_service_name" {
  description = "PagerDuty service for notifications"
  value       = pagerduty_service.notifications.name
}

output "notifications_datadog_integration_key" {
  description = "PagerDuty Datadog Integration for notifications"
  value       = pagerduty_service_integration.notifications.integration_key
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
