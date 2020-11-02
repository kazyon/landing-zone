#----------------------------------------Login-AzureRmAccount----------------------------------------#
Write-Host "Connecting to Azure"
Write-Host "==================="
Login-AzureRmAccount

#----------------------------------------Importing the BP from source----------------------------------------#
Write-Host "Importing the BluePrint from source"
Import-AzBlueprintWithArtifact -Name RFA-Policy-Blueprint -InputPath  ".\Blueprints\bp-policies"

#----------------------------------------Comment----------------------------------------#
Write-Host "Import has finished, move to step 2"