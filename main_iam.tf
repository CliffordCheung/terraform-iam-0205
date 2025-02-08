locals {
  name_prefix = "clifford"
}

resource "aws_iam_role" "role_example" {
 name = "${local.name_prefix}-read-role"


 assume_role_policy = jsonencode({
   Version = "2012-10-17"
   Statement = [
     {
       Action = "sts:AssumeRole"
       Effect = "Allow"
       Sid    = ""
       Principal = {
         Service = "ec2.amazonaws.com"
       }
     },
   ]
 })
}


data "aws_iam_policy_document" "policy_example" {
 statement {
   effect    = "Allow"
   actions   = ["ec2:Describe*"]
   resources = ["*"]
 }
 statement {
   effect    = "Allow"
   actions   = ["s3:ListBucket"]
   resources = ["*"]
 }
 statement{
    effect = "Allow"
    actions = [
        "dynamodb:BatchGetItem",
        "dynamodb:DescribeImport",
        "dynamodb:ConditionCheckItem",
        "dynamodb:DescribeContributorInsights",
        "dynamodb:Scan",
        "dynamodb:ListTagsOfResource",
        "dynamodb:Query",
        "dynamodb:DescribeStream",
        "dynamodb:DescribeTimeToLive",
        "dynamodb:DescribeGlobalTableSettings",
        "dynamodb:PartiQLSelect",
        "dynamodb:DescribeTable",
        "dynamodb:GetShardIterator",
        "dynamodb:DescribeGlobalTable",
        "dynamodb:GetItem",
        "dynamodb:DescribeContinuousBackups",
        "dynamodb:DescribeExport",
        "dynamodb:GetResourcePolicy",
        "dynamodb:DescribeKinesisStreamingDestination",
        "dynamodb:DescribeBackup",
        "dynamodb:GetRecords",
        "dynamodb:DescribeTableReplicaAutoScaling"
    ]
    resources = [module.dynamodb_table.dynamodb_table_arn]
 }
 statement {
   effect = "Allow"
   actions = [
        "dynamodb:ListContributorInsights",
        "dynamodb:DescribeReservedCapacityOfferings",
        "dynamodb:ListGlobalTables",
        "dynamodb:ListTables",
        "dynamodb:DescribeReservedCapacity",
        "dynamodb:ListBackups",
        "dynamodb:GetAbacStatus",
        "dynamodb:ListImports",
        "dynamodb:DescribeLimits",
        "dynamodb:DescribeEndpoints",
        "dynamodb:ListExports",
        "dynamodb:ListStreams"   
   ]
   resources = ["*"]
 }
}


resource "aws_iam_policy" "policy_example" {
 name = "${local.name_prefix}-policy-t1"


 ## Option 1: Attach data block policy document
 policy = data.aws_iam_policy_document.policy_example.json


}


resource "aws_iam_role_policy_attachment" "attach_example" {
 role       = aws_iam_role.role_example.name
 policy_arn = aws_iam_policy.policy_example.arn
}


resource "aws_iam_instance_profile" "profile_example" {
 name = "${local.name_prefix}-profile-t1"
 role = aws_iam_role.role_example.name
}

output "iam_instance_profile_name" {
  description = "ID of the iam_instance_profile"
  value       = aws_iam_instance_profile.profile_example.id
}
