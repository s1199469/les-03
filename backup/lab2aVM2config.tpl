#cloud-config

packages:
  - wget
  - ntpdate

users:
  - default
  - name: ${USER}
    sudo: ALL=(ALL) NOPASSWD:ALL
    # een list in tfvars file is nog niet gelukt
    ssh_authorized_keys:
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHLj0QW8VQfxx9mUMdZevTxPif3fw0VavPP1noc4kgBc student@devhost
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICQpPm9dxHyQ0y+tYzQZzt0HG5qjlp+4RnCP2iQBH7Lh rene@DESKTOP-N4CFGSN
    shell: /bin/bash
runcmd:
  - hostnamectl set-hostname ${HOSTNAME}
  - date >>/root/cloudinit.log 
  - echo ${HELLO} >>/root/cloudinit.log

