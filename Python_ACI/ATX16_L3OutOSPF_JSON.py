#!/usr/local/bin/python3.7
# import sys
import requests
import json
#python3
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

#python2
#from requests.packages.urllib3.exceptions import InsecureRequestWarning
#requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

apic = '10.122.143.36'
tenant = 'ATX16-L3Out-Postman'
aci_user = 'damcfarl'
aci_pwd = 'cisco!123'

headers = {'content-type': "application/json"}

s = (requests.Session())
print('\n')

# Login to ACI fabric
print("login to ACI fabric: " " "+ apic + "")
url = 'https://' + apic + '/api/mo/aaaLogin.json'
payload = {'aaaUser': {'attributes': {'name': aci_user, 'pwd': aci_pwd}}}
r = s.post(url, data=json.dumps(payload), verify=False)
cookies = r.cookies
print(r.status_code)
print('\n')

url = "https://"+apic+"/api/node/mo/uni/tn-"+tenant+".json"
payload =    {


            "l3extOut": {
                "attributes": {
                    "annotation": "",
                    "descr": "",
                    "dn": "uni/tn-"+tenant+"/out-out-1",
                    "enforceRtctrl": "export",
                    "name": "out-1",
                    "nameAlias": "",
                    "ownerKey": "",
                    "ownerTag": "",
                    "targetDscp": "unspecified"
                },
                "children": [
                    {
                        "ospfExtP": {
                            "attributes": {
                                "annotation": "",
                                "areaCost": "1",
                                "areaCtrl": "redistribute,summary",
                                "areaId": "0.0.0.1",
                                "areaType": "nssa",
                                "descr": "",
                                "multipodInternal": "no",
                                "nameAlias": ""
                            }
                        }
                    },
                    {
                        "l3extRsEctx": {
                            "attributes": {
                                "annotation": "",
                                "tnFvCtxName": "vrf"
                            }
                        }
                    },
                    {
                        "l3extLNodeP": {
                            "attributes": {
                                "annotation": "",
                                "configIssues": "",
                                "descr": "",
                                "name": "ospfif-1",
                                "nameAlias": "",
                                "ownerKey": "",
                                "ownerTag": "",
                                "tag": "yellow-green",
                                "targetDscp": "unspecified"
                            },
                            "children": [
                                {
                                    "l3extRsNodeL3OutAtt": {
                                        "attributes": {
                                            "annotation": "",
                                            "configIssues": "",
                                            "rtrId": "23.23.23.23",
                                            "rtrIdLoopBack": "yes",
                                            "tDn": "topology/pod-1/node-101"
                                        }
                                    }
                                },
                                {
                                    "l3extLIfP": {
                                        "attributes": {
                                            "annotation": "",
                                            "descr": "",
                                            "name": "ospfif-1",
                                            "nameAlias": "",
                                            "ownerKey": "",
                                            "ownerTag": "",
                                            "prio": "unspecified",
                                            "tag": "yellow-green"
                                        },
                                        "children": [
                                            {
                                                "ospfIfP": {
                                                    "attributes": {
                                                        "annotation": "",
                                                        "authKeyId": "1",
                                                        "authType": "simple",
                                                        "descr": "",
                                                        "name": "ospfif-1",
                                                        "nameAlias": ""
                                                    },
                                                    "children": [
                                                        {
                                                            "ospfRsIfPol": {
                                                                "attributes": {
                                                                    "annotation": "",
                                                                    "tnOspfIfPolName": "myospf-pol"
                                                                }
                                                            }
                                                        }
                                                    ]
                                                }
                                            },
                                            {
                                                "l3extRsPathL3OutAtt": {
                                                    "attributes": {
                                                        "addr": "1.1.1.2/30",
                                                        "annotation": "",
                                                        "autostate": "disabled",
                                                        "descr": "",
                                                        "encap": "vlan-1330",
                                                        "encapScope": "local",
                                                        "ifInstT": "sub-interface",
                                                        "ipv6Dad": "enabled",
                                                        "llAddr": "::",
                                                        "mac": "00:22:BD:F8:19:FF",
                                                        "mode": "regular",
                                                        "mtu": "1500",
                                                        "tDn": "topology/pod-1/paths-104/pathep-[eth1/41]",
                                                        "targetDscp": "unspecified"
                                                    }
                                                }
                                            },
                                            {
                                                "l3extRsNdIfPol": {
                                                    "attributes": {
                                                        "annotation": "",
                                                        "tnNdIfPolName": ""
                                                    }
                                                }
                                            },
                                            {
                                                "l3extRsLIfPCustQosPol": {
                                                    "attributes": {
                                                        "annotation": "",
                                                        "tnQosCustomPolName": ""
                                                    }
                                                }
                                            },
                                            {
                                                "l3extRsIngressQosDppPol": {
                                                    "attributes": {
                                                        "annotation": "",
                                                        "tnQosDppPolName": ""
                                                    }
                                                }
                                            },
                                            {
                                                "l3extRsEgressQosDppPol": {
                                                    "attributes": {
                                                        "annotation": "",
                                                        "tnQosDppPolName": ""
                                                    }
                                                }
                                            },
                                            {
                                                "l3extRsArpIfPol": {
                                                    "attributes": {
                                                        "annotation": "",
                                                        "tnArpIfPolName": ""
                                                    }
                                                }
                                            }
                                        ]
                                    }
                                }
                            ]
                        }
                    },
                    {
                        "l3extInstP": {
                            "attributes": {
                                "annotation": "",
                                "descr": "",
                                "exceptionTag": "",
                                "floodOnEncap": "disabled",
                                "matchT": "AtleastOne",
                                "name": "outepg",
                                "nameAlias": "",
                                "prefGrMemb": "exclude",
                                "prio": "unspecified",
                                "targetDscp": "unspecified"
                            },
                            "children": [
                                {
                                    "fvRsProv": {
                                        "attributes": {
                                            "annotation": "",
                                            "matchT": "AtleastOne",
                                            "prio": "unspecified",
                                            "tnVzBrCPName": "contract-1"
                                        }
                                    }
                                },
                                {
                                    "fvRsCustQosPol": {
                                        "attributes": {
                                            "annotation": "",
                                            "tnQosCustomPolName": ""
                                        }
                                    }
                                },
                                {
                                    "fvRsCons": {
                                        "attributes": {
                                            "annotation": "",
                                            "prio": "unspecified",
                                            "tnVzBrCPName": "contract-2"
                                        }
                                    }
                                }
                            ]
                        }
                    }
                ]
            }
        }
r = s.post(url, data=json.dumps(payload), verify=False)
print(payload)
print(r.text)
print(r.status_code)
print('\n')