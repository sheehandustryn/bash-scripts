reportFolderPath=$1

aws network-firewall list-firewalls | jq > "${reportFolderPath}/network-firewalls.json"
aws network-firewall list-rule-groups | jq > "${reportFolderPath}/rule-groups.json"
