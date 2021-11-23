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
resource "mso_schema" "schema_obj" {
    template_name = var.template_name
#   template_name = "Template1"
    name          = var.schema
    tenant_id     = data.mso_tenant.tenant_obj.id
}

# Define an MSO Schema VRF Resource.
resource "mso_schema_template_vrf" "vrf_obj" {
    schema_id     = mso_schema.schema_obj.id
    template      = mso_schema.schema_obj.template_name
    name          = var.vrf
    display_name  = var.vrf
}

# Define an MSO Schema BD Resource.
resource "mso_schema_template_bd" "bd_obj" {
    schema_id              = mso_schema.schema_obj.id
    template_name          = mso_schema.schema_obj.template_name
    name                   = var.bd
    display_name           = var.bd
    vrf_name               = mso_schema_template_vrf.vrf_obj.name
    layer2_unknown_unicast = "proxy"
    layer2_stretch         = true
}
