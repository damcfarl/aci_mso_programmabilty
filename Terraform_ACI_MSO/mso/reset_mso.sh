#!/bin/bash


echo ##############################################################
echo #                                                            #
echo -ne "performing terraform init. This will take many minutes" #
echo #                                                            #
echo ##############################################################
read -p "Y|N: "
if [[ $REPLY =~ ^[Yy]$ ]]
  then
   cd 1-create_tenant
   pwd
#    /usr/bin/terraform init
#    cp -rp .terraform terraform_dot
#    cp .terraform.lock.hcl terraform.lock.hcl_dot
     mv terraform_dot .terraform
     mv terraform.lock.hcl_dot .terraform.lock.hcl
      cd ../
      sleep 2
   cd 2-network_policies
   pwd
#    /usr/bin/terraform init
#    cp -rp .terraform terraform_dot
#    cp .terraform.lock.hcl terraform.lock.hcl_dot
     mv terraform_dot .terraform
     mv terraform.lock.hcl_dot .terraform.lock.hcl
      cd ../
      sleep 2
   cd 3-contract_policies
   pwd
#    /usr/bin/terraform init
#    cp -rp .terraform terraform_dot
#    cp .terraform.lock.hcl terraform.lock.hcl_dot
     mv terraform_dot .terraform
     mv terraform.lock.hcl_dot .terraform.lock.hcl
      cd ../
      sleep 2
   cd 4-application_policies
   pwd
#    /usr/bin/terraform init
#    cp -rp .terraform terraform_dot
#    cp .terraform.lock.hcl terraform.lock.hcl_dot
     mv terraform_dot .terraform
     mv terraform.lock.hcl_dot .terraform.lock.hcl
      cd ../
      sleep 2
   cd 5-add_sites_to_template
   pwd
#    /usr/bin/terraform init
#    cp -rp .terraform terraform_dot
#    cp .terraform.lock.hcl terraform.lock.hcl_dot
     mv terraform_dot .terraform
     mv terraform.lock.hcl_dot .terraform.lock.hcl
      cd ../
      sleep 2
   cd 6-deploy_template
      pwd
#    /usr/bin/terraform init
#    cp -rp .terraform terraform_dot
#    cp .terraform.lock.hcl terraform.lock.hcl_dot
     mv terraform_dot .terraform
     mv terraform.lock.hcl_dot .terraform.lock.hcl
fi

<< "MULTILINE-COMMENT"

MULTILINE-COMMENT
