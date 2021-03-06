#----------------------------------------Logging in Azure----------------------------------------#
Write-Host "Logging into Azure AD"
Write-Host "====================="
Login-AzureRmAccount 

#----------------------------------------Prompting the user for name and location----------------------------------------#

#Prompts the user what the name of the rg is and where it should create it
Write-Host "Prompting the user for Resource Group Name and Location"
Write-Host "======================================================="
$rg = Read-Host "Please tell us how should the Resource Group be called ?"
$location = Read-Host "What is the desired location? Examples: eastus"
Write-Host "  "
#----------------------------------------Creation of the RG----------------------------------------#
#Creation of the Resource Group at the specified location
Write-Host "Creating the Resource Group at the specified location"
Write-Host "====================================================="
New-AzureRMResourceGroup -Name $rg -Location $location

#----------------------------------------Creation of Vnet----------------------------------------#
#Deployment of the Network Components
Write-Host "Creating the Network Component - VNET"
Write-Host "====================================="
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile .\Modules\Network\vnet.json

#----------------------------------------Creation of NSG----------------------------------------#
#Deployment of the Network Security Group
Write-Host "Creating the Network Component - Network Security Group"
Write-Host "======================================================="
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile .\Modules\NetworkSecurityGroup\networksecuritygroup.json

#----------------------------------------Creation of Recovery Vault----------------------------------------#
#Deployment of the Recovery Service Vault
Write-Host "Creating the Recovery Service Vault"
Write-Host "==================================="
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateParameterFile .\Modules\RecoveryServiceVault\recoveryvault.parameters.json -TemplateFile .\Modules\RecoveryServiceVault\recoveryvault.json

#----------------------------------------Creation of Storage Account----------------------------------------#
#Deployment of the Storage Account
Write-Host "Creating the Storage Account"
Write-Host "============================"
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateParameterFile .\Modules\StorageAccount\storageaccount.parameters.json -TemplateFile .\Modules\StorageAccount\storageaccount.json

#----------------------------------------Creation of Log Analytics----------------------------------------#
#Deployment of the Log Analytics WorkSpace
Write-Host "Creating the Log Analytics Workspace"
Write-Host "===================================="
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateParameterFile .\Modules\LogAnalytics\loganalyticsworkspace.parameters.json -TemplateFile .\Modules\LogAnalytics\loganalyticsworkspace.json

Write-Host "==================================================================================================="
Write-Host "Deployment of the resources is ready, wait 2-5 minutes in order for them to be created and deployed"