reportFolderPath=$1

aws cloudfront list-distributions | jq > "${reportFolderPath}/cloudfront-distributions.json"
aws cloudfront list-distributions --query 'DistributionList.Items[].{distributionDomainName: DomainName, origin: Origins.Items[].{id: Id, domainName: DomainName}}' | jq > "${reportFolderPath}/cloudfront-origin-domainnames.json"
