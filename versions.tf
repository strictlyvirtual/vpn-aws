terraform {
  required_version = ">= 1.2.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.26.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.3.2"
    }
  }
}