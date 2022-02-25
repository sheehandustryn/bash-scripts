reportFolderPath=$1

aws acm list-certificates | jq  > "${reportFolderPath}/certificates.json"
aws acm-pca list-certificate-authorities | jq > "${reportFolderPath}/certificate-authorities.json"
