resource "github_repository" "this" {
  name        = "github-iac"
  description = "Github IAC Repository"

  visibility         = "public"
  allow_squash_merge = true

}

resource "github_team" "dingusoars" {
  name        = "dingusoars"
  description = "go team dingusoar"
}

resource "github_repository_collaborators" "this" {
  repository = github_repository.this.name

  user {
    permission = "admin"
    username  = "senpaikcarter"
  }

  team {
    permission = "maintain"
    team_id = github_team.dingusoars.id
  }
}