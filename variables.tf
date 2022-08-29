variable "resource_name" {
  description = "Resource name that will be shown in AWS."
  type        = string
}

// aws_customer_gateway
variable "bgp_asn" {
  description = " The gateway's Border Gateway Protocol (BGP) Autonomous System Number (ASN)."
  type        = string
}

variable "certificate_arn" {
  description = "The Amazon Resource Name (ARN) for the customer gateway certificate."
  type        = string
  default     = null
}

variable "device_name" {
  description = "A name for the customer gateway device."
  type        = string
  default     = null
}

variable "ip_address" {
  description = "The IPv4 address for the customer gateway device's outside interface."
  type        = string
}

// aws_vpn_connection
variable "transit_gateway_id" {
  description = "The ID of the EC2 Transit Gateway."
  type        = string
  default     = null
}

variable "vpn_gateway_id" {
  description = "The ID of the virtual gateway."
  type        = string
  default     = null
}

variable "static_routes_only" {
  description = "Whether the VPN connection uses static routes exclusively. Static routes must be used for devices that don't support BGP."
  type        = bool
  default     = false
}

variable "enable_acceleration" {
  description = "Indicate whether to enable acceleration for the VPN connection. Supports only EC2 Transit Gateway."
  type        = bool
  default     = false
}

variable "local_ipv4_network_cidr" {
  description = "The IPv4 CIDR on the customer gateway (on-premises) side of the VPN connection."
  type        = string
  default     = "0.0.0.0/0"
}
variable "local_ipv6_network_cidr" {
  description = "The IPv6 CIDR on the customer gateway (on-premises) side of the VPN connection."
  type        = string
  default     = "::/0"
}

variable "outside_ip_address_type" {
  description = "Indicates if a Public S2S VPN or Private S2S VPN over AWS Direct Connect."
  type        = string
  default     = "PublicIpv4"

  validation {
    condition     = contains(["PublicIpv4", "PrivateIpv4"], var.outside_ip_address_type)
    error_message = "Valid values are PublicIpv4 | PrivateIpv4"
  }
}

variable "remote_ipv4_network_cidr" {
  description = "The IPv4 CIDR on the AWS side of the VPN connection."
  type        = string
  default     = "0.0.0.0/0"
}

variable "remote_ipv6_network_cidr" {
  description = "The IPv6 CIDR on the customer gateway (on-premises) side of the VPN connection."
  type        = string
  default     = "::/0"
}

variable "transport_transit_gateway_attachment_id" {
  description = "The attachment ID of the Transit Gateway attachment to Direct Connect Gateway. The ID is obtained through a data source only."
  type        = string
  default     = null
}

variable "tunnel_inside_ip_version" {
  description = "Indicate whether the VPN tunnels process IPv4 or IPv6 traffic."
  type        = string
  default     = "ipv4"

  validation {
    condition     = contains(["ipv4", "ipv6"], var.tunnel_inside_ip_version)
    error_message = "Valid values are ipv4 | ipv6"
  }
}

variable "tunnel1_inside_cidr" {
  description = "The CIDR block of the inside IP addresses for the first VPN tunnel."
  type        = string
  default     = null

  validation {
    condition     = var.tunnel1_inside_cidr == null || can(regex("/", var.tunnel1_inside_cidr)) && alltrue([can(regex("^169.254.[0-2][0-4][0-9]?.[0-2][0-4][0-9]?", split("/", var.tunnel1_inside_cidr)[0])), can(split("/", var.tunnel1_inside_cidr)[0] == 30)])
    error_message = "Valid value is a size /30 CIDR block from the 169.254.0.0/16 range."
  }
}

