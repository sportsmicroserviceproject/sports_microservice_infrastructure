# variables.tf
variable "hcloud_token" {
  description = "Hetzner Cloud API token"
  type        = string
  sensitive   = true
}

variable "server_name" {
  description = "Name of the server"
  type        = string
  default     = "sports-microservices"
}

variable "server_type" {
  description = "Server type (size)"
  type        = string
  default     = "cx22"  # Your current server type
}

variable "location" {
  description = "Server location"
  type        = string
  default     = "hel1"  # Helsinki (your current location)
}

variable "ssh_key_name" {
  description = "Name of the SSH key in Hetzner Console"
  type        = string
  # No default = MUST be provided in terraform.tfvars
}