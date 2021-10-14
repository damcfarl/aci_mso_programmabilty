/* Policies */

resource "aci_filter" "allow_http" {
  tenant_dn = aci_tenant.tenant_tf.id
  name      = "allow_http"
}
resource "aci_filter" "allow_icmp" {
  tenant_dn = aci_tenant.tenant_tf.id
  name      = "allow_icmp"
}

resource "aci_filter_entry" "http" {
  name        = "http"
  filter_dn   = aci_filter.allow_http.id
  ether_t     = "ip"
  prot        = "tcp"
  d_from_port = "http"
  d_to_port   = "http"
  stateful    = "yes"
}

resource "aci_filter_entry" "icmp" {
  name        = "icmp"
  filter_dn   = aci_filter.allow_icmp.id
  ether_t     = "ip"
  prot        = "icmp"
  stateful    = "yes"
}

resource "aci_contract_subject" "subject_tf" {
  contract_dn                  = aci_contract.contract_internal_tf_external_tf.id
  name                         = "Web_subject"
  relation_vz_rs_subj_filt_att = [
     aci_filter.allow_http.id,
     aci_filter.allow_icmp.id,
#     aci_filter.allow_ssh.id,
  ]
}

#resource "aci_filter" "allow_ssh" {
#  tenant_dn = aci_tenant.tenant_tf.id
#  name      = "allow_ssh"
#}
#
#resource "aci_filter_entry" "ssh" {
#  name        = "ssh"
#  filter_dn   = aci_filter.allow_ssh.id
#  ether_t     = "ip"
#  prot        = "tcp"
#  d_from_port = "ssh"
#  d_to_port   = "ssh"
#  stateful    = "yes"
#}
#
