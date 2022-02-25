#!/usr/bin/env bash
git fetch --all --tags
readarray -t branches < <(git branch -r | cat)
for branch in ${branches[@]}
do
  clean=$(echo $branch | sed "s/origin\///")
  git checkout $clean && git pull
done
exit 0

readarray -t branches < <(git branch | cat)
for branch in ${branches[@]}
do
  git checkout $branch
  git push -u origin $branch --force
done

git checkout develop
exit 0
