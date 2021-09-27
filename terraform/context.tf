resource "local_file" "hosts" {
  content = yamlencode({
    hosts : {
      casey_ip : vultr_instance.casey.main_ip,
      walker_ip : vultr_instance.walker.main_ip,
      grimes_ip : vultr_instance.grimes.main_ip,
      decker_ip : vultr_instance.decker.main_ip,
    }
  })
  filename = "${path.module}/../ansible/group_vars/all/hosts.yml"
}
