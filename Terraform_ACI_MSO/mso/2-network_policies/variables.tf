variable "mso_username" {
  default = "aciadmin"
# default = "ansible-ubuntu"
}

variable "mso_password" {
  default = "C1sco12345!!!"
}

variable "mso_url" {
  default = "https://198.19.202.252"
}

variable "tenant_name" {
  type    = string
  default = "tenant_terraform_T01"
}

variable "template_name" {
  type    = string
  default = "terraform_template"
}

variable "schema" {
    type    = string
    default = "terraform_schema"
}

variable "vrf" {
    type    = string
    default = "prod_vrf"
}

variable "bd" {
    type    = string
    default = "prod_bd"
}
