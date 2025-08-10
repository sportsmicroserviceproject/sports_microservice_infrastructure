# main.tf

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
  
  # This matches your current server configuration
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  
  labels = {
    project = "sports-microservices"
    managed_by = "terraform"
  }
}

# Create firewall rules (matching your current setup)
resource "hcloud_firewall" "sports_firewall" {
  name = "sports-microservices-firewall"
  
  rule {
    direction = "in"
    port      = "22"
    protocol  = "tcp"
    source_ips = ["0.0.0.0/0", "::/0"]
  }
  
  rule {
    direction = "in"
    port      = "80"
    protocol  = "tcp"
    source_ips = ["0.0.0.0/0", "::/0"]
  }
  
  rule {
    direction = "in"
    port      = "443"
    protocol  = "tcp"
    source_ips = ["0.0.0.0/0", "::/0"]
  }
}

# Attach firewall to server
resource "hcloud_firewall_attachment" "sports_firewall_attachment" {
  firewall_id = hcloud_firewall.sports_firewall.id
  server_ids  = [hcloud_server.sports_microservices.id]
}