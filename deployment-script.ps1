#Logging in into Azure 
#Login-AzAccount
Login-AzureRmAccount 

#$mngmtgroup = Read-Host "What is the name of the Management Group and deployment that you what to deploy ?"
#$location = Read-Host "What is the desired location? Examples: eastus"

#New-AzureManagementGroupDeployment `
#  -Name $mngmtgroup `
#  -Location $location `
#  -ManagementGroupId $mngmtgroup `
#  -TemplateUri "https://raw.githubusercontent.com/Azure/azure-docs-json-samples/master/management-level-deployment/azuredeploy.json"

#Prompts the user what the name of the rg is and where it should create it
$rg = Read-Host "Please tell us how should the Resource Group be called ?"
$location = Read-Host "What is the desired location? Examples: eastus"

#Creation of the Resource Group at the specified location
New-AzureRMResourceGroup -Name $rg -Location $location

#Deployment of the Network Components
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile .\Modules\Network\vnet.json

#Deployment of the Network Security Group
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile .\Modules\NetworkSecurityGroup\networksecuritygroup.json

#Deployment of the Recovery Service Vault
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateParameterFile .\Modules\RecoveryServiceVault\recoveryvault.parameters.json -TemplateFile .\Modules\RecoveryServiceVault\recoveryvault.json

#Deployment of the Storage Account
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateParameterFile .\Modules\StorageAccount\storageaccount.parameters.json -TemplateFile .\Modules\StorageAccount\storageaccount.json

#Deployment of the Log Analytics WorkSpace
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateParameterFile .\Modules\LogAnalytics\loganalyticsworkspace.parameters.json -TemplateFile .\Modules\LogAnalytics\loganalyticsworkspace.json