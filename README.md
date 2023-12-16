# Three-Tier Web Application Deployment Script

This Bash script automates the deployment of a three-tier web application infrastructure on Microsoft Azure. The script sets up a Virtual Network (VNet) with three subnets for the web, application, and database tiers. It also creates Network Security Groups (NSGs) for each subnet, a route table, and deploys virtual machines in each subnet.

## Prerequisites

Before running this script, ensure that you have the following prerequisites:

1. **Azure CLI**: Make sure you have the Azure Command-Line Interface (CLI) installed.

2. **Azure Subscription**: You need an active Azure subscription and appropriate permissions to create resources.

3. **Configuration Variables**: Adjust the variables in the script to match your desired configurations, such as resource group name, location, and VM configurations.

## Usage

1. **Clone this repository:**

    ```bash
    git clone https://github.com/your-username/your-repo.git
    ```

2. **Navigate to the script directory:**

    ```bash
    cd your-repo
    ```

3. **Make the script executable:**

    ```bash
    chmod +x deploy_three_tier_app.sh
    ```

4. **Run the script:**

    ```bash
    ./deploy_three_tier_app.sh
    ```

## Script Overview

The script performs the following steps:

1. **Azure Login**: Log in to your Azure account using the `az login` command.

2. **Resource Group Creation**: Create an Azure resource group with the specified name and location.

3. **Virtual Network Creation**: Set up a Virtual Network with three subnets (web, application, and database) and their respective address prefixes.

4. **Route Table Creation**: Create a route table for the virtual network.

5. **Additional Subnet Creation**: Add two more subnets for the application and database tiers.

6. **Network Security Groups Creation**: Establish Network Security Groups for each subnet to control inbound and outbound traffic.

7. **Virtual Machine Deployment**: Deploy virtual machines for the web, application, and database tiers using the specified configurations.

## Customization

Modify the script by updating the variables section to match your specific requirements. Replace placeholder values with your Azure configurations, such as resource group name, location, VM images, and authentication credentials.

## Disclaimer

This script is provided as-is without any warranty. Review and understand the script before executing it in a production environment. Ensure that you have the necessary permissions and adhere to best practices for security and compliance.

Happy deploying!
