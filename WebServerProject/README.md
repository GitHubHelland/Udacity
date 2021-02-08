# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure

### Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

### Getting Started
1. Clone this repository

2. Create your infrastructure as code

3. Update this README to reflect how someone would use your code.

### Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

### Instructions
### Deploy Packer image
Packer is an open source tool that automates the creation of any type of images for multiple platforms from a single source configuration. Once we deployed the virtual machine with the help of packer, make sure to delete the paker image because does not maintain the state.

Configure Environment variables, go to the terminal and export the environment variables like below.
set ARM_CLIENT_ID=client_id
set ARM_CLIENT_SECRET=secret_value
set ARM_SUBSCRIPTION_ID=subscriptionid

SUBSCRIPTION ID
Login into your azure account
Search and click "Subscriptions"
Select whichever subscriptions are needed
Click on the overview
Copy the Subscription Id

CLIENT ID
Login into your azure account
Search and click "Azure Active Directory"
Click "App registrations" under the Manage tab
Click the application that you own
Copy the client ID

CLIENT SECRET
Login into your azure account
Search and click "Azure Active Directory"
Click "App registrations" under the Manage tab
Click the application that you own (Terraform)
Click the "Certificates & Secrets" under the Manage tab
Create a client secret as you need and copy the client secret value. 

After this process type echo %variable% for each environment variable to check tou have configured properly
Deploy packer image "myPackerImage" by typing "packer build server.json"

### Deploy Terraform

When running the "terraform apply", I was prompted to import the 

### Output
**Your words here**

