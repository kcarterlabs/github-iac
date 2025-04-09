terraform {
  required_version = ">= 1.10.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "5.88.0"
    }
  }
    backend "remote" {
    organization = "kcarterlabs"

    workspaces {
      name = "github-iac"
    }
  }

}

