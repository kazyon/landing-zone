#Login-AzureRmAccount

Connect-AzAccount
#Get-AzureRmSubscription

Import-AzBlueprintWithArtifact -Name Boilerplate -InputPath  ".\Blueprints\substest1"

#.\Blueprints\bluprintspowershell.ps1 -Mode Import -ImportDir .\Blueprints\subs-managemnt\ -NewBluePrintName Boilerplate #-SubscriptionId fe42e645-902d-46b7-be7c-7f9fe59a2b29

