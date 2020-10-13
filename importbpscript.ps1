Login-AzureRmAccount

Get-AzureRmSubscription

.\Blueprints\bluprintspowershell.ps1 -Mode Import -ImportDir .\Blueprints\MG-testdragos\newpolicy -NewBluePrintName Prod-blueprint -SubscriptionId fe42e645-902d-46b7-be7c-7f9fe59a2b29

#New-AzBlueprintAssignment -Blueprint $bp -Name 'Prod-blueprint' -Location 'eastus'
#Publish-AzBlueprint -Blueprint $bp -Name 'Prod-blueprint' -Version '1.0'