variable "tunnel2_inside_cidr" {
  description = "The CIDR block of the inside IP addresses for the first VPN tunnel."
  type        = string
  default     = null

  validation {
    condition     = var.tunnel2_inside_cidr == null || can(regex("/", var.tunnel2_inside_cidr)) && alltrue([can(regex("^169.254.[0-2][0-4][0-9]?.[0-2][0-4][0-9]?", split("/", var.tunnel2_inside_cidr)[0])), can(split("/", var.tunnel2_inside_cidr)[0] == 30)])
    error_message = "Valid value is a size /30 CIDR block from the 169.254.0.0/16 range."
  }
}

variable "tunnel1_inside_ipv6_cidr" {
  description = "The range of inside IPv6 addresses for the first VPN tunnel."
  type        = string
  default     = null
}

variable "tunnel2_inside_ipv6_cidr" {
  description = "The range of inside IPv6 addresses for the first VPN tunnel."
  type        = string
  default     = null
}

variable "tunnel1_preshared_key" {
  description = "The preshared key of the first VPN tunnel."
  type        = string
  sensitive   = true

  validation {
    condition     = can(length(var.tunnel1_preshared_key) > 8) && can(length(var.tunnel1_preshared_key) < 64)
    error_message = "The preshared key must be between 8 and 64 characters in length"
  }
  validation {
    condition     = !can(regex("^0", var.tunnel1_preshared_key))
    error_message = "The preshared key cannot start with zero(0)."
  }
}

variable "tunnel2_preshared_key" {
  description = "The preshared key of the first VPN tunnel."
  type        = string
  sensitive   = true

  validation {
    condition     = can(length(var.tunnel2_preshared_key) > 8) && can(length(var.tunnel2_preshared_key) < 64)
    error_message = "The preshared key must be between 8 and 64 characters in length"
  }
  validation {
    condition     = !can(regex("^0", var.tunnel2_preshared_key))
    error_message = "The preshared key cannot start with zero(0)."
  }
}

variable "tunnel1_dpd_timeout_action" {
  description = "The action to take after DPD timeout occurs for the first VPN tunnel. Specify restart to restart the IKE initiation. Specify clear to end the IKE session."
  type        = string
  default     = "clear"

  validation {
    condition     = contains(["clear", "none", "estart"], var.tunnel1_dpd_timeout_action)
    error_message = "Valid values are clear | none | restart."
  }
}

variable "tunnel2_dpd_timeout_action" {
  description = "The action to take after DPD timeout occurs for the first VPN tunnel. Specify restart to restart the IKE initiation. Specify clear to end the IKE session."
  type        = string
  default     = "clear"

  validation {
    condition     = contains(["clear", "none", "estart"], var.tunnel2_dpd_timeout_action)
    error_message = "Valid values are clear | none | restart."
  }
}

variable "tunnel1_dpd_timeout_seconds" {
  description = "The number of seconds after which a DPD timeout occurs for the first VPN tunnel."
  type        = number
  default     = 30

  validation {
    condition     = can(var.tunnel1_dpd_timeout_seconds >= 30)
    error_message = "Valid value is equal or higher than 30."
  }
}

variable "tunnel2_dpd_timeout_seconds" {
  description = "The number of seconds after which a DPD timeout occurs for the first VPN tunnel."
  type        = number
  default     = 30

  validation {
    condition     = can(var.tunnel2_dpd_timeout_seconds >= 30)
    error_message = "Valid value is equal or higher than 30."
  }
}

variable "tunnel1_ike_versions" {
  description = "The IKE versions that are permitted for the first VPN tunnel."
  type        = list(string)
  default     = null

  validation {
    condition     = can(var.tunnel1_ike_versions == null) || try(length(setintersection(["ikev1", "ikev2"], var.tunnel1_ike_versions)) > 0)
    error_message = "Valid values are ikev1 | ikev2."
  }
}

variable "tunnel2_ike_versions" {
  description = "The IKE versions that are permitted for the first VPN tunnel."
  type        = list(string)
  default     = null

  validation {
    condition     = can(var.tunnel2_ike_versions == null) || try(length(setintersection(["ikev1", "ikev2"], var.tunnel2_ike_versions)) > 0)
    error_message = "Valid values are ikev1 | ikev2."
  }
}

