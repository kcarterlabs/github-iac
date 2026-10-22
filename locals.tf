locals {
  github_app_pem         = data.aws_ssm_parameter.gh_pem
  github_id              = data.aws_ssm_parameter.id
  github_installation_id = data.aws_ssm_parameter.installation_id
  config                 = yamldecode(file("${path.module}/config.yaml"))
  repositories_map = {
    for repo in local.config.this.repository :
    repo.name => {
      description = repo.description
      private     = repo.visibility == "private" ? true : false
    }
  }
  # "repo/title" => key, for every deploy_keys entry (title + key) in config.yaml.
  deploy_keys = merge([
    for repo in local.config.this.repository : {
      for k in try(repo.deploy_keys, []) :
      "${repo.name}/${k.title}" => { repository = repo.name, title = k.title, key = k.key }
    }
  ]...)

}
