#!/usr/local/bin/python3.7
#import sys
import requests
import json
from requests.packages.urllib3.exceptions import InsecureRequestWarning
requests.packages.urllib3.disable_warnings(InsecureRequestWarning)

headers = {'content-type': "application/json"}


apic = '10.122.143.36'
tenant = 'dm_demo_json'
aci_user = 'apic:ACI_TOA\\damcfarl'
aci_pwd = 'cisco!123'

s = requests.Session()
print('\n')


# Login to ACI fabric
print("login to ACI fabric: "+apic)
url = 'https://'+apic+'/api/mo/aaaLogin.json'
payload = {'aaaUser': {'attributes': {'name': aci_user, 'pwd': aci_pwd}}}
r = s.post(url, data=json.dumps(payload), verify=False)
cookies = r.cookies
print(r.status_code)
print('\n')

url = "https://"+apic+"/api/node/mo/uni/tn-"+tenant+".json"
payload = {
  "fvTenant": {
    "attributes": {
      "dn": "uni/tn-"+tenant+"",
      "name": ""+tenant+"",
      "rn": "tn-"+tenant+"",
      "status": "created,modified"
    },
    "children": []
  }
}
r = s.post(url, data=json.dumps(payload), verify=False)
print(payload)
print(r.text)
print(r.status_code)
print('\n')