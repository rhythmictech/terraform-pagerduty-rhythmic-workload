terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    # This module creates no datadog resources -- it only emits PagerDuty
    # integration keys as datadog mention strings. The constraint spans 3.x and
    # 4.x so consumers can pin either, and excludes 5.x until it has been checked
    # for breaking changes.
    datadog = {
      source  = "datadog/datadog"
      version = ">= 3.42, < 5.0"
    }

    pagerduty = {
      source  = "PagerDuty/pagerduty"
      version = "~> 3.15"
    }
  }
}
