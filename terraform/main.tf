#############################################
# Import-friendly config for EXISTING server
# - No firewall/load balancer resources
# - Minimal args, strong destroy guards
# - Safe ignore_changes to avoid replacements
#############################################

data "hcloud_ssh_key" "existing_key" {
  name = var.ssh_key_name
}

resource "hcloud_server" "sports_microservices" {
  name        = var.server_name
  server_type = var.server_type   # used only on create
  location    = var.location      # used only on create

  # Helpful but not required; ignore drift during import
  ssh_keys = [data.hcloud_ssh_key.existing_key.id]

  # Optional: keep these to document reality; we ignore drift first
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }

  labels = {
    project     = "sports-microservices"
    managed_by  = "terraform"
  }

  # No hcloud_firewall / load balancer by design (Caddy handles SSL/routing)

  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      image,       # not set post-create
      ssh_keys,    # may be changed manually
      user_data,   # Ansible/Caddy may write this later
      labels,      # align later, avoid churn now
      backups,     # avoid surprise toggles
      public_net,  # nested block drift ignored until reconciled
    ]
  }
}