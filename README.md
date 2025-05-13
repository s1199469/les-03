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

to do: nieuwe ssh keypair en user: ansible
test is nu gedaan met reneadmin uit de vorige opdracht

# Opdracht 2
** playbook file: updatepackages**
playbook maken lukt maar geeft bij uitvoering foutmelding: fatal: [192.168.1.55]: FAILED! => {"changed": false, "msg": "Failed to lock apt for exclusive operation: Failed to lock directory /var/lib/apt/lists/: E:Could not open lock file /var/lib/apt/lists/lock - open (13: Permission denied)"}

oorzaak: become: yes ontbrak in playbook. 
taken zijn na fix succesvol uitgevoerd.

# toevoegen regels aan /etchosts
**playbook: addhostsentry.yml**
playboek is succesvol uitgevoerd.
nadeel: bij de volgende keer uitvoeren wordt dezelfde regel toegevoegd

 Resultaat in hosts:

>*# (mark) ANSIBLE MANAGED BLOCK esxi
>192.168.1.11 esxi
>*# (mark) ANSIBLE MANAGED BLOCK esxi

 # toevoegen user met de naam "test"
 **playbook: adduser.yml**
 playbook is succesvol uitgevoerd

 # backup folders naar /tmp/
 **playbook: backup_folder.yml**
 playbook is succesvol uitegvoerd. Zipfile staat op /tmp
 om de filenaam de datum en tijd mee te geven heb ik de volgende oplossing toegepast:
bron: https://serverfault.com/questions/728662/ansible-manipulate-file-with-a-date-format

 vars:
    date: "{{ lookup('pipe', 'date +%Y%m%d-%H%M') }}"
 tasks:
    - name: backup folder
      archive:
        path:
          - /etc/
          - /var/www/
        dest: /tmp/backup-{{ date }}.zip
        format: zip

