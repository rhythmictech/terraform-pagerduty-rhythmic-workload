# terraform-pagerduty-rhythmic-workload
[![tflint](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions/workflows/tflint.yaml/badge.svg)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions/workflows/tflint.yaml)
[![tfsec](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions/workflows/tfsec.yaml/badge.svg)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions/workflows/tfsec.yaml)
[![yamllint](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions/workflows/yamllint.yaml/badge.svg)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions/workflows/yamllint.yaml)
[![misspell](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions/workflows/misspell.yaml/badge.svg)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions/workflows/misspell.yaml)
[![pre-commit-check](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions/workflows/pre-commit.yaml)
<a href="https://twitter.com/intent/follow?screen_name=RhythmicTech"><img src="https://img.shields.io/twitter/follow/RhythmicTech?style=social&logo=twitter" alt="follow on Twitter"></a>

Binds Datadog and PagerDuty

## Requirements
* DataDog provider
* DataDog API key
* PagerDuty provider
* PagerDuty API key

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | ~>3.42 |
| <a name="requirement_pagerduty"></a> [pagerduty](#requirement\_pagerduty) | ~> 3.15 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_pagerduty"></a> [pagerduty](#provider\_pagerduty) | 3.15.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [pagerduty_business_service.workload](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/business_service) | resource |
| [pagerduty_extension.critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/extension) | resource |
| [pagerduty_extension.nonprod](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/extension) | resource |
| [pagerduty_extension.prod](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/extension) | resource |
| [pagerduty_service.critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service.nonprod](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service.prod](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service_dependency.critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_dependency) | resource |
| [pagerduty_service_dependency.nonprod](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_dependency) | resource |
| [pagerduty_service_dependency.prod](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_dependency) | resource |
| [pagerduty_service_dependency.workload](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_dependency) | resource |
| [pagerduty_service_integration.critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_service_integration.nonprod](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_service_integration.prod](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_slack_connection.critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/slack_connection) | resource |
| [pagerduty_slack_connection.nonprod](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/slack_connection) | resource |
| [pagerduty_slack_connection.prod](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/slack_connection) | resource |
| [pagerduty_business_service.customer](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/business_service) | data source |
| [pagerduty_escalation_policy.engineering](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/escalation_policy) | data source |
| [pagerduty_extension_schema.jira](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/extension_schema) | data source |
| [pagerduty_team.engineering](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/team) | data source |
| [pagerduty_vendor.datadog](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/vendor) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_customer_name"></a> [customer\_name](#input\_customer\_name) | Customer Name | `string` | n/a | yes |
| <a name="input_slack_engineering_critical_channel"></a> [slack\_engineering\_critical\_channel](#input\_slack\_engineering\_critical\_channel) | The Slack channel ID for critical engineering alerts | `string` | n/a | yes |
| <a name="input_slack_engineering_nonprod_channel"></a> [slack\_engineering\_nonprod\_channel](#input\_slack\_engineering\_nonprod\_channel) | The Slack channel ID for non-prod engineering alerts | `string` | n/a | yes |
| <a name="input_slack_engineering_prod_channel"></a> [slack\_engineering\_prod\_channel](#input\_slack\_engineering\_prod\_channel) | The Slack channel ID for prod engineering alerts | `string` | n/a | yes |
| <a name="input_slack_workspace_id"></a> [slack\_workspace\_id](#input\_slack\_workspace\_id) | The Slack workspace ID | `string` | n/a | yes |
| <a name="input_workload_name"></a> [workload\_name](#input\_workload\_name) | Workload Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_critical_datadog_integration_key"></a> [critical\_datadog\_integration\_key](#output\_critical\_datadog\_integration\_key) | PagerDuty Datadog Integration for critiacl alerts |
| <a name="output_critical_datadog_mention"></a> [critical\_datadog\_mention](#output\_critical\_datadog\_mention) | PagerDuty Service Mention with proper formatting |
| <a name="output_critical_service_id"></a> [critical\_service\_id](#output\_critical\_service\_id) | PagerDuty service ID for critical alerts |
| <a name="output_critical_service_name"></a> [critical\_service\_name](#output\_critical\_service\_name) | PagerDuty service name for critical alerts |
| <a name="output_datadog_integrations"></a> [datadog\_integrations](#output\_datadog\_integrations) | All PagerDuty Datadog integrations |
| <a name="output_nonprod_datadog_integration_key"></a> [nonprod\_datadog\_integration\_key](#output\_nonprod\_datadog\_integration\_key) | PagerDuty Datadog Integration for nonprod |
| <a name="output_nonprod_datadog_mention"></a> [nonprod\_datadog\_mention](#output\_nonprod\_datadog\_mention) | PagerDuty Service Mention with proper formatting |
| <a name="output_nonprod_service_id"></a> [nonprod\_service\_id](#output\_nonprod\_service\_id) | PagerDuty service ID for non-prod alerts |
| <a name="output_nonprod_service_name"></a> [nonprod\_service\_name](#output\_nonprod\_service\_name) | PagerDuty service name for non-prod alerts |
| <a name="output_pagerduty_services"></a> [pagerduty\_services](#output\_pagerduty\_services) | All PagerDuty services |
| <a name="output_prod_datadog_integration_key"></a> [prod\_datadog\_integration\_key](#output\_prod\_datadog\_integration\_key) | PagerDuty Datadog Integration for prod alerts |
| <a name="output_prod_datadog_mention"></a> [prod\_datadog\_mention](#output\_prod\_datadog\_mention) | PagerDuty Service Mention with proper formatting |
| <a name="output_prod_service_id"></a> [prod\_service\_id](#output\_prod\_service\_id) | PagerDuty service ID for prod alerts |
| <a name="output_prod_service_name"></a> [prod\_service\_name](#output\_prod\_service\_name) | PagerDuty service name for prod alerts |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
