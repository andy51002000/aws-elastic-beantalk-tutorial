
$appname="andy20190720new"

aws elasticbeanstalk check-dns-availability --cname-prefix $appname
# {
#     "Available": true,
#     "FullyQualifiedCNAME": "my-cname.elasticbeanstalk.com"
# }


aws elasticbeanstalk describe-application-versions `
--application-name $appname `
--version-label v1
# {
#     "ApplicationVersions": []
# }

aws elasticbeanstalk create-application `
--application-name $appname `
--description "my application"


$appver="v1"
aws elasticbeanstalk create-application-version `
--application-name $appname `
--version-label $appver 
#--source-bundle S3Bucket=andytest123456,S3Key="deploy.zip" `
#--region us-east-2
#--source-build-information SourceType=Git,SourceRepository=CodeCommit,SourceLocation="ssh://git-codecommit.us-east-2.amazonaws.com/v1/repos/deployrepo"



$cfgName="t2vmcfg"
aws elasticbeanstalk create-configuration-template `
--application-name $appname  `
--template-name $cfgName `
--solution-stack-name "64bit Amazon Linux 2018.03 v4.9.2 running Node.js" `
--option-settings `
    "ResourceName=AWSEBAutoScalingGroup,Namespace=aws:autoscaling:asg,OptionName=MinSize,Value=2" `
    "Namespace=aws:autoscaling:launchconfiguration,OptionName=InstanceType,Value=t2.micro"

#https://docs.aws.amazon.com/elasticbeanstalk/latest/platforms/platforms-supported.html#platforms-supported.nodejs



aws elasticbeanstalk create-environment `
--cname-prefix $appname `
--application-name $appname `
--template-name $cfgName `
--version-label $appver `
--environment-name $appname `
--option-settings Namespace="aws:autoscaling:launchconfiguration",OptionName="IamInstanceProfile",Value="aws-elasticbeanstalk-ec2-role"

aws elasticbeanstalk describe-environments --environment-names $appname

#install eb cli
#https://docs.aws.amazon.com/zh_tw/elasticbeanstalk/latest/dg/eb-cli3-install-windows.html