terraform {
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
}

provider "github" {
  owner = "kcarterlabs"
  app_auth {
    id              = local.github_id.value
    installation_id = local.github_installation_id.value
    pem_file        = local.github_app_pem.value
  }
}

provider "aws" {
  region = "us-west-2"
}
