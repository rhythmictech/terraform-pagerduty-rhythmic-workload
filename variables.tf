variable "customer_name" {
  description = "Customer Name"
  type        = string
}

variable "slack_engineering_notifications_channel" {
  description = "The Slack channel ID for engineering notifications"
  type        = string
}

variable "slack_engineering_alerts_channel" {
  description = "The Slack channel ID for engineering alerts"
  type        = string
}

variable "slack_engineering_critical_alerts_channel" {
  description = "The Slack channel ID for engineering critical alerts"
  type        = string
}

variable "slack_engineering_quarantine_channel" {
  description = "The Slack channel ID for engineering critical alerts"
  type        = string
}

variable "slack_workspace_id" {
  description = "The Slack workspace ID"
  type        = string
}

variable "enable_critical_quarantine" {
  default     = false
  description = "Override to quarantine critical alerts"
  type        = bool
}

variable "enable_quarantine" {
  default     = false
  description = "Override to quarantine non-critical alerts"
  type        = bool
}

variable "workload_name" {
  description = "Workload Name"
  type        = string
}
