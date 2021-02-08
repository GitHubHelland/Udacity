# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started
### Steps
1. Clone udacity repository

2. Create and assign a tagging policy "tagging-policy" which denies creation of resources without tags

3. Create resource group "webserver-rg"

4. Create and deploy virtual machine image "myPackerImage" within "webserver-rg" using packer

5. Deploy infrastructure (network, load balancer and x number of virtual machines) using terraform

6. Destroy infrastructure using terraform


### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions
### Create and assign tagging policy
A policy definition was created using two json files, taggingpolicy.json for the policy rules and parameters.json for the parameters. The rules dictated that no new resource could be created if it did not have a tag. The definition was created using Azure CLI and the following command (first logging in using "az login"):

az policy definition create –name [name] –rules [rules file] -params [parameters file]

The policy was then assigned via the portal using the name tagging-policy. Using the command "az policy assignment list" confirmed that the policy had been assigned.

### Create resource group
A resource group was created via the portal in region "UK South", with a tag "environment" in order to meet the new tagging requirments.

### Write Packer template
A packer template file, server.json, was written in order to create a virtual machine image. The resource group specified in the file was the same one that was created in the previous step, "webserver-rg".

### Deploy Packer image
Before the packer image could be deployed, the environment variables it contained had to be exported. This was done using Azure CLI and the following commands (first logging in using "az login"):

* set ARM_CLIENT_ID = {client id} 
* set ARM_CLIENT_SECRET = {client secret value} 
* set ARM_SUBSCRIPTION_ID = {subscription id}

The values for the various variables were obtained as follows:

SUBSCRIPTION ID: 
1. Log in into your azure account Search and click "Subscriptions" 
1. Select relevant subscription 
1. Click on the overview Copy the "Subscription Id"

CLIENT ID: 
1. Log in into your azure account 
1. Find the "Azure Active Directory" 
1. Click "App registrations" under the Manage tab 
1. Click the application that you own (Terraform) Copy the client Id

CLIENT SECRET: 
1. Log in into your azure account 
1. Find the "Azure Active Directory" 
1. Click "App registrations" under the Manage tab Click the application that you own (Terraform) 
1. Click the "Certificates & Secrets" under the Manage tab 
1. Create a client secret and copy the client secret value (not the client secret id)

After this process it is possible to type "echo %{variable-name}%" for each environment variable to confirmed that they have been exported correctly.

After the exporting environment variables, the packer image "myPackerImage" was deployed by using the "packer build server.json" command in Azure CLI.

### Write Terraform template
Two terraform template files were written, main.tf and vars.tf. Some important points:

* Each item of infrastructure was given the tag "environment" to conform with the tagging policy
* Password requirements inlcude at least one uppercase, lowercase, numerical and special character so the default password was set to "Password1!"
* For the virtual machine availibility set, the following variables, "platform_fault_domain_count" and "platform_update_domain_count" were set to 2 in accordance with terraform documentation
* Instead of specifying the VM type and size, a reference to the previously created packer image was provided using the following path: "/subscription/{subscription id}/resourcesGroups/webserver-rg/providers/Microsoft.Compute/images/myPackerImage"
* A variable called vm_count was provided. In this deployment it was set to 2, hence creating 2 VMs, but it can be set to a higher number if more VMs are desired.

### Deploy Terraform  infrastrutcture
Prior to deploying the Terraform infrastructure I logged in Azure CLI to log in using the "az login" command. I then ran the command "az policy assignment list" to confirm that the policy was still available.

Continuing using Azure CLI the I took the following steps:
1. Initialise terraform using the "terraform init" command
1. Create a terraform execution plan and writing it to a file "solution.plan" using the command "terraform plan -out solution.plan"
1. Apply the changes required by the execution plan and deploying the infrastructure using the command "terraform apply"
1. At this point I got an error message stating that the resource group I was trying to creat alread existed and that it had to be imported into the state. I used the command terraform import/azurerm_resource_group_main /subscriptions/{subscription id}/resourceGroups/webserver-rg to import the resrource group.
1. I then tried the "terraform apply" command again and all the infrastructure from main.tf was created except for the network interface cards and the virtual machines which came up with error messages
1. I corrected the errors (typos in the main.tf and and an accidentily deleted packer image) and ran "terraform apply" again, this time completing the deployment.
1. I then ran the command "terraform plan -out solution.plan" again, which confirmed that all the changes required had been completed and that 0 additional changes were required.
1. I then ran the "terraform show" command to list all the deployed infrastructure, and finally, after checking in the portal that all the infrastrucutre had been created, I ran the "terraform destory" command to delete all the infrastructure.


### Output
Output from "az policy assignment list" command
![policy](https://github.com/GitHubHelland/Udacity/blob/master/WebServerProject/Screenshots/Az%20policy%20assignment%20list.jpg)


