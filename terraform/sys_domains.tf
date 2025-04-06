resource "gandi_livedns_record" "sys_domain_casey" {
  zone = data.gandi_livedns_domain.theorangeonenet.id
  name = "casey.sys"
  type = "A"
  ttl  = 3600
  values = [
    linode_instance.casey.ip_address
  ]
}

resource "gandi_livedns_record" "sys_domain_casey_v6" {
  zone = data.gandi_livedns_domain.theorangeonenet.id
  name = "casey.sys"
  type = "AAAA"
  ttl  = 3600
  values = [
    split("/", linode_instance.casey.ipv6)[0]
  ]
}

resource "gandi_livedns_record" "sys_domain_walker" {
  zone = data.gandi_livedns_domain.theorangeonenet.id
  name = "walker.sys"
  type = "A"
  ttl  = 3600
  values = [
    hcloud_server.walker.ipv4_address
  ]
}

resource "gandi_livedns_record" "sys_domain_walker_v6" {
  zone = data.gandi_livedns_domain.theorangeonenet.id
  name = "walker.sys"
  type = "AAAA"
  ttl  = 3600
  values = [
    hcloud_server.walker.ipv6_address
  ]
}

resource "gandi_livedns_record" "sys_domain_pve" {
  zone = data.gandi_livedns_domain.theorangeonenet.id
  name = "pve.sys"
  type = "A"
  ttl  = 3600
  values = [
    linode_instance.casey.ip_address
  ]
}

resource "gandi_livedns_record" "sys_domain_pve_private" {
  zone = data.gandi_livedns_domain.theorangeonenet.id
  name = "pve-private.sys"
  type = "AAAA"
  ttl  = 3600
  values = [
    local.private_ipv6_marker
  ]
}
