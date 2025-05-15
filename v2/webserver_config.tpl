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
      - ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJcP3ZkbrztoXe5JgGtK7bfOf58hFGFn3HL9yUpyES+H student@devhost
    shell: /bin/bash
runcmd:
  - hostnamectl set-hostname ${HOSTNAME}
  - date >>/root/cloudinit.log 
  - echo ${HELLO} >>/root/cloudinit.log

