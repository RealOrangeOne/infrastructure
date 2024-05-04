resource "local_file" "hosts" {
  content = yamlencode({
    vps_hosts : {
      casey_ip : linode_instance.casey.ip_address,
      private_ipv6_marker : local.private_ipv6_marker,
      private_ipv6_range : local.private_ipv6_range,
      walker_ip : hcloud_server.walker.ipv4_address,
    }
  })
  filename = "${path.module}/../ansible/group_vars/all/vps-hosts.yml"
}
