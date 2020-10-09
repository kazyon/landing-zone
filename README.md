### Landing Zone repo

This repo will deploy to any subscription the following components: 
                -Log Analytics Workspace
                -1 Vnet with 2 Subnets
                -Network Security Group
                -Recovery Service Vault
                -Storage Account
Some of the values are harcoded:
location 

Important
The deployment code will ask the user for the name of the RG and the location where the RG will be created

Order of execution 
1. Log In into Azure AD
2. Asking the user for the name of the RG and the location where the RG will be created
3. Creating the Network Component VNET with 2 Subnets
4. Creating the Network Security Group
5. Creating the Recovery Service Vault
6. Creating of the Storage Account
7. Creating the Log Analytics Workspace