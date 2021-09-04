# Define variables at your .tfvars
variable "aws_access_key_id" {
  type        = string
  description = "AWS account access key id"
}

variable "aws_secret_access_key" {
  type    = string
  default = "AWS account secret access key"
}

variable "pubkey_path" {
  type        = string
  description = "Public key file to be added to aws"
  default     = "~/.ssh/aws.pub"
}

variable "vpc_cidr" {
  description = "cidr of the vpc and vpc subnet"
  type        = string
  default     = "10.0.0.0/24"
}
