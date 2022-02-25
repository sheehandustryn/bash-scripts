rootReportFolderPath=$1
acmReportFolderPath="${rootReportFolderPath}/${AWS_PROFILE}/acm"
cloudfrontReportFolderPath="${rootReportFolderPath}/${AWS_PROFILE}/cloudfront"
ec2ReportFolderPath="${rootReportFolderPath}/${AWS_PROFILE}/ec2"
elbReportFolderPath="${rootReportFolderPath}/${AWS_PROFILE}/elb"
networkFirewallReportFolderPath="${rootReportFolderPath}/${AWS_PROFILE}/network-firewall"
route53ReportFolderPath="${rootReportFolderPath}/${AWS_PROFILE}/route53"
wafReportFolderPath="${rootReportFolderPath}/${AWS_PROFILE}/waf"

mkdir -p $acmReportFolderPath
mkdir -p $cloudfrontReportFolderPath
mkdir -p $ec2ReportFolderPath
mkdir -p $elbReportFolderPath
mkdir -p $networkFirewallReportFolderPath
mkdir -p $route53ReportFolderPath
mkdir -p $wafReportFolderPath

./subscripts/generate-acm-reports.sh $acmReportFolderPath
./subscripts/generate-cloudfront-reports.sh $cloudfrontReportFolderPath
./subscripts/generate-ec2-reports.sh $ec2ReportFolderPath
./subscripts/generate-elb-reports.sh $elbReportFolderPath
./subscripts/generate-network-firewall-reports.sh $networkFirewallReportFolderPath
./subscripts/generate-route53-reports.sh $route53ReportFolderPath
./subscripts/generate-waf-reports.sh $wafReportFolderPath
