resource "aws_customer_gateway" "this" {
  bgp_asn         = var.bgp_asn
  certificate_arn = var.certificate_arn
  device_name     = var.device_name
  ip_address      = var.ip_address
  type            = "ipsec.1"
  tags            = merge(var.tags, { Name = "cg-${replace(var.resource_name, "_", "-")}" })
}


resource "aws_vpn_connection" "this" {
  customer_gateway_id                     = aws_customer_gateway.this.id
  transit_gateway_id                      = try(var.transit_gateway_id, null)
  vpn_gateway_id                          = try(var.vpn_gateway_id, null)
  type                                    = aws_customer_gateway.this.type
  static_routes_only                      = var.static_routes_only
  enable_acceleration                     = var.enable_acceleration
  local_ipv4_network_cidr                 = var.local_ipv4_network_cidr
  local_ipv6_network_cidr                 = var.local_ipv6_network_cidr
  outside_ip_address_type                 = var.outside_ip_address_type
  remote_ipv4_network_cidr                = var.remote_ipv4_network_cidr
  remote_ipv6_network_cidr                = var.remote_ipv6_network_cidr
  transport_transit_gateway_attachment_id = can(var.outside_ip_address_type == "PrivateIpv4") ? var.transport_transit_gateway_attachment_id : null

  tunnel1_inside_cidr         = var.tunnel1_inside_cidr
  tunnel1_inside_ipv6_cidr    = try(var.tunnel1_inside_ipv6_cidr, null)
  tunnel1_preshared_key       = var.tunnel1_preshared_key
  tunnel1_dpd_timeout_action  = var.tunnel1_dpd_timeout_action
  tunnel1_dpd_timeout_seconds = var.tunnel1_dpd_timeout_seconds
  tunnel1_ike_versions        = toset(var.tunnel1_ike_versions)

  tunnel2_inside_cidr         = var.tunnel2_inside_cidr
  tunnel2_inside_ipv6_cidr    = try(var.tunnel2_inside_ipv6_cidr, null)
  tunnel2_preshared_key       = var.tunnel2_preshared_key
  tunnel2_dpd_timeout_action  = var.tunnel2_dpd_timeout_action
  tunnel2_dpd_timeout_seconds = var.tunnel2_dpd_timeout_seconds
  tunnel2_ike_versions        = toset(var.tunnel2_ike_versions)

  // phase1
  tunnel1_phase1_dh_group_numbers      = var.tunnel1_phase1_dh_group_numbers
  tunnel1_phase1_encryption_algorithms = var.tunnel1_phase1_encryption_algorithms
  tunnel1_phase1_integrity_algorithms  = var.tunnel1_phase1_integrity_algorithms
  tunnel1_phase1_lifetime_seconds      = var.tunnel1_phase1_lifetime_seconds

  tunnel2_phase1_dh_group_numbers      = var.tunnel2_phase1_dh_group_numbers
  tunnel2_phase1_encryption_algorithms = var.tunnel2_phase1_encryption_algorithms
  tunnel2_phase1_integrity_algorithms  = var.tunnel2_phase1_integrity_algorithms
  tunnel2_phase1_lifetime_seconds      = var.tunnel2_phase1_lifetime_seconds

  // phase2
  tunnel1_phase2_dh_group_numbers      = var.tunnel1_phase2_dh_group_numbers
  tunnel1_phase2_encryption_algorithms = var.tunnel1_phase2_encryption_algorithms
  tunnel1_phase2_integrity_algorithms  = var.tunnel1_phase2_integrity_algorithms
  tunnel1_phase2_lifetime_seconds      = var.tunnel1_phase2_lifetime_seconds
  tunnel1_rekey_fuzz_percentage        = var.tunnel1_rekey_fuzz_percentage
  tunnel1_rekey_margin_time_seconds    = var.tunnel1_rekey_margin_time_seconds
  tunnel1_replay_window_size           = var.tunnel1_replay_window_size
  tunnel1_startup_action               = var.tunnel1_startup_action

  tunnel2_phase2_dh_group_numbers      = var.tunnel2_phase2_dh_group_numbers
  tunnel2_phase2_encryption_algorithms = var.tunnel2_phase2_encryption_algorithms
  tunnel2_phase2_integrity_algorithms  = var.tunnel2_phase2_integrity_algorithms
  tunnel2_phase2_lifetime_seconds      = var.tunnel2_phase2_lifetime_seconds
  tunnel2_rekey_fuzz_percentage        = var.tunnel2_rekey_fuzz_percentage
  tunnel2_rekey_margin_time_seconds    = var.tunnel2_rekey_margin_time_seconds
  tunnel2_replay_window_size           = var.tunnel2_replay_window_size
  tunnel2_startup_action               = var.tunnel2_startup_action

  tags = merge(var.tags, { Name = "vpn-${replace(var.resource_name, "_", "-")}" })

  depends_on = [
    aws_customer_gateway.this
  ]
}
