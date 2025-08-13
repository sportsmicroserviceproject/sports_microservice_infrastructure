variable "hcloud_token" {
  description = "Hetzner Cloud API token (use env var HCLOUD_TOKEN or TF_VAR_hcloud_token)"
  type        = string
  sensitive   = true
}

variable "server_name" {
  description = "Name of the server to manage/import"
  type        = string
  # No default = MUST be provided in terraform.tfvars
}

variable "server_type" {
  description = "Server type/size (kept here for documentation; ignored the imports)"
  type        = string
  # No default = MUST be provided in terraform.tfvars
}

variable "location" {
  description = "Server location (kept here for documentation; ignored for imports)"
  type        = string
  # No default = MUST be provided in terraform.tfvars
}

variable "ssh_key_name" {
  description = "Name of the SSH key in Hetzner Cloud Console (for documentation/state)"
  type        = string
  # No default = MUST be provided in terraform.tfvars
}