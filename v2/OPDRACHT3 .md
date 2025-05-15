# les-03
## LAB week 3 opdracht 3
## deploy van 1 databaseservers en 2 webservers
**nieuwe branch**
* git checkout -b productie
* git checkout productie
* maak wijzigingen
* git add .
* git commit -m message
* upload branch naar github (niet nodig voor eenmalige aanpassing die gemerged gaat worden)
* git push --set-upstream origin productie
# samenvoegen als alles gereed is
* git checkout main
* git merge productie
* git push

v0.2.1
kopie gemaakt van terraform files van LAB-03 naar map LAB-03/v2
aanpassingen gemaakt, verbeteringen verwerkt
deployment uitgevoerd vanuit /v2

issues:
- Cloud init plaatst de public key niet in authorized_keys
> oorzaak: variabelen moeten binnen accolades staan, niet tussen haakjes
- het lijkt alleen te werken met keypair id_ed_25519. keypair met naam "ansible" werken niet
> oorzaak: in de tfvars file ontbrak "ssh-ed25519" in de naam van de public key
- De ssh key kan niet worden meegegeven bij de VM deployment
> oorzaak: de esxi provider heeft dit niet in de parameters. Ik heb dit opgezocht op de website van Terraform : https://registry.terraform.io/providers/josenk/esxi/latest

