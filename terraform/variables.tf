variable "hcloud_token" {
  description = "Hetzner Cloud API token (use env var HCLOUD_TOKEN or TF_VAR_hcloud_token)"
  type        = string
  sensitive   = true
}

variable "server_name" {
  description = "Name of the server to manage/import"
  type        = string
  default     = "sports-microservices"
}

variable "server_type" {
  description = "Server type/size (kept here for documentation; ignored the imports)"
  type        = string
  default     = "cx22"
}

variable "location" {
  description = "Server location (kept here for documentation; ignored for imports)"
  type        = string
  default     = "hel1"
}

variable "ssh_key_name" {
  description = "Name of the SSH key in Hetzner Cloud Console (for documentation/state)"
  type        = string
  # No default = MUST be provided in terraform.tfvars
}