variable "tunnel1_phase1_dh_group_numbers" {
  description = "List of one or more Diffie-Hellman group numbers that are permitted for the first VPN tunnel for phase 1 IKE negotiations."
  type        = list(number)
  default     = null

  validation {
    condition     = can(var.tunnel1_phase1_dh_group_numbers == null) || try(length(setintersection([2, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24], var.tunnel1_phase1_dh_group_numbers)) > 0)
    error_message = "Valid values are [2,14,15,16,17,18,19,20,21,22,23,24]"
  }
}

variable "tunnel2_phase1_dh_group_numbers" {
  description = "List of one or more Diffie-Hellman group numbers that are permitted for the second VPN tunnel for phase 1 IKE negotiations."
  type        = list(number)
  default     = null

  validation {
    condition     = can(var.tunnel2_phase1_dh_group_numbers == null) || try(length(setintersection([2, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24], var.tunnel2_phase1_dh_group_numbers)) > 0)
    error_message = "Valid values are [2,14,15,16,17,18,19,20,21,22,23,24]"
  }
}

variable "tunnel1_phase1_encryption_algorithms" {
  description = "List of one or more encryption algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations."
  type        = list(string)
  default     = null

  validation {
    condition     = can(var.tunnel1_phase1_encryption_algorithms == null) || try(length(setintersection(["AES128", "AES256", "AES128-GCM-16", "AES256-GCM-16"], var.tunnel1_phase1_encryption_algorithms)) > 0)
    error_message = "Valid values are AES128 | AES256 | AES128-GCM-16 | AES256-GCM-16"
  }
}

variable "tunnel2_phase1_encryption_algorithms" {
  description = "List of one or more encryption algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations."
  type        = list(string)
  default     = null

  validation {
    condition     = can(var.tunnel2_phase1_encryption_algorithms == null) || try(length(setintersection(["AES128", "AES256", "AES128-GCM-16", "AES256-GCM-16"], var.tunnel2_phase1_encryption_algorithms)) > 0)
    error_message = "Valid values are AES128 | AES256 | AES128-GCM-16 | AES256-GCM-16"
  }
}

variable "tunnel1_phase1_integrity_algorithms" {
  description = "One or more integrity algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations."
  type        = list(string)
  default     = null

  validation {
    condition     = can(var.tunnel1_phase1_integrity_algorithms == null) || try(length(setintersection(["SHA1", "SHA2-256", "SHA2-384", "SHA2-512"], var.tunnel1_phase1_integrity_algorithms)) > 0)
    error_message = "Valid values are SHA1 | SHA2-256 | SHA2-384 | SHA2-512."
  }
}

variable "tunnel2_phase1_integrity_algorithms" {
  description = "One or more integrity algorithms that are permitted for the first VPN tunnel for phase 1 IKE negotiations."
  type        = list(string)
  default     = null

  validation {
    condition     = can(var.tunnel2_phase1_integrity_algorithms == null) || try(length(setintersection(["SHA1", "SHA2-256", "SHA2-384", "SHA2-512"], var.tunnel2_phase1_integrity_algorithms)) > 0)
    error_message = "Valid values are SHA1 | SHA2-256 | SHA2-384 | SHA2-512."
  }
}

variable "tunnel1_phase1_lifetime_seconds" {
  description = "The lifetime for phase 1 of the IKE negotiation for the first VPN tunnel"
  type        = number
  default     = 28800

  validation {
    condition     = try(var.tunnel1_phase1_lifetime_seconds > 900) && try(var.tunnel1_phase1_lifetime_seconds <= 28800)
    error_message = "Valid value is between 900 and 28800."
  }
}

