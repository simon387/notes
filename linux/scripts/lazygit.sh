#!/bin/bash
#funziona se chiami i branch come feature/1234-blabla
#funziona se chiami i branch come bug/1234-blabla
#funziona se chiami i branch come blabla/1234-blabla
#il primo parametro, se presente, è la descrizione
branchName=$(git rev-parse --abbrev-ref HEAD)
#echo "${branchName}"
IFS='/'
read -ar strarr <<<"$branchName"
part="${strarr[1]}"
IFS='-'
read -ar strarr <<<"$part"
ticketNumber="${strarr[0]}"
#echo "$ticketNumber-$1"
if [ -z "$1" ]; then
  echo "nessuna descrizione inserita"
else
  git add .
  git commit -a -m "$ticketNumber-$1"
  git push
fi
