Write-Host "Checking version of Module"
Write-Host "====================="

if ($PSVersionTable.PSEdition -eq 'Desktop' -and (Get-Module -Name Az.Blueprint -ListAvailable)) {
    Write-Warning -Message ('Az module not installed. Having both the AzureRM and ' +
      'Az modules installed at the same time is not supported.')
} else {
    Install-Module -Name Az.Blueprint -AllowClobber -Scope CurrentUser
}

#---------------------------------------Connecting to Azure AD----------------------------------------#
Write-Host "Connecting to Azure AD"
Write-Host "======================"
Connect-AzAccount

#---------------------------------------Setting the name of the variable----------------------------------------#
Write-Host "Setting the name of the variable"
Write-Host "================================"
$bp = Get-AzBlueprint -Name RFA-Policy-Blueprint

#---------------------------------------Publish the BluePrint----------------------------------------#
Write-Host "Publish the BluePrint"
Write-Host "====================="
Publish-AzBlueprint -Blueprint $bp -Version "1.0"

#---------------------------------------Getting the latest version of the BluePrint----------------------------------------#
Write-Host "Getting the latest version of the BluePrint"
Write-Host "==========================================="
$publishedBp = Get-AzBlueprint -Name "RFA-Policy-Blueprint" -LatestPublished

#---------------------------------------Assigning the Policy to a worker node----------------------------------------#
Write-Host "Assigning the Policy to a worker node"
Write-Host "====================================="
New-AzBlueprintAssignment -Name "RFA-Policy-Blueprint-Deployment" -Blueprint $publishedBp -Location eastus

#---------------------------------------Starting a new Powershell Window----------------------------------------#
Write-Host "The script will now open a new PowerShell Command Prompt to load the RM Module"
Write-Host "=============================================================================="

Write-Host "Starting the Powershell Window in 3... 2... 1... "
start powershell