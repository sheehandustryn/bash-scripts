#!/usr/bin/env bash
root_dir="${HOME}/gitlab"
user=git@gitlab.com
base_group=caesarsdigital
infrastructure_group=usa/infrastructure
infrastructure_subgroups=("ansible" "automation-frameworks" "cloud-infra" "critical-file-monitoring" "docker" "helm" "kafka" "kubernetes" "monitoring" "packer" "redis" "scripts" "security" "technical-services" "terraform" "us-devops" "website-certs")

echo "Root Directory: $root_dir"
echo "Base Group: $base_group"
echo "Infrastructure Group: $infrastructure_group"
echo "Infrastructure SubGroups:"
for infrastructure_sub_group in ${infrastructure_subgroups[@]}
do
  echo "Creating directory: ${root_dir}/${base_group}/${infrastructure_group}/${infrastructure_sub_group}"
  mkdir -vp "${root_dir}/${base_group}/${infrastructure_group}/${infrastructure_sub_group}"
done
