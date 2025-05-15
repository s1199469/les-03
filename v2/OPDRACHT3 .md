# les-03
## LAB week 3 opdracht 3
## deploy van 2 databaseservers en 1 webserver
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
issue met negeren van variable "KEY" in cloud-init verholpen. Haken moeten accolades zijn.

nog uitzoeken:
- het lijkt alleen te werken met keypair id_ed_25519. keypair met naam "ansible" werken niet
> follow up actie
