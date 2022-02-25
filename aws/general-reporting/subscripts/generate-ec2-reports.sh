reportFolderPath=$1

aws ec2 describe-vpcs | jq > "${reportFolderPath}/vpcs.json"
aws ec2 describe-vpc-endpoints | jq > "${reportFolderPath}/vpc-endpoints.json"
aws ec2 describe-internet-gateways | jq > "${reportFolderPath}/internet-gateways.json"
aws ec2 describe-nat-gateways | jq > "${reportFolderPath}/nat-gateways.json"
aws ec2 describe-route-tables | jq > "${reportFolderPath}/route-tables.json"
aws ec2 describe-security-groups | jq > "${reportFolderPath}/security-groups.json"
aws ec2 describe-network-acls  | jq > "${reportFolderPath}/network-acls.json"
aws ec2 describe-instances | jq > "${reportFolderPath}/instances.json"
