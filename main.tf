terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_tls_insecure     = true
  pm_timeout          = 3600
}

resource "proxmox_vm_qemu" "vm-instance" {
  name        = "vm-instance"
  target_node = "azuris"
  clone       = "template-debian-13"
  full_clone  = true
  memory      = 8192

  cpu {
    cores = 2
  }

  disk {
    slot    = "scsi0"
    size    = "100G"
    type    = "disk"
    storage = "ds03"
    discard = "false"
  }

  network {
    id        = 0
    model     = "virtio"
    bridge    = "vmbr0"
    firewall  = false
    link_down = false
  }
  timeouts {
    create = "60m"
    delete = "10m"
  }
}
