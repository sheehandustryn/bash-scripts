#!/usr/bin/env bash
ec2_instance_id=$(aws ec2 describe-instances --filters Name=tag:Name,Values=fbconversionsapi.us.williamhill.com --query 'Reservations[].Instances[].InstanceId' | tr -d "\n[]\" ")
aws ec2 describe-instances --filters Name=tag:Name,Values=fbconversionsapi.us.williamhill.com > ec2-instance.json
aws ec2 describe-instance-status --instance-ids ${ec2_instance_id} > ec2-instance-status.json
ec2_subnet_id=$(aws ec2 describe-instances --filters Name=tag:Name,Values=fbconversionsapi.us.williamhill.com --query 'Reservations[].Instances[].SubnetId' | tr -d "\n[]\" ")
aws ec2 describe-network-interfaces --filters Name=subnet-id,Values=${ec2_subnet_id} > network-interface.json
aws ec2 describe-security-groups --filters Name=tag:Name,Values=fbconversionsapi.us.williamhill.com > ec2-security-groups.json
load_balancer_arn=$(aws elbv2 describe-load-balancers --query 'LoadBalancers[].LoadBalancerArn' | grep conversions | tr -d "\n[]\" ")
aws elbv2 describe-load-balancers --load-balancer-arns ${load_balancer_arn} > load-balancer.json
aws elbv2 describe-listeners --load-balancer-arn ${load_balancer_arn} > load-balancer-listeners.json
target_group_arn=$(aws elbv2 describe-target-groups --load-balancer-arn ${load_balancer_arn} --query 'TargetGroups[].TargetGroupArn' | tr -d "\n[]\" ")
aws elbv2 describe-target-groups --load-balancer-arn ${load_balancer_arn} > load-balancer-target-groups.json
listener_arn=$(aws elbv2 describe-listeners --load-balancer-arn ${load_balancer_arn} --query 'Listeners[].ListenerArn' | tr -d "\n[]\" ")
aws elbv2 describe-rules --listener-arn ${listener_arn} > load-balancer-listener-rules.json
aws elbv2 describe-target-health --target-group-arn ${target_group_arn} > load-balancer-target-group-health.json
