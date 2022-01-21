module "casey_firewall" {
  source = "./vultr_firewall/"

  description = "casey"
  ports = [
    "80/tcp",
    "443/tcp",
    "51820/udp",
    "8448/tcp",
    "6328/udp"
  ]
}

resource "vultr_instance" "casey" {
  plan              = "" # On a plan unsupported by API
  region            = "lhr"
  hostname          = "casey"
  firewall_group_id = module.casey_firewall.firewall_group.id
}

# Linode

resource "linode_instance" "casey" {
  label      = "casey"
  image      = "linode/arch"
  region     = "eu-west"
  type       = "g6-nanode-1"
  private_ip = true
}

resource "linode_firewall" "casey" {
  label           = "casey"
  linodes         = [linode_instance.casey.id]
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

  inbound {
    label    = "allow-inbound-wireguard"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "51820"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-inbound-nebula"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "6328"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-inbound-matrix"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "8448"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }
}

resource "linode_rdns" "casey_reverse_ipv4" {
  address = linode_instance.casey.ip_address
  rdns    = "casey.sys.theorangeone.net"
}
