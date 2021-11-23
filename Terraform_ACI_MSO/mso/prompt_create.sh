#!/bin/bash


echo ##############################################################
echo #                                                            #
echo -ne "View create tenant main.tf, would you like to continue? "
echo #                                                            #
echo ##############################################################
read -p "Y|N: "
if [[ $REPLY =~ ^[Yy]$ ]]
   then
   cd 1-create_tenant
   pwd
   cat main.tf
   echo #######################################################
   echo #                                                     #
   echo -ne "Apply create tenant, would you like to continue? "
   echo #                                                     #
   echo #######################################################
   read -p "Y|N: "
   if [[ $REPLY =~ ^[Yy]$ ]]
   then
      echo "Current Directory: " 
      pwd
      rm terraform.tfstate*
#     /usr/bin/terraform init
      /usr/bin/terraform apply -auto-approve -parallelism=1
      cd ../
      sleep 2
   fi
fi

echo ###############################################################
echo #                                                             #
echo -ne "View create schema, vrf, bd, would you like to continue? "
echo #                                                             #
echo ###############################################################
read -p "Y|N: "
if [[ $REPLY =~ ^[Yy]$ ]]
   then
   cd 2-network_policies
   pwd
   cat main.tf
   echo ###############################################################
   echo #                                                             #
   echo -ne "View create schema, vrf, bd, would you like to continue? "
   echo #                                                             #
   echo ###############################################################
   read -p "Y|N: "
   if [[ $REPLY =~ ^[Yy]$ ]]
   then
      echo "Current Directory: " 
      pwd
      rm terraform.tfstate*
#     /usr/bin/terraform init
      /usr/bin/terraform apply -auto-approve 
      cd ../
      sleep 2
   fi
fi

echo #########################################################################
echo #                                                                       #
echo -ne "View create contract policies main.tf, would you like to continue? "
echo #                                                                       #
echo #########################################################################
read -p "Y|N: "
if [[ $REPLY =~ ^[Yy]$ ]]
   then
   cd 3-contract_policies
   pwd
   cat main.tf
   echo ##################################################################
   echo #                                                                #
   echo -ne "Apply create contract policies, would you like to continue? "
   echo #                                                                #
   echo ##################################################################
   read -p "Y|N: "
   if [[ $REPLY =~ ^[Yy]$ ]]
   then
      echo "Current Directory: " 
      pwd
      rm terraform.tfstate*
#     /usr/bin/terraform init
      /usr/bin/terraform apply -auto-approve -parallelism=1
      cd ../
      sleep 2
   fi
fi

echo ############################################################################
echo #                                                                          #
echo -ne "View create application policies main.tf, would you like to continue? "
echo #                                                                          #
echo ############################################################################
read -p "Y|N: "
if [[ $REPLY =~ ^[Yy]$ ]]
   then
   cd 4-application_policies
   pwd
   cat main.tf
   echo #####################################################################
   echo #                                                                   #
   echo -ne "Apply create application policies, would you like to continue? "
   echo #                                                                   #
   echo #####################################################################
   read -p "Y|N: "
   if [[ $REPLY =~ ^[Yy]$ ]]
   then
      echo "Current Directory: " 
      pwd
      rm terraform.tfstate*
#     /usr/bin/terraform init
      /usr/bin/terraform apply -auto-approve 
      cd ../
      sleep 2
   fi
fi

echo ######################################################################
echo #                                                                    #
echo -ne "View add sites to template main.tf, would you like to continue? "
echo #                                                                    #
echo ######################################################################
read -p "Y|N: "
if [[ $REPLY =~ ^[Yy]$ ]]
   then
   cd 5-add_sites_to_template
   pwd
   cat main.tf
   echo ###############################################################
   echo #                                                             #
   echo -ne "Apply add sites to template, would you like to continue? "
   echo #                                                             #
   echo ###############################################################
   read -p "Y|N: "
   if [[ $REPLY =~ ^[Yy]$ ]]
   then
      echo "Current Directory: " 
      pwd
      rm terraform.tfstate*
#     /usr/bin/terraform init
      /usr/bin/terraform apply -auto-approve -parallelism=1
      cd ../
      sleep 2
   fi
fi

echo #######################################################
echo #                                                     #
echo -ne "View deploy main.tf, would you like to continue? "
echo #                                                     #
echo #######################################################
read -p "Y|N: "
if [[ $REPLY =~ ^[Yy]$ ]]
   then
   cd 6-deploy_template
   cp ORIG/main.deploy main.tf
   pwd
   cat main.tf
   echo ######################################################
   echo #                                                    #
   echo -ne "Deploythe template, would you like to continue? "
   echo #                                                    #
   echo ######################################################
   read -p "Y|N: "
   if [[ $REPLY =~ ^[Yy]$ ]]
   then
      echo "Current Directory: " 
      pwd
      rm terraform.tfstate*
#     /usr/bin/terraform init
      /usr/bin/terraform apply -auto-approve 
      cd ../
      sleep 2
   fi
fi

<< "MULTILINE-COMMENT"

MULTILINE-COMMENT
