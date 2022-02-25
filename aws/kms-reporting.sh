#!/usr/bin/env bash
readarray -t keys < <(aws kms list-keys --output text | awk '{ print $2 }')
for key in ${keys[@]}
do
  aws kms describe-key --key-id $key --query 'KeyMetadata.{Description:Description,KeyId:KeyId,Arn:Arn}' >> ./keys.json
done
