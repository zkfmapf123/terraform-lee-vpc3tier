<!-- BEGIN_TF_DOCS -->

## Requirements

No requirements.

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                                  | Type     |
| ----------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_eip.nat_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip)                                                    | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)                              | resource |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway)                                        | resource |
| [aws_route_table.db_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                             | resource |
| [aws_route_table.private_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                        | resource |
| [aws_route_table.public_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                         | resource |
| [aws_route_table_association.db-rt-mapping](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)      | resource |
| [aws_route_table_association.private-rt-mapping](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public-rt-mapping](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association)  | resource |
| [aws_security_group.private_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                           | resource |
| [aws_subnet.db_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                           | resource |
| [aws_subnet.was_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                          | resource |
| [aws_subnet.webserver_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                    | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)                                                        | resource |
| [aws_vpc_endpoint.api_gateway_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint)                     | resource |
| [aws_vpc_endpoint.ecr_endpoint_api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint)                         | resource |
| [aws_vpc_endpoint.ecr_endpoint_dkr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint)                         | resource |
| [aws_vpc_endpoint.ecr_endpoint_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint)                        | resource |
| [aws_vpc_endpoint.endpoint_codepipeline](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint)                    | resource |
| [aws_vpc_endpoint.endpoint_sqs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint)                             | resource |
| [aws_vpc_endpoint.vpce_s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint)                                  | resource |

## Inputs

| Name                                                                                 | Description                         | Type          | Default                                                                                                                                                                      | Required |
| ------------------------------------------------------------------------------------ | ----------------------------------- | ------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | :------: |
| <a name="input_db_subnets"></a> [db_subnets](#input_db_subnets)                      | key : a or b, value : cidr_block    | `map(string)` | n/a                                                                                                                                                                          |   yes    |
| <a name="input_endpoint_setting"></a> [endpoint_setting](#input_endpoint_setting)    | endpoint 설정하기위한 세팅값 입니다 | `map`         | <pre>{<br/> "apigateway_is_enable": true,<br/> "codepipeline_is_enable": true,<br/> "ecr_is_enable": true,<br/> "s3_is_enable": true,<br/> "sqs_is_enable": true<br/>}</pre> |    no    |
| <a name="input_is_enable_nat"></a> [is_enable_nat](#input_is_enable_nat)             | nat gateway 활성화 여부             | `bool`        | `true`                                                                                                                                                                       |    no    |
| <a name="input_prefix"></a> [prefix](#input_prefix)                                  | 모든 자원의 prefix 입니다.          | `string`      | n/a                                                                                                                                                                          |   yes    |
| <a name="input_private_tags"></a> [private_tags](#input_private_tags)                | n/a                                 | `map`         | `{}`                                                                                                                                                                         |    no    |
| <a name="input_public_tags"></a> [public_tags](#input_public_tags)                   | n/a                                 | `map`         | `{}`                                                                                                                                                                         |    no    |
| <a name="input_vpc_cidr"></a> [vpc_cidr](#input_vpc_cidr)                            | vpc cidr block                      | `string`      | `"10.0.0.0/16"`                                                                                                                                                              |    no    |
| <a name="input_vpc_name"></a> [vpc_name](#input_vpc_name)                            | vpc name                            | `string`      | n/a                                                                                                                                                                          |   yes    |
| <a name="input_vpc_region"></a> [vpc_region](#input_vpc_region)                      | region                              | `string`      | `"ap-northeast-2"`                                                                                                                                                           |    no    |
| <a name="input_was_subnets"></a> [was_subnets](#input_was_subnets)                   | key : a or b, value : cidr_block    | `map(string)` | n/a                                                                                                                                                                          |   yes    |
| <a name="input_webserver_subnets"></a> [webserver_subnets](#input_webserver_subnets) | key : a or b, value : cidr_block    | `map(string)` | n/a                                                                                                                                                                          |   yes    |

## Outputs

| Name                                                                 | Description |
| -------------------------------------------------------------------- | ----------- |
| <a name="output_s3_endpoint"></a> [s3_endpoint](#output_s3_endpoint) | n/a         |
| <a name="output_vpc"></a> [vpc](#output_vpc)                         | n/a         |

<!-- END_TF_DOCS -->
