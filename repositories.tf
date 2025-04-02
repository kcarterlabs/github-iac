resource "github_repository" "this" {
  for_each = local.repositories_map
  
  name        = each.key
  description = each.value.description

  visibility         = "public"
  allow_squash_merge = true

}

resource "github_team" "dingusoars" {
  name        = "dingusoars"
  description = "go team dingusoar"
}

resource "github_repository_collaborators" "this" {
  for_each = local.repositories_map
  repository = each.key

  user {
    permission = "admin"
    username  = "senpaikcarter"
  }

  team {
    permission = "maintain"
    team_id = github_team.dingusoars.id
  }
}
