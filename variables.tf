variable "customer_name" {
  description = "Customer Name"
  type        = string
}

variable "slack_engineering_nonprod_channel" {
  description = "The Slack channel ID for nonprod engineering alerts"
  type        = string
}

variable "slack_engineering_prod_channel" {
  description = "The Slack channel ID for prod engineering alerts"
  type        = string
}

variable "slack_engineering_critical_channel" {
  description = "The Slack channel ID for critical engineering alerts"
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
