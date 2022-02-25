reportFolderPath=$1

aws waf list-web-acls | jq > "${reportFolderPath}/classic-waf-web-acls.json"
aws waf list-rule-groups | jq > "${reportFolderPath}/classic-waf-rule-groups.json"
aws waf list-rules | jq > "${reportFolderPath}/classic-waf-rules.json"

aws wafv2 list-web-acls --scope=CLOUDFRONT --region=us-east-1 | jq > "${reportFolderPath}/wafv2-web-acls.json"
aws wafv2 list-rule-groups --scope=CLOUDFRONT --region=us-east-1 | jq > "${reportFolderPath}/wafv2-rule-groups.json"
aws wafv2 list-managed-rule-sets --scope=CLOUDFRONT --region=us-east-1 | jq > "${reportFolderPath}/wafv2-managed-rule-sets.json"
