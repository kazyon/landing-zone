Connect-AzAccount

Write-Host "Step 1"
Select-AzSubscription 

Write-Host "Step 2"
# To retrieve the objectId for an Azure AD group
(Get-AzADGroup -DisplayName '<yourGroupName>').id

# To retrieve the objectId for an Azure AD user
(Get-AzADUser -UserPrincipalName '<yourUPN>').id

# To retrieve the objectId for an SPN
(Get-AzADApplication -DisplayName '<appDisplayName>' | Get-AzADServicePrincipal).Id

# To retrieve role definition IDs
(Get-AzRoleDefinition -Name '<roleName>').id

<# Write-Host "Step 1"
Write-Host "Step 1"
Write-Host "Step 1"
Write-Host "Step 1"
Write-Host "Step 1"
Write-Host "Step 1"
Write-Host "Step 1" #>

Scripts - webpages

https://app.pluralsight.com/library/courses/configuring-managing-office-365-security/table-of-contents

https://docs.microsoft.com/en-us/azure/lighthouse/samples/

https://docs.microsoft.com/en-us/azure/lighthouse/how-to/onboard-customer

https://partner.microsoft.com/en-us/pcv/dashboard/overview

https://www.altaro.com/msp-dojo/onboard-azure-lighthouse/

https://www.altaro.com/msp-dojo/microsoft-365-lighthouse-msp/

https://github.com/Azure/Azure-Lighthouse-samples