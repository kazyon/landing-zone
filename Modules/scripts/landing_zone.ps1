

.".\Modules\scripts\rg_and_location.ps1"
Write-host "$rg"
Write-host "$location"

$rgSplat = @{
    ResourceGroupName = $rg
    Location = $location
    TemplateFile = $null
}
#----------------------------------------Creation of KeyVault----------------------------------------#
#Deployment of the KeyVault
$rgSplat.Set_Item('TemplateFile','.\Modules\KeyVault\keyvault.json')
Write-Host "Creating the KeyVault"
Write-Host "====================================="
New-AzureRmResourceGroupDeployment @rgSplat

#----------------------------------------Creation of Vnet----------------------------------------#
$rgSplat.Set_Item('TemplateFile','.\Modules\Network\vnet.json')
#Deployment of the Network Components
Write-Host "Creating the Network Component - VNET"
Write-Host "====================================="
New-AzureRmResourceGroupDeployment @rgSplat

#----------------------------------------Creation of NSG----------------------------------------#
#Deployment of the Network Security Group
$rgSplat.Set_Item('TemplateFile','.\Modules\NetworkSecurityGroup\networksecuritygroup.json')
Write-Host "Creating the Network Component - Network Security Group"
Write-Host "======================================================="
New-AzureRmResourceGroupDeployment @rgSplat

#----------------------------------------Creation of Recovery Vault----------------------------------------#
$rgSplat.Set_Item('TemplateFile','.\Modules\RecoveryServiceVault\recoveryvault.json')
$rgSplat.Add('TemplateParameterFile','.\Modules\RecoveryServiceVault\recoveryvault.parameters.json')
#Deployment of the Recovery Service Vault
Write-Host "Creating the Recovery Service Vault"
Write-Host "==================================="
New-AzureRmResourceGroupDeployment @rgSplat

#----------------------------------------Creation of Storage Account----------------------------------------#
$rgSplat.Set_Item('TemplateFile','.\Modules\StorageAccount\storageaccount.json')
$rgSplat.Set_Item('TemplateParameterFile','.\Modules\StorageAccount\storageaccount.parameters.json')
#Deployment of the Storage Account
Write-Host "Creating the Storage Account"
Write-Host "============================"
New-AzureRmResourceGroupDeployment @rgSplat

#----------------------------------------Creation of Log Analytics----------------------------------------#
$rgSplat.Set_Item('TemplateFile','.\Modules\LogAnalytics\loganalyticsworkspace.json')
$rgSplat.Set_Item('TemplateParameterFile','.\Modules\LogAnalytics\loganalyticsworkspace.parameters.json')
#Deployment of the Log Analytics WorkSpace
Write-Host "Creating the Log Analytics Workspace"
Write-Host "===================================="
New-AzureRmResourceGroupDeployment @rgSplat

Write-Host "==================================================================================================="
Write-Host "Deployment of the resources is ready, wait 2-5 minutes in order for them to be created and deployed"