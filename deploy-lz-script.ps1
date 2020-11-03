
#----------------------------------------Logging in Azure----------------------------------------#
Write-Host "Checking version of Module"
Write-Host "====================="

if ($PSVersionTable.PSEdition -eq 'Desktop' -and (Get-Module -Name AzureRM -ListAvailable)) {
    Write-Warning -Message ('Az module not installed. Having both the AzureRM and ' +
      'Az modules installed at the same time is not supported.')
} else {
    Install-Module -Name Az -AllowClobber -Scope CurrentUser
}

Write-Host "Logging into Azure AD"
Write-Host "====================="

Login-AzureRmAccount

#----------------------------------------Prompting the user for name and location----------------------------------------#
#Prompts the user what the name of the rg is and where it should create it
Write-Host "Prompting the user for Resource Group Name and Location"
Write-Host "======================================================="
$rg = Read-Host "What is the name of the Resource Group where you want to deploy the Landing-Zone ?"
$location = Read-Host "Where would you like to deploy the RG and Landing-zone? 
Example:
-eastus = East US
-eastus2 = East US 2
-northcentralus = North Central US
-centralus = Central US
-westus = West US
-westus2 = West US 2
-westcentralus = West Central US
-canadacentral = Canada Central
-uksouth = UK South
-ukwest = UK West
-westeurope = West Europe "
Write-Host "  "
#----------------------------------------Creation of the RG----------------------------------------#
#Creation of the Resource Group at the specified location
Write-Host "Creating the Resource Group at the specified location"
Write-Host "====================================================="

New-AzureRMResourceGroup -Name $rg -Location $location

Write-Host "==============Deployed==================="
#----------------------------------------Creation of Vnet----------------------------------------#
#Deployment of the Network Components
Write-Host "Creating the Network Component - VNET"
Write-Host "====================================="

New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -Location $location -TemplateFile .\Modules\Network\vnet.json

Write-Host "==============Deployed==================="
#----------------------------------------Creation of NSG----------------------------------------#
#Deployment of the Network Security Group
Write-Host "Creating the Network Component - Network Security Group"
Write-Host "======================================================="

New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -Location $location -TemplateFile .\Modules\NetworkSecurityGroup\networksecuritygroup.json

Write-Host "==============Deployed==================="
#----------------------------------------Creation of Recovery Vault----------------------------------------#
#Deployment of the Recovery Service Vault
Write-Host "Creating the Recovery Service Vault"
Write-Host "==================================="

New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -Location $location -TemplateParameterFile .\Modules\RecoveryServiceVault\recoveryvault.parameters.json -TemplateFile .\Modules\RecoveryServiceVault\recoveryvault.json

Write-Host "==============Deployed==================="
#----------------------------------------Creation of Storage Account----------------------------------------#
#Deployment of the Storage Account
Write-Host "Creating the Storage Account"
Write-Host "============================"

New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -Location $location -TemplateParameterFile .\Modules\StorageAccount\storageaccount.parameters.json -TemplateFile .\Modules\StorageAccount\storageaccount.json

Write-Host "==============Deployed==================="
#----------------------------------------Creation of Log Analytics----------------------------------------#
#Deployment of the Log Analytics WorkSpace
Write-Host "Creating the Log Analytics Workspace"
Write-Host "===================================="


New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -Location $location -TemplateParameterFile .\Modules\LogAnalytics\loganalyticsworkspace.parameters.json -TemplateFile .\Modules\LogAnalytics\loganalyticsworkspace.json

Write-Host "==================================================================================================="
Write-Host "Deployment of the resources is ready, wait 2-5 minutes in order for them to be created and deployed"

Write-Host "==================Summary of deployment========================="
Write-Host "============Table of execution Resource Group==================="
Write-Host "================================================================"
Write-Host "Resource Group: $rg"
Write-Host "Location: $location"
Write-Host "================================================================"
Write-Host "============Table of execution VNET============================="
Write-Host "================================================================"
Write-Host "Vnet Address Prefix: 10.0.0.0/16 "
Write-Host "Subnet 1 Address Prefix: 10.0.0.0/24"
Write-Host "Subnet 2 Address Prefix: 10.0.0.0/24"
Write-Host "Location : $location "
Write-Host "================================================================"
Write-Host "============Table of execution Network Security group==========="
Write-Host "=========================================="
Write-Host "Rule 1: Allow SSH || Protocol TCP || Destination Port 22 || SourceAddressPrefix 64.95.224.144/32 ; 64.74.40.0/24"
Write-Host "Rule 2: AllowMultiplePorts || Protocol TCP || Destination Port 3389; 5985; 5986 || SourceAddressPrefix 64.95.224.144/32"
Write-Host "Rule 3: RDPfrom RFA || Protocol * || Destination Port 3389 || SourceAddressPrefix 64.74.40.0/24"
Write-Host "Location : $location "
Write-Host "================================================================"
Write-Host "============Table of execution Recovery Vault==================="
Write-Host "================================================================"
Write-Host "changestoragetype : false"
Write-Host "vaultStorageType : GeoRedundant"
Write-Host "Location : $location"
Write-Host "Sku: Standard"
Write-Host "================================================================"
Write-Host "============Table of execution Storage Account=================="
Write-Host "================================================================"
Write-Host "StorageAccountType : Standard_LRS"
Write-Host "Location : $location"
Write-Host "================================================================"
Write-Host "============Table of execution Log Analytics Workspace=========="
Write-Host "================================================================"
Write-Host "SKU: PERGB2018"
Write-Host "Location : $location"
Write-Host "Retention Days of the logs: 30 Days"
Write-Host "Resource Permisiion : true"
Write-Host "================================================================"