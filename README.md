<<<<<<< HEAD
# landing-zone
=======
# Landing Zone repo

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

## Order of execution of the scripts in order to deploy the resources
1. Execute ```.\importbpscript.ps1``` - this will first prompt you to login as Global Owner into the subscription where you want to deploy the resources then it will  import the blueprint policies.
2. Execute ```.\assignbp.ps1``` - his will first prompt you to login as Global Owner into the subscription where it will assign the policies to a worker node to be deployed to the subscription where you logged in.
3. As the next step you need to open a new Powershell and go to the location of the script and execute step 4 
4. Execute ```deployment-script.ps1``` - this will execute the deployment of the Resource Group togheter with the Landing Zone 

Order of execution when deploying the Landing Zone
1. Log In into Azure AD
2. Asking the user for the name of the RG and the location where the RG will be created
3. Creating the Network Component VNET with 2 Subnets
4. Creating the Network Security Group
5. Creating the Recovery Service Vault
6. Creating of the Storage Account
7. Creating the Log Analytics Workspace
>>>>>>> c8b3781ce97d3622bbd295380dcc4d494cdf88f6
