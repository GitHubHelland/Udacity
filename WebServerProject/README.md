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
A policy definition was created using two json files, taggingpolicy.json for the policy rules and parameters.json for the parameters. The rules dictated that no new resource could be created if it did not have a tag. The definition was created using Azure CLI and the following command:
az policy definition create –name [name] –rules [rules file] -params [parameters file]

The policy was then assigned via the portal using the name tagging-policy. Using the command az policy assignment list confirmed that the policy had been assigned:

### Create resource group
A resource group was created via the portal in region "UK South", with a tag "environment" in order to meet the new tagging requirments.

### Write Packer template
A packer template file, server.json, was written in order to create a virtual machine image. The resource group specified in the file was the same one that was created in the previous step, "webserver-rg".

### Deploy Packer image
Before the packer image could be deployed, the environment variables it contained had to be exported. This was done using Azure CLI and the following commands:

set ARM_CLIENT_ID = {client id}
set ARM_CLIENT_SECRET = {client secret value}
set ARM_SUBSCRIPTION_ID = {subscription id}

The values for the various variables were obtained as follows:

SUBSCRIPTION ID:
Log in into your azure account
Search and click "Subscriptions"
Select relevant subscription 
Click on the overview
Copy the "Subscription Id"

CLIENT ID:
Log in into your azure account
Find the "Azure Active Directory"
Click "App registrations" under the Manage tab
Click the application that you own (Terraform)
Copy the client Id

CLIENT SECRET:
Log in into your azure account
Find the "Azure Active Directory"
Click "App registrations" under the Manage tab
Click the application that you own (Terraform)
Click the "Certificates & Secrets" under the Manage tab
Create a client secret and copy the client secret value (not the client secret id) 

After this process it is possible to type "echo %{variable-name}%" for each environment variable to confirmed that they have been exported correctly.

After the exporting environment variables, the packer image "myPackerImage" was deployed by using the "packer build server.json" command in Azure CLI.

### Write Terraform template

When running the "terraform apply", I was prompted to import the 

### Output
**Your words here**

