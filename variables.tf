variable "primary_key" {
    type = string
    description = "hash_key"
    default = "ISDN"
}
variable "secondary_key" {
    type = string
    description = "range_key"
    default = "Genre"
}
variable "db_table_name" {
    type = string
    description = "dynamodb table name"
    default = "clifford-bookinventory-0208"
  
}

variable "vpc_name" {
 description = "The VPC Name to use"
 type        = string
 default     = "ce9-coaching-shared-vpc"
}


variable "subnet_name" {
 description = "The VPC Name to use"
 type        = string
 default     = "ce9-coaching-shared-vpc-public-us-east-1a"
}

variable "sg_ingress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))
    default     = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "SSH"
        },
        {
          from_port   = 443
          to_port     = 443
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          description = "HTTPS"
        },
    ]
}