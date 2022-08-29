<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_customer_gateway.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/customer_gateway) | resource |
| [aws_vpn_connection.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpn_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bgp_asn"></a> [bgp\_asn](#input\_bgp\_asn) | The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN). | `string` | n/a | yes |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | The Amazon Resource Name (ARN) for the customer gateway certificate. | `string` | `null` | no |
| <a name="input_device_name"></a> [device\_name](#input\_device\_name) | A name for the customer gateway device. | `string` | `null` | no |
| <a name="input_enable_acceleration"></a> [enable\_acceleration](#input\_enable\_acceleration) | Indicate whether to enable acceleration for the VPN connection. Supports only EC2 Transit Gateway. | `bool` | `false` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | The IPv4 address for the customer gateway device's outside interface. | `string` | n/a | yes |
| <a name="input_local_ipv4_network_cidr"></a> [local\_ipv4\_network\_cidr](#input\_local\_ipv4\_network\_cidr) | The IPv4 CIDR on the customer gateway (on-premises) side of the VPN connection. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_local_ipv6_network_cidr"></a> [local\_ipv6\_network\_cidr](#input\_local\_ipv6\_network\_cidr) | The IPv6 CIDR on the customer gateway (on-premises) side of the VPN connection. | `string` | `"::/0"` | no |
| <a name="input_outside_ip_address_type"></a> [outside\_ip\_address\_type](#input\_outside\_ip\_address\_type) | Indicates if a Public S2S VPN or Private S2S VPN over AWS Direct Connect. | `string` | `"PublicIpv4"` | no |
| <a name="input_remote_ipv4_network_cidr"></a> [remote\_ipv4\_network\_cidr](#input\_remote\_ipv4\_network\_cidr) | The IPv4 CIDR on the AWS side of the VPN connection. | `string` | `"0.0.0.0/0"` | no |
| <a name="input_remote_ipv6_network_cidr"></a> [remote\_ipv6\_network\_cidr](#input\_remote\_ipv6\_network\_cidr) | The IPv6 CIDR on the customer gateway (on-premises) side of the VPN connection. | `string` | `"::/0"` | no |
| <a name="input_resource_name"></a> [resource\_name](#input\_resource\_name) | Resource name that will be shown in AWS. | `string` | n/a | yes |
| <a name="input_static_routes_only"></a> [static\_routes\_only](#input\_static\_routes\_only) | Whether the VPN connection uses static routes exclusively. Static routes must be used for devices that don't support BGP. | `bool` | `false` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource key value tags. | `map(string)` | `{}` | no |
| <a name="input_transit_gateway_id"></a> [transit\_gateway\_id](#input\_transit\_gateway\_id) | The ID of the EC2 Transit Gateway. | `string` | `null` | no |
| <a name="input_transport_transit_gateway_attachment_id"></a> [transport\_transit\_gateway\_attachment\_id](#input\_transport\_transit\_gateway\_attachment\_id) | The attachment ID of the Transit Gateway attachment to Direct Connect Gateway. The ID is obtained through a data source only. | `string` | `null` | no |
| <a name="input_tunnel1_dpd_timeout_action"></a> [tunnel1\_dpd\_timeout\_action](#input\_tunnel1\_dpd\_timeout\_action) | The action to take after DPD timeout occurs for the first VPN tunnel. Specify restart to restart the IKE initiation. Specify clear to end the IKE session. | `string` | `"clear"` | no |
| <a name="input_tunnel1_dpd_timeout_seconds"></a> [tunnel1\_dpd\_timeout\_seconds](#input\_tunnel1\_dpd\_timeout\_seconds) | The number of seconds after which a DPD timeout occurs for the first VPN tunnel. | `number` | `30` | no |
| <a name="input_tunnel1_ike_versions"></a> [tunnel1\_ike\_versions](#input\_tunnel1\_ike\_versions) | The IKE versions that are permitted for the first VPN tunnel. | `list(string)` | `null` | no |
| <a name="input_tunnel1_inside_cidr"></a> [tunnel1\_inside\_cidr](#input\_tunnel1\_inside\_cidr) | The CIDR block of the inside IP addresses for the first VPN tunnel. | `string` | `null` | no |
| <a name="input_tunnel1_inside_ipv6_cidr"></a> [tunnel1\_inside\_ipv6\_cidr](#input\_tunnel1\_inside\_ipv6\_cidr) | The range of inside IPv6 addresses for the first VPN tunnel. | `string` | `null` | no |
| <a name="input_tunnel1_phase1_dh_group_numbers"></a> [tunnel1\_phase1\_dh\_group\_numbers](#input\_tunnel1\_phase1\_dh\_group\_numbers) | List of one or more Diffie-Hellman group numbers that are permitted for the first VPN tunnel for phase 1 IKE negotiations. | `list(number)` | `null` | no |
| <a name="input_tunnel1_phase1_encryption_algorithms"></a> [tunnel1\_phase1\_encryption\_algorithms](#input\_tunnel1\_phase1\_encryption\_algorithms) | List of one or more encryption algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. | `list(string)` | `null` | no |
| <a name="input_tunnel1_phase1_integrity_algorithms"></a> [tunnel1\_phase1\_integrity\_algorithms](#input\_tunnel1\_phase1\_integrity\_algorithms) | One or more integrity algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. | `list(string)` | `null` | no |
| <a name="input_tunnel1_phase1_lifetime_seconds"></a> [tunnel1\_phase1\_lifetime\_seconds](#input\_tunnel1\_phase1\_lifetime\_seconds) | The lifetime for phase 1 of the IKE negotiation for the first VPN tunnel | `number` | `28800` | no |
| <a name="input_tunnel1_phase2_dh_group_numbers"></a> [tunnel1\_phase2\_dh\_group\_numbers](#input\_tunnel1\_phase2\_dh\_group\_numbers) | List of one or more Diffie-Hellman group numbers that are permitted for the first VPN tunnel for phase 2 IKE negotiations. | `list(number)` | `null` | no |
| <a name="input_tunnel1_phase2_encryption_algorithms"></a> [tunnel1\_phase2\_encryption\_algorithms](#input\_tunnel1\_phase2\_encryption\_algorithms) | List of one or more encryption algorithms that are permitted for the first VPN tunnel for phase 2 IKE negotiations. | `list(string)` | `null` | no |
| <a name="input_tunnel1_phase2_integrity_algorithms"></a> [tunnel1\_phase2\_integrity\_algorithms](#input\_tunnel1\_phase2\_integrity\_algorithms) | List of one or more integrity algorithms that are permitted for the first VPN tunnel for phase 2 IKE negotiations. | `list(string)` | `null` | no |
| <a name="input_tunnel1_phase2_lifetime_seconds"></a> [tunnel1\_phase2\_lifetime\_seconds](#input\_tunnel1\_phase2\_lifetime\_seconds) | n/a | `number` | `3600` | no |
| <a name="input_tunnel1_preshared_key"></a> [tunnel1\_preshared\_key](#input\_tunnel1\_preshared\_key) | The preshared key of the first VPN tunnel. | `string` | n/a | yes |
| <a name="input_tunnel1_rekey_fuzz_percentage"></a> [tunnel1\_rekey\_fuzz\_percentage](#input\_tunnel1\_rekey\_fuzz\_percentage) | The percentage of the rekey window for the first VPN tunnel during which the rekey time is randomly selected. | `number` | `100` | no |
| <a name="input_tunnel1_rekey_margin_time_seconds"></a> [tunnel1\_rekey\_margin\_time\_seconds](#input\_tunnel1\_rekey\_margin\_time\_seconds) | The margin time, in seconds, before the phase 2 lifetime expires, during which the AWS side of the first VPN connection performs an IKE rekey. | `number` | `540` | no |
| <a name="input_tunnel1_replay_window_size"></a> [tunnel1\_replay\_window\_size](#input\_tunnel1\_replay\_window\_size) | The number of packets in an IKE replay window for the first VPN tunnel. | `number` | `1024` | no |
| <a name="input_tunnel1_startup_action"></a> [tunnel1\_startup\_action](#input\_tunnel1\_startup\_action) | The action to take when the establishing the tunnel for the first VPN connection. | `string` | `"add"` | no |
| <a name="input_tunnel2_dpd_timeout_action"></a> [tunnel2\_dpd\_timeout\_action](#input\_tunnel2\_dpd\_timeout\_action) | The action to take after DPD timeout occurs for the first VPN tunnel. Specify restart to restart the IKE initiation. Specify clear to end the IKE session. | `string` | `"clear"` | no |
| <a name="input_tunnel2_dpd_timeout_seconds"></a> [tunnel2\_dpd\_timeout\_seconds](#input\_tunnel2\_dpd\_timeout\_seconds) | The number of seconds after which a DPD timeout occurs for the first VPN tunnel. | `number` | `30` | no |
| <a name="input_tunnel2_ike_versions"></a> [tunnel2\_ike\_versions](#input\_tunnel2\_ike\_versions) | The IKE versions that are permitted for the first VPN tunnel. | `list(string)` | `null` | no |
| <a name="input_tunnel2_inside_cidr"></a> [tunnel2\_inside\_cidr](#input\_tunnel2\_inside\_cidr) | The CIDR block of the inside IP addresses for the first VPN tunnel. | `string` | `null` | no |
| <a name="input_tunnel2_inside_ipv6_cidr"></a> [tunnel2\_inside\_ipv6\_cidr](#input\_tunnel2\_inside\_ipv6\_cidr) | The range of inside IPv6 addresses for the first VPN tunnel. | `string` | `null` | no |
| <a name="input_tunnel2_phase1_dh_group_numbers"></a> [tunnel2\_phase1\_dh\_group\_numbers](#input\_tunnel2\_phase1\_dh\_group\_numbers) | List of one or more Diffie-Hellman group numbers that are permitted for the second VPN tunnel for phase 1 IKE negotiations. | `list(number)` | `null` | no |
| <a name="input_tunnel2_phase1_encryption_algorithms"></a> [tunnel2\_phase1\_encryption\_algorithms](#input\_tunnel2\_phase1\_encryption\_algorithms) | List of one or more encryption algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. | `list(string)` | `null` | no |
| <a name="input_tunnel2_phase1_integrity_algorithms"></a> [tunnel2\_phase1\_integrity\_algorithms](#input\_tunnel2\_phase1\_integrity\_algorithms) | One or more integrity algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations. | `list(string)` | `null` | no |
| <a name="input_tunnel2_phase1_lifetime_seconds"></a> [tunnel2\_phase1\_lifetime\_seconds](#input\_tunnel2\_phase1\_lifetime\_seconds) | The lifetime for phase 1 of the IKE negotiation for the second VPN tunnel | `number` | `28800` | no |
| <a name="input_tunnel2_phase2_dh_group_numbers"></a> [tunnel2\_phase2\_dh\_group\_numbers](#input\_tunnel2\_phase2\_dh\_group\_numbers) | List of one or more Diffie-Hellman group numbers that are permitted for the first VPN tunnel for phase 2 IKE negotiations. | `list(number)` | `null` | no |
| <a name="input_tunnel2_phase2_encryption_algorithms"></a> [tunnel2\_phase2\_encryption\_algorithms](#input\_tunnel2\_phase2\_encryption\_algorithms) | List of one or more encryption algorithms that are permitted for the first VPN tunnel for phase 2 IKE negotiations. | `list(string)` | `null` | no |
| <a name="input_tunnel2_phase2_integrity_algorithms"></a> [tunnel2\_phase2\_integrity\_algorithms](#input\_tunnel2\_phase2\_integrity\_algorithms) | List of one or more integrity algorithms that are permitted for the first VPN tunnel for phase 2 IKE negotiations. | `list(string)` | `null` | no |
| <a name="input_tunnel2_phase2_lifetime_seconds"></a> [tunnel2\_phase2\_lifetime\_seconds](#input\_tunnel2\_phase2\_lifetime\_seconds) | n/a | `number` | `3600` | no |
| <a name="input_tunnel2_preshared_key"></a> [tunnel2\_preshared\_key](#input\_tunnel2\_preshared\_key) | The preshared key of the first VPN tunnel. | `string` | n/a | yes |
| <a name="input_tunnel2_rekey_fuzz_percentage"></a> [tunnel2\_rekey\_fuzz\_percentage](#input\_tunnel2\_rekey\_fuzz\_percentage) | The percentage of the rekey window for the first VPN tunnel during which the rekey time is randomly selected. | `number` | `100` | no |
| <a name="input_tunnel2_rekey_margin_time_seconds"></a> [tunnel2\_rekey\_margin\_time\_seconds](#input\_tunnel2\_rekey\_margin\_time\_seconds) | The margin time, in seconds, before the phase 2 lifetime expires, during which the AWS side of the first VPN connection performs an IKE rekey. | `number` | `540` | no |
| <a name="input_tunnel2_replay_window_size"></a> [tunnel2\_replay\_window\_size](#input\_tunnel2\_replay\_window\_size) | The number of packets in an IKE replay window for the second VPN tunnel. | `number` | `1024` | no |
| <a name="input_tunnel2_startup_action"></a> [tunnel2\_startup\_action](#input\_tunnel2\_startup\_action) | The action to take when the establishing the tunnel for the second VPN connection. | `string` | `"add"` | no |
| <a name="input_tunnel_inside_ip_version"></a> [tunnel\_inside\_ip\_version](#input\_tunnel\_inside\_ip\_version) | Indicate whether the VPN tunnels process IPv4 or IPv6 traffic. | `string` | `"ipv4"` | no |
| <a name="input_vpn_gateway_id"></a> [vpn\_gateway\_id](#input\_vpn\_gateway\_id) | The ID of the virtual gateway. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_customer_gateway"></a> [customer\_gateway](#output\_customer\_gateway) | AWS Customer Gateway attributes. |
| <a name="output_vpn_connection"></a> [vpn\_connection](#output\_vpn\_connection) | AWS VPN Connection attributes. |
<!-- END_TF_DOCS -->