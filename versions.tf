terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    datadog = {
      source  = "datadog/datadog"
      version = "~>3.42"
    }

    pagerduty = {
      source  = "PagerDuty/pagerduty"
      version = "~> 3.15"
    }
  }
}
