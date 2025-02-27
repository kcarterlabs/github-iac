data "aws_ssm_parameter" "gh_pem" {
  name            = "github_app_pem"
  with_decryption = true
}

data "aws_ssm_parameter" "id" {
  name            = "/github/id"
  with_decryption = true
}

data "aws_ssm_parameter" "installation_id" {
  name            = "/github/installation_id"
  with_decryption = true
}