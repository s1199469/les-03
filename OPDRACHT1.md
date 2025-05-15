# les-03
## LAB week 3 opdracht 1
## commando's voor nieuwe branch
* git checkout -b test
* git checkout test
* maak wijzigingen
* git add .
* git commit -m message
* upload branch naar github (niet nodig voor eenmalige aanpassing die gemerged gaat worden)
* git push --set-upstream origin test
# samenvoegen
* git checkout main
* git merge test
* git push

test
test2
test3

## Opdracht 1:
wegschrijven IP adres naar inventory file is gelukt
### ssh verbinding voor Ansible
let op de notatie in de inventory:
[all:vars] <-deze wordt snel vergeten
ansible_user=<user>
ansible_ssh_private_key_file=~/.ssh/<keyfile>
alleen ip adres of serev1 ansible_host=<ip adres> kunnen allebei
in main.tf wordt de inventory file als volgt aangemaakt:

resource "local_file" "ipaddresses" {
   content = <<-EOT
   [servers]
   %{ for ip in local.ips }${ip}
   %{ endfor }
   [all:vars]
   ansible_user=reneadmin
   ansible_ssh_private_key_file=~/.ssh/id_ed25519
   EOT
   
   filename = "${path.module}/inventory.ini"
}
test: ansible -i inventory.ini -m ping all


