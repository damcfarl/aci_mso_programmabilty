variable "aci_username" { default = "aciadmin" }

variable "aci_password" { default = "C1sco12345!" }

variable "aci_url" { default = "https://198.19.202.67" }

variable "demo_tenant_tf" {
  default = "dm_cli_terraform_T01"
# default = "dm_cli_terraform_appcentric_T01"
}

variable "vmm_domain" {
  default = "terraform_vDS"
}

