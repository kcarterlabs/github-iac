locals {
  github_app_pem = data.aws_ssm_parameter.gh_pem
  github_id = data.aws_ssm_parameter.id
  github_installation_id = data.aws_ssm_parameter.installation_id
  config         = yamldecode(file("${path.module}/config.yaml"))
  repositories_map = {
    for repo in local.config.this.repository:
    repo.name => {
      description = repo.description
      private     = repo.visibility == "private" ? true : false
    }
  }

}
