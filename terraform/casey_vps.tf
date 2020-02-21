resource "vultr_server" "casey" {
  plan_id   = 200
  region_id = 8
  os_id     = 159
  hostname  = "casey"
}
