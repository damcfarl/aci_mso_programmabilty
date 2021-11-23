#/bin/bash

cd 6-deploy_template
echo "Current Directory: " 
cp ORIG/main.undeploy main.tf
pwd
/usr/bin/terraform apply -auto-approve
cp ORIG/main.deploy main.tf
cd ../
sleep 2

cd 5-add_sites_to_template
echo "Current Directory: " 
pwd
/usr/bin/terraform destroy -auto-approve
cd ../
sleep 2

cd 4-application_policies
echo "Current Directory: " 
pwd
/usr/bin/terraform destroy -auto-approve
cd ../
sleep 2

cd 3-contract_policies
echo "Current Directory: " 
pwd
/usr/bin/terraform destroy -auto-approve
cd ../
sleep 2

cd 2-network_policies
echo "Current Directory: " 
pwd
/usr/bin/terraform destroy -auto-approve 
cd ../
sleep 2

cd 1-create_tenant
echo "Current Directory: " 
pwd
/usr/bin/terraform destroy -auto-approve -parallelism=1
cd ../
