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
    label    = "allow-inbound-wireguard-53"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "53"
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

  inbound {
    label    = "allow-inbound-headscale"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "41641"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-inbound-stun"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "3478"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound {
    label    = "allow-inbound-tailscale"
    action   = "ACCEPT"
    protocol = "UDP"
    ports    = "41641"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }
}

resource "linode_rdns" "casey_reverse_ipv4" {
  address = linode_instance.casey.ip_address
  rdns    = cloudflare_record.sys_domain_casey.hostname
}

resource "linode_rdns" "casey_reverse_ipv6" {
  address = split("/", linode_instance.casey.ipv6)[0]
  rdns    = cloudflare_record.sys_domain_casey.hostname
}
