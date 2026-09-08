resource "proxmox_virtual_environment_vm" "ubuntu_24_04_template" {
  name        = "ubuntu-2404-template"
  description = "Ubuntu Server 24.04 LTS cloud image template managed by Terraform"
  tags        = ["terraform", "ubuntu", "template"]

  node_name = "servertron-1"
  vm_id     = 9000

  template = true
  started  = false
  on_boot  = false

  cpu {
    cores = 2
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "local-zfs"
    file_id      = proxmox_download_file.ubuntu_24_04_cloud_image.id
    interface    = "scsi0"
    discard      = "on"
    size         = 20
  }

  initialization {
    datastore_id = "local-zfs"

    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = "l26"
  }

  serial_device {}
}