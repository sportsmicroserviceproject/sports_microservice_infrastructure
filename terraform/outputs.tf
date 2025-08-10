# outputs.tf
output "server_id" {
  description = "ID of the created server"
  value       = hcloud_server.sports_microservices.id
}

output "server_ipv4_address" {
  description = "IPv4 address of the server"
  value       = hcloud_server.sports_microservices.ipv4_address
}

output "server_ipv6_address" {
  description = "IPv6 address of the server"
  value       = hcloud_server.sports_microservices.ipv6_address
}

output "server_status" {
  description = "Status of the server"
  value       = hcloud_server.sports_microservices.status
}