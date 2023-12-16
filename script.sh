# This script creates a three-tier web application

#!/bin/bash

#login to Azure
az login

# Variables
resourceGroupName="Proj1-RG"
location="eastus"
vnetName="tier3Vnet"
subnetWebTierName="WebSubnet"
subnetAppTierName="AppSubnet"
subnetDbTierName="DbSubnet"
routeTableName="tierthreeRT"
myUserName="Donhadley"

# Create a resource group
az group create --name $resourceGroupName --location $location

# Create a Virtual Network and Web Subnet
az network vnet create --resource-group $resourceGroupName --name $vnetName --location $location --address-prefixes 10.0.0.0/16 --subnet-name $subnetWebTierName --subnet-prefixes 10.0.1.0/24

# Create a Route-Table
az network route-table create --location $location --name $routeTableName --resource-group $resourceGroupName

# Create additional two subnets
az network vnet subnet create --resource-group $resourceGroupName --vnet-name $vnetName --name $subnetAppTierName --address-prefixes 10.0.2.0/24 --network-security-group WebNSG 
az network vnet subnet create --resource-group $resourceGroupName --vnet-name $vnetName --name $subnetDbTierName --address-prefixes 10.0.3.0/24

# Create Network Security Groups (NSGs)
az network nsg create --resource-group $resourceGroupName --name WebNSG
az network nsg create --resource-group $resourceGroupName --name AppNSG
az network nsg create --resource-group $resourceGroupName --name DbNSG

# Create Virtual Machines
# Replace the placeholder values with your actual VM configurations
az vm create --resource-group $resourceGroupName --name WebVM --image UbuntuLTS --vnet-name $vnetName --subnet $subnetWebTierName --nsg WebNSG --admin-username $myUserName --admin-password YourAdminPassword
az vm create --resource-group $resourceGroupName --name AppVM --image UbuntuLTS --vnet-name $vnetName --subnet $subnetAppTierName --nsg AppNSG --admin-username $myUserName --admin-password YourAdminPassword
az vm create --resource-group $resourceGroupName --name DbVM --image UbuntuLTS --vnet-name $vnetName --subnet $subnetDbTierName --nsg DbNSG --admin-username $myUserName --admin-password YourAdminPassword
