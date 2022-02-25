reportFolderPath=$1

aws route53 list-hosted-zones > "${reportFolderPath}/route53-hosted-zones.json"

hostedZoneIds=$(aws route53 list-hosted-zones --query 'HostedZones[*].Id[]')
cleanedHostedZoneIds=$(echo $hostedZoneIds | sed -r 's/[][,"]//g')

for hostedZoneId in $cleanedHostedZoneIds
do
  resourceRecordSets=$(aws route53 list-resource-record-sets --hosted-zone-id $hostedZoneId)
  filenamePrefix=$(aws route53 get-hosted-zone --query 'HostedZone.Name' --id $hostedZoneId | sed 's/"//g')
  echo $resourceRecordSets | jq > "${reportFolderPath}/route53-${filenamePrefix}-resource-record-sets.json"
done
