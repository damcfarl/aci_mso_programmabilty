variable "mso_username" {
  default = "aciadmin"
}

variable "mso_password" {
  default = "C1sco12345!!!"
}

variable "mso_url" {
  default = "https://198.19.202.252/"
}

variable "tenant_name" {
  type    = string
  default = "tenant_terraform_T01"
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

variable "filter_http" {
  description = "Create filters"
  type        = string
  default     = "HTTP"
}

variable "filter_ssh" {
  description = "Create filters"
  type        = string
  default     = "SSH"
}

variable "contracts" {
  description = "Create contracts with these filters"
  type        = string
  default     = "Internet-to-Web"
}
