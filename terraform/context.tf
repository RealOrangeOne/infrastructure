resource "local_file" "hosts" {
  content = yamlencode({
    hosts : {
      casey_ip : linode_instance.casey.ip_address,
      walker_ip : vultr_instance.walker.main_ip,
      grimes_ip : vultr_instance.grimes.main_ip,
      decker_ip : linode_instance.decker.ip_address,
    }
  })
  filename = "${path.module}/../ansible/group_vars/all/hosts.yml"
}