variable "tunnel2_phase1_lifetime_seconds" {
  description = "The lifetime for phase 1 of the IKE negotiation for the second VPN tunnel"
  type        = number
  default     = 28800

  validation {
    condition     = try(var.tunnel2_phase1_lifetime_seconds > 900) && try(var.tunnel2_phase1_lifetime_seconds <= 28800)
    error_message = "Valid value is between 900 and 28800."
  }
}

variable "tunnel1_phase2_dh_group_numbers" {
  description = "List of one or more Diffie-Hellman group numbers that are permitted for the first VPN tunnel for phase 2 IKE negotiations."
  type        = list(number)
  default     = null

  validation {
    condition     = can(var.tunnel1_phase2_dh_group_numbers == null) || try(length(setintersection([2, 5, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24], var.tunnel1_phase2_dh_group_numbers)) > 0)
    error_message = "Valid values are 2 | 5 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24."
  }
}

variable "tunnel2_phase2_dh_group_numbers" {
  description = "List of one or more Diffie-Hellman group numbers that are permitted for the first VPN tunnel for phase 2 IKE negotiations."
  type        = list(number)
  default     = null

  validation {
    condition     = can(var.tunnel2_phase2_dh_group_numbers == null) || try(length(setintersection([2, 5, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24], var.tunnel2_phase2_dh_group_numbers)) > 0)
    error_message = "Valid values are 2 | 5 | 14 | 15 | 16 | 17 | 18 | 19 | 20 | 21 | 22 | 23 | 24."
  }
}

variable "tunnel1_phase2_encryption_algorithms" {
  description = "List of one or more encryption algorithms that are permitted for the first VPN tunnel for phase 2 IKE negotiations."
  type        = list(string)
  default     = null

  validation {
    condition     = can(var.tunnel1_phase2_encryption_algorithms == null) || try(length(setintersection(["AES128", "AES256", "AES128-GCM-16", "AES256-GCM-16"], var.tunnel1_phase2_encryption_algorithms)) > 0)
    error_message = "Valid values are AES128 | AES256 | AES128-GCM-16 | AES256-GCM-16."
  }
}

variable "tunnel2_phase2_encryption_algorithms" {
  description = "List of one or more encryption algorithms that are permitted for the first VPN tunnel for phase 2 IKE negotiations."
  type        = list(string)
  default     = null

  validation {
    condition     = can(var.tunnel2_phase2_encryption_algorithms == null) || try(length(setintersection(["AES128", "AES256", "AES128-GCM-16", "AES256-GCM-16"], var.tunnel2_phase2_encryption_algorithms)) > 0)
    error_message = "Valid values are AES128 | AES256 | AES128-GCM-16 | AES256-GCM-16."
  }
}

variable "tunnel1_phase2_integrity_algorithms" {
  description = "List of one or more integrity algorithms that are permitted for the first VPN tunnel for phase 2 IKE negotiations."
  type        = list(string)
  default     = null

  validation {
    condition     = can(var.tunnel1_phase2_integrity_algorithms == null) || try(length(setintersection(["SHA1", "SHA2-256", "SHA2-384", "SHA2-512"], var.tunnel1_phase2_integrity_algorithms)) > 0)
    error_message = "Valid values are SHA1 | SHA2-256 | SHA2-384 | SHA2-512."
  }
}

variable "tunnel2_phase2_integrity_algorithms" {
  description = "List of one or more integrity algorithms that are permitted for the first VPN tunnel for phase 2 IKE negotiations."
  type        = list(string)
  default     = null

  validation {
    condition     = can(var.tunnel2_phase2_integrity_algorithms == null) || try(length(setintersection(["SHA1", "SHA2-256", "SHA2-384", "SHA2-512"], var.tunnel2_phase2_integrity_algorithms)) > 0)
    error_message = "Valid values are SHA1 | SHA2-256 | SHA2-384 | SHA2-512."
  }
}

