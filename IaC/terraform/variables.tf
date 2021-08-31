# Define variables at your .tfvars
variable "aws_access_key_id" {
  type        = string
  description = "AWS account access key id"
}

variable "aws_secret_access_key" {
  type    = string
  default = "AWS account secret access key"
}

variable "pubkey" {
  type        = string
  description = "Public key to be added to aws"
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCuotNrvEeLITEoa2DcV2gzBEiGhEUDpCYYBobiLKO+692H3KorZVWG0bMdoKrKQreu8cfr0W4XuzQffRI1niK8eJkfS6zWpw/khR2HJr7euvVX63pWpjE/AAIYlKUwkk4kYNyR6y1zIUYzimAqANOyNuus70AAd3N2mDIqtTWUgzGMj/wmY2qwP6GLZHNiPmxnCs8YqGb8mEqUSOYMNhhKvC5ynQsaSywLTvd50ElRQYd5k4UGFP24/y6F953ABeqcN+2sEIoqlrJ6mDIwwm3H2Gp7WF+WwjwhwoM7AXZNMLv7hWhVxY4x2GwfXNJqDEr0z3mtEKzp7OUXrPw6uuMyDuX8g834ROYLHFGiWHSWxQlrk/r6hizqFGRV75waRMLp0zCqEDP+XhPA452dSLho48unqHa70m+kDXnFJq1cY6xAYisL+rhJejFa8ZY5ztgQ3ky99XrH9YMiBugC96/oxAWuh/OBZOSS4QPC34PPKzKjb8HXGKLoTd7BJURnqj8= d-manakovskiy@d-manakovskiyX"
}

variable "vpc_cidr" {
  description = "cidr of the vpc and vpc subnet"
  type        = string
  default     = "10.0.0.0/24"
}
