#!/bin/bash

aws-vault exec account-a -- terraform -chdir=account-a init --reconfigure --backend-config=./terraform.tfbackend
aws-vault exec account-a -- terraform -chdir=account-a apply

aws-vault exec account-b -- terraform -chdir=account-b init --reconfigure --backend-config=./terraform.tfbackend
aws-vault exec account-b -- terraform -chdir=account-b apply

aws-vault exec account-a -- terraform -chdir=account-a-accept init --reconfigure --backend-config=./terraform.tfbackend
aws-vault exec account-a -- terraform -chdir=account-a-accept apply
