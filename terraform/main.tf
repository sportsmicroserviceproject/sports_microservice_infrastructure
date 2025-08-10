# Data source to get your existing SSH key
data "hcloud_ssh_key" "existing_key" {
  name = var.ssh_key_name #references the variable
}

# Create (or import) your existing server
resource "hcloud_server" "sports_microservices" {
  name        = var.server_name
  image       = "ubuntu-24.04"
  server_type = var.server_type
  location    = var.location
  
  ssh_keys = [data.hcloud_ssh_key.existing_key.id]
  
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  
  labels = {
    project = "sports-microservices"
    managed_by = "terraform"
  }
}