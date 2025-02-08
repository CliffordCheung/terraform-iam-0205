# terraform-iam-0205

main_ec2.tf :
    to create the ec2 and must remember to include the iam_instance_profile so that the iam roles will be attached to the ec2

main_iam.tf :
    create the iam profile :
        1. aws_iam_role
        2. aws_iam_policy_document
        3. aws_iam_policy
        4. aws_iam_role_policy_attachment
        5. aws_iam_instance_profile

main_dynamodb.tf :
    using the module to create a dynamodb

insertitem.tf :
    use to insert the item into the database but must remember to add in the depends on at the end of the file to make sure the dynamodb is first created before inserting the items, otherwise there will be error

backend.tf :
    putting the tfstate file in the shared s3 bucket that is created 

provider.tf :
    to provide the provider details for aws as well as the region

variables.tf :
    to hold all the variable that is declare for the project

vpc.tf :
    hold the data block

output.tf :
    hold the dynamodb arn and id



