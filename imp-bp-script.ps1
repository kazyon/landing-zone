#----------------------------------------Login-AzureRmAccount----------------------------------------#
Write-Host "Login-AzureRmAccount"
Connect-AzAccount

#----------------------------------------Importing the BP from source----------------------------------------#
Write-Host "Importing the BluePrint from source"
Import-AzBlueprintWithArtifact -Name RFA-Policy-Blueprint -InputPath  ".\Blueprints\bp-policies"

#----------------------------------------Comment----------------------------------------#
Write-Host "Import has finished, move to step 2"