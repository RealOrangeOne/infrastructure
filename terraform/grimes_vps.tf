resource "linode_instance" "grimes" {
  label  = "grimes"
  region = "eu-central"
  type   = "g6-nanode-1"

  private_ip = true

  config {
    kernel = "linode/grub2"
    label  = "My Ubuntu 20.04 LTS Disk Profile"

    devices {
      sda {
        disk_label = "Ubuntu 20.04 LTS Disk"
      }

      sdb {
        disk_label = "512 MB Swap Image"
      }
    }
  }

  disk {
    filesystem = "ext4"
    label      = "Ubuntu 20.04 LTS Disk"
    read_only  = false
    size       = 25088
  }
  disk {
    filesystem = "swap"
    label      = "512 MB Swap Image"
    read_only  = false
    size       = 512
  }

  timeouts {}

}
