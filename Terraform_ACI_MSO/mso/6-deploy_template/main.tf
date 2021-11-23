terraform {
  required_providers {
    mso = {
      source = "CiscoDevNet/mso"
    }
  }
}

# Configure the provider with your Cisco MSO credentials.
provider "mso" {
  # MSO Username
  username = var.mso_username
  # MSO Password
  password = var.mso_password
  # MSO URL
  url      = var.mso_url
  insecure = true
}

# Define an MSO Tenant Resource.
data "mso_tenant" "tenant_obj" {
    name         = var.tenant_name
    display_name = var.tenant_name
}

# Define an MSO Schema Resource.
data  "mso_schema" "schema_obj" {
    name          = var.schema
}

data "mso_site" "site1_obj" {
    name          = var.site1_name
}

data "mso_site" "site2_obj" {
    name          = var.site2_name
}

# for destroy, set undeploy = trus
# terraform apply -parallelism=1

resource "mso_schema_template_deploy" "template_site1_obj" {
  schema_id       =  data.mso_schema.schema_obj.id
  template_name   =  var.template_name
  site_id         =  data.mso_site.site1_obj.id
# undeploy        = true
}

resource "mso_schema_template_deploy" "template_site2_obj" {
  schema_id       =  data.mso_schema.schema_obj.id
  template_name   =  var.template_name
  site_id         =  data.mso_site.site2_obj.id
# undeploy        =  true
  depends_on      = [mso_schema_template_deploy.template_site1_obj]
}
