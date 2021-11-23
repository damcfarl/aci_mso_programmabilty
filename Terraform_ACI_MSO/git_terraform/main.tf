terraform {
  required_version = ">=1.0.1"
}

terraform {
  required_providers {
    aci = {
#     source  = "CiscoDevNet/aci"
      source  = "registry.terraform.io/ciscodevnet/aci"
      version = "0.7.1"    }
  }
}

provider "aci" {
  username = var.aci_username
  password = var.aci_password
  url      = var.aci_url
#  insecure = true
}

terraform {
  backend "local" {
#   path="/home/cisco/projects/aci/tf_state/terraform.tfstate"
    path="/home/cisco/Documents/GS_ACI_Automation_with_Terraform_dcloud/tf_state/terraform_tfstate"
  }
}

