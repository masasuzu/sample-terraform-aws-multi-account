#!/bin/bash

aws-vault exec bastion -- terraform init --reconfigure --backend-config=./terraform.tfbackend
aws-vault exec bastion -- terraform destroy
