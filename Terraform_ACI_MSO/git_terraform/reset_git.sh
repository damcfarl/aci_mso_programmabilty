#/bin/bash

echo "Hello"
export PS1='$(whoami):${PWD/*\//}:~$ '

#!/bin/bash

echo -ne "Reset git environment, would you like to continue? " 
read -p "Y|N: "
if [[ $REPLY =~ ^[Yy]$ ]]
then
   echo "Reset git_terraform files"
   echo `pwd`
   mv gitignore_dot .gitignore
   mv gitlab-ci.yml_dot .gitlab-ci.yml
   mv bash_settings_dot .bashrc
#   cp .gitignore gitignore_dot
#   cp .gitlab-ci.yml gitlab-ci.yml_dot
#   cp .bashrc bash_settings_dot
  cat ./bash_add >> ~/.bashrc
   mkdir ~/.terraform.d/plugins
  chmod 777 ~/.terraform.d/plugins/
  cp -rp ~/Documents/GS_ACI_Automation_with_Terraform_dcloud/cli_terraform/2-tier_demo/.terraform/providers/registry.terraform.io/ ~/.terraform.d/plugins/

  mkdir ../tf_state
  touch ../tf_state/terraform.tfstate
  chmod 777 ../tf_state
  chmod 777 ../tf_state/terraform.tfstate
  ssh-keygen -t rsa -b 2048 -C "user cisco terraform demo"
  git init
  cat ~/.ssh/id_rsa.pub  
  bash
fi
