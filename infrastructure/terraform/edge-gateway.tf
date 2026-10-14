# Provision VM 100 edge-gateway
resource "proxmox_virtual_environment_vm" "edge_gateway" {
  name        = "edge-gateway"
  description = "SERVERTRON NGINX reverse proxy managed by Terraform"
  tags        = ["terraform", "ubuntu", "nginx", "production"]

  node_name = "servertron-1"
  vm_id     = 100

  started    = true
  on_boot    = true
  boot_order = ["scsi0"]

  clone {
    vm_id        = proxmox_virtual_environment_vm.ubuntu_24_04_template.vm_id
    full         = true
    datastore_id = "local-zfs"
  }

  cpu {
    cores = 2
    type  = "x86-64-v2-AES"
  }

  memory {
    dedicated = 2048
  }

  disk {
    datastore_id = "local-zfs"
    interface    = "scsi0"
    discard      = "on"
    size         = 32
  }

  initialization {
    datastore_id = "local-zfs"

    dns {
      servers = ["10.0.0.1"]
    }

    ip_config {
      ipv4 {
        address = "10.0.0.4/24"
        gateway = "10.0.0.1"
      }
    }

    user_account {
      username = "brendangasparin"
      keys     = [trimspace(file(pathexpand("~/.ssh/id_ed25519.pub")))]
    }
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  operating_system {
    type = "l26"
  }

  serial_device {}
}