#!/usr/bin/env bash

readarray -t folders < <(find /home/itjarl1984/working -maxdepth 1 -type d -printf "%h/%f\n")
for folder in ${folders[@]}
do
    if [[ ! $folder = "/home/itjarl1984/working" && ! $folder =~ .*gitlab.* && ! $folder =~ .*github.* ]]
    then
        rm -rf $folder
    fi
done