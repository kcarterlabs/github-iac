resource "github_repository" "this" {
  for_each = local.repositories_map

  name        = each.key
  description = each.value.description

  visibility         = each.value.private ? "private" : "public"
  allow_squash_merge = true

}

resource "github_team" "dingusoars" {
  name        = "dingusoars"
  description = "go team dingusoar"
}

resource "github_repository_collaborators" "this" {
  for_each = local.repositories_map
  # A reference, not each.key: it makes Terraform create the repository
  # before its collaborators. With a plain string the two ran in parallel, so
  # the first apply of a new repo failed and only a second apply succeeded.
  repository = github_repository.this[each.key].name

  user {
    permission = "admin"
    username   = "senpaikcarter"
  }

  team {
    permission = "maintain"
    team_id    = github_team.dingusoars.id
  }
}

# Read-only: a deploy key here can clone its one repository and nothing else.
resource "github_repository_deploy_key" "this" {
  for_each   = local.deploy_keys
  repository = github_repository.this[each.value.repository].name
  title      = each.value.title
  key        = each.value.key
  read_only  = true
}
