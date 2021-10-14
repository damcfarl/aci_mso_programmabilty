terraform {
  required_version = ">= 1.0.1"
}

terraform {
  required_providers {
    aci = {
      source  = "CiscoDevNet/aci"
    }
  }
}

provider "aci" {
  username = var.aci_username
  password = var.aci_password
  url      = var.aci_url
#  insecure = true
}

resource "aci_rest" "add_interf_des" {
  path       = "/api/mo/uni.json"
  payload = <<EOF

{
    "infraHPathS": {
        "attributes": {
            "rn": "hpaths-602_eth1_60",
            "dn": "uni/infra/hpaths-602_eth1_60",
            "descr": "Interface is not in use",
            "name": "602_eth1_60"
        },
        "children": [
            {
                "infraRsHPathAtt": {
                    "attributes": {
                        "dn": "uni/infra/hpaths-602_eth1_60/rsHPathAtt-[topology/pod-1/paths-602/pathep-[eth1/60]]",
                        "tDn": "topology/pod-1/paths-602/pathep-[eth1/60]"
                    }
                }
            }
        ]
    }
}
  EOF
}
