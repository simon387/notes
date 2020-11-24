#!/bin/bash
#
# This script automatic add all mod files to commit list, commit and push the files
# with a commit message prefix that is the Jira id, read from branch name.
#
# First script arg parameter is the description of the commit
#
# it works if you names the branchs in this way: feature/1234-blabla
# it works if you names the branchs in this way: bug/1234-blabla
# it works if you names the branchs in this way: blabla/1234-blabla
#
branchName=$(git rev-parse --abbrev-ref HEAD)
#echo "${branchName}"
IFS='/'
# shellcheck disable=SC2162
read -a strarr <<<"$branchName"
part="${strarr[1]}"
#echo "$part"
IFS='-'
# shellcheck disable=SC2162
read -a strarr <<<"$part"
ticketNumber="${strarr[0]}"
#echo "$ticketNumber-$1"
if [ -z "$1" ]; then
  echo "Missing commit description!"
else
  git add .
  git commit -a -m "$ticketNumber-$1"
  git push
fi
