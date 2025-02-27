resource "github_repository" "this" {
  name        = "github-iac"
  description = "Github IAC Repository"

  visibility         = "public"
  allow_squash_merge = true

}