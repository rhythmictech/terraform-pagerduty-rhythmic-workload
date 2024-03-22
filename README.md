# terraform-pagerduty-rhythmic-workload
[![tflint](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/workflows/tflint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions?query=workflow%3Atflint+event%3Apush+branch%3Amaster)
[![tfsec](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/workflows/tfsec/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions?query=workflow%3Atfsec+event%3Apush+branch%3Amaster)
[![yamllint](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/workflows/yamllint/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions?query=workflow%3Ayamllint+event%3Apush+branch%3Amaster)
[![misspell](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/workflows/misspell/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions?query=workflow%3Amisspell+event%3Apush+branch%3Amaster)
[![pre-commit-check](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/workflows/pre-commit-check/badge.svg?branch=master&event=push)](https://github.com/rhythmictech/terraform-pagerduty-rhythmic-workload/actions?query=workflow%3Apre-commit-check+event%3Apush+branch%3Amaster)
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
| <a name="requirement_datadog"></a> [datadog](#requirement\_datadog) | ~>3.37 |
| <a name="requirement_pagerduty"></a> [pagerduty](#requirement\_pagerduty) | ~> 3.9 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_pagerduty"></a> [pagerduty](#provider\_pagerduty) | 3.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [pagerduty_business_service.workload](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/business_service) | resource |
| [pagerduty_extension.alerts](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/extension) | resource |
| [pagerduty_extension.critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/extension) | resource |
| [pagerduty_extension.notifications](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/extension) | resource |
| [pagerduty_service.alerts](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service.critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service.notifications](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service) | resource |
| [pagerduty_service_dependency.alerts](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_dependency) | resource |
| [pagerduty_service_dependency.critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_dependency) | resource |
| [pagerduty_service_dependency.notifications](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_dependency) | resource |
| [pagerduty_service_dependency.workload](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_dependency) | resource |
| [pagerduty_service_integration.alerts](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_service_integration.critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_service_integration.notifications](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/service_integration) | resource |
| [pagerduty_slack_connection.alerts](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/slack_connection) | resource |
| [pagerduty_slack_connection.critical](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/slack_connection) | resource |
| [pagerduty_slack_connection.notifications](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/resources/slack_connection) | resource |
| [pagerduty_business_service.customer](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/business_service) | data source |
| [pagerduty_escalation_policy.engineering](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/escalation_policy) | data source |
| [pagerduty_escalation_policy.engineering_quarantine](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/escalation_policy) | data source |
| [pagerduty_extension_schema.jira](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/extension_schema) | data source |
| [pagerduty_team.engineering](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/team) | data source |
| [pagerduty_vendor.datadog](https://registry.terraform.io/providers/PagerDuty/pagerduty/latest/docs/data-sources/vendor) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_customer_name"></a> [customer\_name](#input\_customer\_name) | Customer Name | `string` | n/a | yes |
| <a name="input_enable_critical_quarantine"></a> [enable\_critical\_quarantine](#input\_enable\_critical\_quarantine) | Override to quarantine critical alerts | `bool` | `false` | no |
| <a name="input_enable_quarantine"></a> [enable\_quarantine](#input\_enable\_quarantine) | Override to quarantine non-critical alerts | `bool` | `false` | no |
| <a name="input_slack_engineering_alerts_channel"></a> [slack\_engineering\_alerts\_channel](#input\_slack\_engineering\_alerts\_channel) | The Slack channel ID for engineering alerts | `string` | n/a | yes |
| <a name="input_slack_engineering_critical_alerts_channel"></a> [slack\_engineering\_critical\_alerts\_channel](#input\_slack\_engineering\_critical\_alerts\_channel) | The Slack channel ID for engineering critical alerts | `string` | n/a | yes |
| <a name="input_slack_engineering_notifications_channel"></a> [slack\_engineering\_notifications\_channel](#input\_slack\_engineering\_notifications\_channel) | The Slack channel ID for engineering notifications | `string` | n/a | yes |
| <a name="input_slack_engineering_quarantine_channel"></a> [slack\_engineering\_quarantine\_channel](#input\_slack\_engineering\_quarantine\_channel) | The Slack channel ID for engineering critical alerts | `string` | n/a | yes |
| <a name="input_slack_workspace_id"></a> [slack\_workspace\_id](#input\_slack\_workspace\_id) | The Slack workspace ID | `string` | n/a | yes |
| <a name="input_workload_name"></a> [workload\_name](#input\_workload\_name) | Workload Name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alerts_datadog_integration_key"></a> [alerts\_datadog\_integration\_key](#output\_alerts\_datadog\_integration\_key) | PagerDuty Datadog Integration for alerts |
| <a name="output_alerts_service_name"></a> [alerts\_service\_name](#output\_alerts\_service\_name) | PagerDuty service for alerts |
| <a name="output_critical_alerts_datadog_integration_key"></a> [critical\_alerts\_datadog\_integration\_key](#output\_critical\_alerts\_datadog\_integration\_key) | PagerDuty Datadog Integration for critiacl alerts |
| <a name="output_critical_service_id"></a> [critical\_service\_id](#output\_critical\_service\_id) | PagerDuty service for critical alerts |
| <a name="output_datadog_integrations"></a> [datadog\_integrations](#output\_datadog\_integrations) | All PagerDuty Datadog integrations |
| <a name="output_notifications_datadog_integration_key"></a> [notifications\_datadog\_integration\_key](#output\_notifications\_datadog\_integration\_key) | PagerDuty Datadog Integration for notifications |
| <a name="output_notifications_service_name"></a> [notifications\_service\_name](#output\_notifications\_service\_name) | PagerDuty service for notifications |
| <a name="output_pagerduty_services"></a> [pagerduty\_services](#output\_pagerduty\_services) | All PagerDuty services |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
