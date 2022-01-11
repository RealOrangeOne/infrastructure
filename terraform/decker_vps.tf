module "decker_firewall" {
  source = "./vultr_firewall/"

  description = "decker"
  ports = [
    "80/tcp",
    "443/tcp",
  ]
}


resource "vultr_instance" "decker" {
  plan              = "vc2-1c-1gb"
  region            = "cdg"
  hostname          = "decker"
  firewall_group_id = module.decker_firewall.firewall_group.id
}


# Linode

resource "linode_instance" "decker" {
  label      = "decker"
  image      = "linode/arch"
  region     = "eu-central"
  type       = "g6-nanode-1"
  private_ip = true
}

resource "linode_firewall" "decker" {
  label           = "decker"
  linodes         = [linode_instance.decker.id]
  outbound_policy = "ACCEPT"
  inbound_policy  = "DROP"

  inbound {
    label    = "allow-ping"
    action   = "ACCEPT"
    protocol = "ICMP"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-inbound-https"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "443"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-inbound-http"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "80"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }
}
