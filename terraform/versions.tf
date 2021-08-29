//terraform {
//  required_providers {
//    virtualbox = {
//      source = "terra-farm/virtualbox"
//      version = "0.2.1-alpha.1"
//    }
//  }
//}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
