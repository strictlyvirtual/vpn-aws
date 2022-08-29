output "customer_gateway" {
  description = "AWS Customer Gateway attributes."
  value       = aws_customer_gateway.this
}

output "vpn_connection" {
  description = "AWS VPN Connection attributes."
  value       = aws_vpn_connection.this
}