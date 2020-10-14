
Connect-AzAccount
# Get the blueprint we just created
$bp = Get-AzBlueprint -Name Boilerplate #-ManagementGroupId "testdragos"

Publish-AzBlueprint -Blueprint $bp -Version "1.0"

$publishedBp = Get-AzBlueprint -Name "Boilerplate" -LatestPublished  #-ManagementGroupId "testdragos"

New-AzBlueprintAssignment -Name "newdeployment" -Blueprint $publishedBp -Location eastus
#New-AzBlueprintAssignment -Blueprint $bp -Name 'Prod-blueprint' -Location 'eastus'
#Publish-AzBlueprint -Blueprint $bp -Name 'Prod-blueprint' -Version '1.0'