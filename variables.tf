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

variable "slack_workspace_id" {
  description = "The Slack workspace ID"
  type        = string
}

variable "workload_name" {
  description = "Workload Name"
  type        = string
}
