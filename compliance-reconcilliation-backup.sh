#! /usr/bin/env bash
mkdir ./compliance-reconcilliation-backup
cd ./compliance-reconcilliation-backup
git clone git@gitlab.com:williamhillplc/usa/services/sportsbook/compliance-reconcilliation.git
cd ./compliance-reconcilliation
git fetch --all
git remote add mirror git@gitlab.com:caesarsdigital/usa/services/sportsbook/compliance-reconcilliation.git
readarray -t branches < <(git branch -r | cat)
for branch in ${branches[@]}
do
  clean=$(echo $branch | sed "s/origin\///")
  git checkout $clean && git pull
  git push -u mirror $clean
done
exit 0
