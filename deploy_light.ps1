Write-Host "checking if the Az Moduls is installed"
Write-Host "======================================"

if ($PSVersionTable.PSEdition -eq 'Desktop' -and (Get-Module -Name Az -ListAvailable)) {
    Write-Warning -Message ('Az module not installed. Having both the AzureRM and ' +
      'Az modules installed at the same time is not supported.')
} else {
    Install-Module -Name Az -AllowClobber -Scope CurrentUser
}

#----------------------------------------Logging in Azure----------------------------------------#
Write-Host "Logging into Azure AD"
Write-Host "====================="

Connect-AzAccount

#----------------------------Selecting subscription-------------------------------#
Get-AzSubscription | Format-Table Name, State, SubscriptionID, TenantId

Write-Host "What subscription would you chose ?"
Write-Host "==================================="
$subscriptionid = Read-Host "Input the exact ID of the subscription in this field"

Write-Host "Setting the selected subscription $subscriptionid as working subscription"
Write-host "==========================================================================="
Set-AzContext -SubscriptionId "$subscriptionid"

#----------------------------Installing subscription to Azure Lighthouse#
Write-Host "Adding the selected subscription to Azure LightHouse"
Write-Host "===================================================="
New-AzSubscriptionDeployment -Name Azure_lighthouse -Location eastus -TemplateParameterFile .\Modules\Azure_lighthouse\azure-ligh.parameters.json -TemplateFile .\Modules\Azure_lighthouse\azure-ligh.json

start powershell