
Login-AzAccount

$bpDefinition = Get-AzBlueprint -SubscriptionId 'fe42e645-902d-46b7-be7c-7f9fe59a2b29' -Name 'substest1' -Version '1.0'
Export-AzBlueprintWithArtifact -Blueprint $bpDefinition -OutputPath 'C:\Blueprints'