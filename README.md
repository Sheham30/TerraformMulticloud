# TerraformMulticloud

## Prerequisites
- Required both Azure and AWS accounts
- Configure AWS CLI and Azure CLI on you local machine

## Changes to be done in files

- Create SSH key using the following command. Add this ssh key file path to module/azure_instance.tf file in azurerm_linux_virtual_machine resource

      ssh-keygen -t rsa -b 4096

- Run "az group list -otable" to get resource group name and resource group location. These values will be added to "resource_group_name" and resource_group_location variables in variables.tf file
- Enter subnet-id to variable "aws_subnet". Subnet Id can be found in AWS management console 


## To Create Resources, run

Import Azure module. Run this command to Get Subscription Id of Azure

    az group list

Then run the following import command to import module.

    terraform import module.azure[0].azurerm_resource_group.rg <SUBSCRIPTION>
    
 Finally run terraform commands
 
    terraform validate
    terraform plan
    terraform apply -auto-approve
    
Enter "true" for both Enable AWS and Enable Azure. Then enter number of instances you want to create.
    
![image](https://user-images.githubusercontent.com/71825816/236160454-fec62265-6d62-48f7-876f-ffa340c02c16.png)

Resources will be created :) 
  

    
    
 

