#!/bin/bash


echo ##############################################################
echo #                                                            #
echo -ne "View create tenant main.tf, would you like to continue? "
echo #                                                            #
echo ##############################################################
   cd 1-create_tenant
   pwd
      echo "Current Directory: " 
      pwd
      rm terraform.tfstate*
#     /usr/bin/terraform init
      /usr/bin/terraform apply -auto-approve -parallelism=1
      cd ../
      sleep 2

echo ########################################################################
echo #                                                                      #
echo -ne "View create network policies main.tf, would you like to continue? "
echo #                                                                      #
echo ########################################################################
   cd 2-network_policies
   pwd
   cat main.tf
      echo "Current Directory: " 
      pwd
      rm terraform.tfstate*
#     /usr/bin/terraform init
      /usr/bin/terraform apply -auto-approve 
      cd ../
      sleep 2
echo #########################################################################
echo #                                                                       #
echo -ne "View create contract policies main.tf, would you like to continue? "
echo #                                                                       #
echo #########################################################################
   cd 3-contract_policies
   pwd
   cat main.tf
      echo "Current Directory: " 
      pwd
      rm terraform.tfstate*
#     /usr/bin/terraform init
      /usr/bin/terraform apply -auto-approve -parallelism=1
      cd ../
      sleep 2

echo ############################################################################
echo #                                                                          #
echo -ne "View create application policies main.tf, would you like to continue? "
echo #                                                                          #
echo ############################################################################
   cd 4-application_policies
   pwd
   cat main.tf
      echo "Current Directory: " 
      pwd
      rm terraform.tfstate*
#     /usr/bin/terraform init
      /usr/bin/terraform apply -auto-approve 
      cd ../
      sleep 2
   cd 5-add_sites_to_template
   pwd
   cat main.tf
      echo "Current Directory: " 
      pwd
      rm terraform.tfstate*
#     /usr/bin/terraform init
      /usr/bin/terraform apply -auto-approve -parallelism=1
      cd ../
      sleep 2
echo #######################################################
echo #                                                     #
echo -ne "View deploy main.tf, would you like to continue? "
echo #                                                     #
echo #######################################################
   cd 6-deploy_template
   cp ORIG/main.deploy main.tf
   pwd
   cat main.tf
      echo "Current Directory: " 
      pwd
      rm terraform.tfstate*
#     /usr/bin/terraform init
      /usr/bin/terraform apply -auto-approve 
      cd ../
      sleep 2

<< "MULTILINE-COMMENT"

MULTILINE-COMMENT
