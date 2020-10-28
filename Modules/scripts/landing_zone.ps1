#----------------------------------------Creation of KeyVault----------------------------------------#
#Deployment of the KeyVault
Write-Host "Creating the KeyVault"
Write-Host "====================================="
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -Location $location -TemplateFile .\Modules\KeyVault\keyvault.json

#----------------------------------------Creation of Vnet----------------------------------------#
#Deployment of the Network Components
Write-Host "Creating the Network Component - VNET"
Write-Host "====================================="
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -Location $location -TemplateFile .\Modules\Network\vnet.json

#----------------------------------------Creation of NSG----------------------------------------#
#Deployment of the Network Security Group
Write-Host "Creating the Network Component - Network Security Group"
Write-Host "======================================================="
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -TemplateFile .\Modules\NetworkSecurityGroup\networksecuritygroup.json

#----------------------------------------Creation of Recovery Vault----------------------------------------#
#Deployment of the Recovery Service Vault
Write-Host "Creating the Recovery Service Vault"
Write-Host "==================================="
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -Location $location -TemplateParameterFile .\Modules\RecoveryServiceVault\recoveryvault.parameters.json -TemplateFile .\Modules\RecoveryServiceVault\recoveryvault.json

#----------------------------------------Creation of Storage Account----------------------------------------#
#Deployment of the Storage Account
Write-Host "Creating the Storage Account"
Write-Host "============================"
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -Location $location -TemplateParameterFile .\Modules\StorageAccount\storageaccount.parameters.json -TemplateFile .\Modules\StorageAccount\storageaccount.json

#----------------------------------------Creation of Log Analytics----------------------------------------#
#Deployment of the Log Analytics WorkSpace
Write-Host "Creating the Log Analytics Workspace"
Write-Host "===================================="
New-AzureRmResourceGroupDeployment -ResourceGroupName $rg -Location $location -TemplateParameterFile .\Modules\LogAnalytics\loganalyticsworkspace.parameters.json -TemplateFile .\Modules\LogAnalytics\loganalyticsworkspace.json

Write-Host "==================================================================================================="
Write-Host "Deployment of the resources is ready, wait 2-5 minutes in order for them to be created and deployed"