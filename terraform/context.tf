resource "local_file" "hosts" {
  content = yamlencode({
    vps_hosts : {
      casey_ip : linode_instance.casey.ip_address,
      walker_ip : vultr_instance.walker.main_ip,
      grimes_ip : vultr_instance.grimes.main_ip,
    }
  })
  filename = "${path.module}/../ansible/group_vars/all/vps-hosts.yml"
}
