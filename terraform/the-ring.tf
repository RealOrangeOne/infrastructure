resource "linode_lke_cluster" "the-ring" {
  label       = "the-ring"
  k8s_version = "1.22"
  region      = "eu-west"

  pool {
    type  = "g6-standard-1"
    count = 1
  }
}

resource "linode_firewall" "the-ring" {
  label = "the-ring"
  linodes = [
    for node in linode_lke_cluster.the-ring.pool[0].nodes :
    node.instance_id
  ]
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
    label    = "allow-k8s-unprivileged"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "30000-32767"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }
}
