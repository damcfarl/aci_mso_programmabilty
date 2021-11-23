variable "mso_username" {
  default = "aciadmin"
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

variable "site1_name" {
  type    = string
  default = "SFC"
}

variable "site2_name" {
  type    = string
  default = "DAL"
}

variable "user1_name" {
  type    = string
  default = "aciadmin"
}
