module "dynamodb_table" {
  source   = "terraform-aws-modules/dynamodb-table/aws"

  name     = var.db_table_name
  hash_key = var.primary_key
  range_key = var.secondary_key

  attributes = [
    {
        name = "ISDN"
        type = "S"
    },
    {
        name = "Genre"
        type = "S"
    }
  ]

  tags = {
    Terraform   = "true"
    Environment = "staging"
  }
}

