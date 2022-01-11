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