variable "tunnel1_phase2_lifetime_seconds" {
  description = ""
  type        = number
  default     = 3600

  validation {
    condition     = try(var.tunnel1_phase2_lifetime_seconds >= 900) && try(var.tunnel1_phase2_lifetime_seconds <= 3600)
    error_message = "Valid value is between 900 and 3600"
  }
}

variable "tunnel2_phase2_lifetime_seconds" {
  description = ""
  type        = number
  default     = 3600

  validation {
    condition     = try(var.tunnel2_phase2_lifetime_seconds >= 900) && try(var.tunnel2_phase2_lifetime_seconds <= 3600)
    error_message = "Valid value is between 900 and 3600"
  }
}

variable "tunnel1_rekey_fuzz_percentage" {
  description = "The percentage of the rekey window for the first VPN tunnel during which the rekey time is randomly selected."
  type        = number
  default     = 100

  validation {
    condition     = try(var.tunnel1_rekey_fuzz_percentage >= 1) && try(var.tunnel1_rekey_fuzz_percentage <= 100)
    error_message = "Valid value is between 0 and 100."
  }
}

variable "tunnel2_rekey_fuzz_percentage" {
  description = "The percentage of the rekey window for the first VPN tunnel during which the rekey time is randomly selected."
  type        = number
  default     = 100

  validation {
    condition     = try(var.tunnel2_rekey_fuzz_percentage >= 1) && try(var.tunnel2_rekey_fuzz_percentage <= 100)
    error_message = "Valid value is between 0 and 100."
  }
}

variable "tunnel1_rekey_margin_time_seconds" {
  description = "The margin time, in seconds, before the phase 2 lifetime expires, during which the AWS side of the first VPN connection performs an IKE rekey."
  type        = number
  default     = 540

  validation {
    condition     = try(var.tunnel1_rekey_margin_time_seconds >= 60) && try(var.tunnel1_rekey_margin_time_seconds <= 1800)
    error_message = "Valid value is between 60 and half of tunnel1_phase2_lifetime_seconds"
  }
}

variable "tunnel2_rekey_margin_time_seconds" {
  description = "The margin time, in seconds, before the phase 2 lifetime expires, during which the AWS side of the first VPN connection performs an IKE rekey."
  type        = number
  default     = 540

  validation {
    condition     = try(var.tunnel2_rekey_margin_time_seconds >= 60) && try(var.tunnel2_rekey_margin_time_seconds <= 1800)
    error_message = "Valid value is between 60 and half of tunnel1_phase2_lifetime_seconds"
  }
}

variable "tunnel1_replay_window_size" {
  description = "The number of packets in an IKE replay window for the first VPN tunnel."
  type        = number
  default     = 1024

  validation {
    condition     = try(var.tunnel1_replay_window_size >= 64) && try(var.tunnel1_replay_window_size <= 2048)
    error_message = "Valid value is between 64 and 2048."
  }
}

variable "tunnel2_replay_window_size" {
  description = "The number of packets in an IKE replay window for the second VPN tunnel."
  type        = number
  default     = 1024

  validation {
    condition     = try(var.tunnel2_replay_window_size >= 64) && try(var.tunnel2_replay_window_size <= 2048)
    error_message = "Valid value is between 64 and 2048."
  }
}

variable "tunnel1_startup_action" {
  description = "The action to take when the establishing the tunnel for the first VPN connection."
  type        = string
  default     = "add"

  validation {
    condition     = contains(["add", "start"], var.tunnel1_startup_action)
    error_message = "Valid values are add | start."
  }
}

variable "tunnel2_startup_action" {
  description = "The action to take when the establishing the tunnel for the second VPN connection."
  type        = string
  default     = "add"

  validation {
    condition     = contains(["add", "start"], var.tunnel2_startup_action)
    error_message = "Valid values are add | start."
  }
}

variable "tags" {
  description = "Resource key value tags."
  type        = map(string)
  default     = {}
}