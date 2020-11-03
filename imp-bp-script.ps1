Write-Host "Checking if the Az.Blueprint Module is installed"
Write-Host "================================================"

if ($PSVersionTable.PSEdition -eq 'Desktop' -and (Get-Module -Name Az.Blueprint -ListAvailable)) {
    Write-Warning -Message ('Az module not installed. Having both the AzureRM and ' +
      'Az modules installed at the same time is not supported.')
} else {
    Install-Module -Name Az.Blueprint -AllowClobber -Scope CurrentUser
}

#----------------------------------------Login-AzureRmAccount----------------------------------------#
Write-Host "Connecting to Azure"
Write-Host "==================="
Connect-AzAccount

#----------------------------------------Importing the BP from source----------------------------------------#
Write-Host "Importing the BluePrint from source"
Import-AzBlueprintWithArtifact -Name RFA-Policy-Blueprint -InputPath  ".\Blueprints\bp-policies"

#----------------------------------------Comment----------------------------------------#
Write-Host "Import has finished, move to step 2"