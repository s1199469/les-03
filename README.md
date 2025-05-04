# les-03
## LAB week 3 opdracht 1
## commando's voor nieuwe branch
git checkout -b test
git checkout test
maak wijzigingen
git add .
git commit -m <message>
upload branch naar github (niet nodig voor eenmalige anapassing die gemerged gaat worden)
git push --set-upstream origin test
# samenvoegen
git checkout main
git merge test
git push
