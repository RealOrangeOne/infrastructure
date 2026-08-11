resource "local_file" "hosts" {
  content = yamlencode({
    vps_hosts : {
      casey_ip : linode_instance.casey.ip_address,
      walker_ip : hcloud_server.walker.ipv4_address,
      grimes_ip : hcloud_server.grimes.ipv4_address,
    }
  })
  filename = "${path.module}/../ansible/group_vars/all/vps-hosts.yml"
}
