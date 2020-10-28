#----------------------------Selecting subscription-------------------------------#
Get-AzSubscription

Write-Host "What subscription would you chose ?"
Write-Host "==================================="
$subscriptionname = Read-Host "Input the exact name of the subscription in this field"

Set-AzContext -SubscriptionName "$subscriptionname"

#----------------------------Installing subscription to Azure Lighthouse#
Write-Host "Adding the selected subscription to Azure LightHouse"
Write-Host "===================================================="
New-AzSubscriptionDeployment -Name Azure_lighthouse -Location eastus -TemplateParameterFile .\Modules\Azure_lighthouse\azure-ligh.parameters.json -TemplateFile .\Modules\Azure_lighthouse\azure-ligh.json
