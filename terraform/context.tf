resource "local_file" "hosts" {
  content = yamlencode({
    hosts : {
      casey_ip : vultr_server.casey.main_ip
    }
  })
  filename = "${path.module}/../ansible/group_vars/all/hosts.yml"
}
