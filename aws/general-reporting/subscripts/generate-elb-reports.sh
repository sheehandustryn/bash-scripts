reportFolderPath=$1

aws elb describe-load-balancers | jq > "${reportFolderPath}/classic-load-balancers.json"
aws elbv2 describe-load-balancers | jq >  "${reportFolderPath}/application-load-balancers.json"
