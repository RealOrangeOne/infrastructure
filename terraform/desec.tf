# NOTE: Tokens must be created manually and imported, otherwise there's no way to access the token
resource "desec_token" "traefik" {
  name               = "traefik"
  perm_create_domain = false
  perm_delete_domain = false
  perm_manage_tokens = false
}

resource "desec_token" "terraform" {
  name               = "Terraform"
  perm_create_domain = true
  perm_delete_domain = false
  perm_manage_tokens = true
}

resource "desec_token_policy" "traefik_default" {
  token_id   = desec_token.traefik.id
  perm_write = false
}

resource "desec_token_policy" "traefik" {
  token_id   = desec_token.traefik.id
  perm_write = true
  subname    = "_acme_challenge"
  type       = "TXT"

  depends_on = [desec_token_policy.traefik_default]
}
