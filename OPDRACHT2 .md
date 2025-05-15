# les-03
## LAB week 3 opdracht 4
## commando's voor nieuwe branch
* git checkout -b test
* git checkout test
* maak wijzigingen
* git add .
* git commit -m "nieuwe branch"
* upload branch naar github (niet nodig voor eenmalige aanpassing die gemerged gaat worden)
* git push --set-upstream origin test
# samenvoegen
* git checkout main
* git merge test
* git push




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

# cronjob voor dagelijkse backup
cron module voor ansible. De playbook wordt nu getarget naar localhost omdat deze de playbook voor de backup moet uitvoeren
**playbook: schedule_remote_backup.yml**
resultaat:
student@devhost:~/terraform/week-3/LAB-3$ sudo crontab -l
# Ansible: daily backup of remote hostfolders
**playbook: schedule_remote_backupjob.yml**
week-3/LAB-3/backup_folder.yml
playbook is succesvol uitgevoerd, er is een cron job toegevoegd op de beheermachine:
"* 22 * * * ansible-playbook -i ~/terraform/week-3/LAB-3/inventory.ini ~/terraform/"

