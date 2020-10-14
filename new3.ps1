#$blueprints = Get-AzBlueprint -SubscriptionId 'fe42e645-902d-46b7-be7c-7f9fe59a2b29' -Name 'Prod-blueprint'

Connect-AzAccount

#Push a sample blueprint definition to Azure:
Import-AzBlueprintWithArtifact -Name Boilerplate -SubscriptionId "fe42e645-902d-46b7-be7c-7f9fe59a2b29" -ImportDir  ".\Blueprint\MG-testdragos\newpolicy"

# Get the blueprint we just created
$bp = Get-AzBlueprint -Name Boilerplate -SubscriptionId "fe42e645-902d-46b7-be7c-7f9fe59a2b29"

# Publish version 1.0
Publish-AzBlueprint -Blueprint $bp -Version 1.0

#Assign the blueprint to a subscription:

# Get the version of the blueprint you want to assign, which we will pas to New-AzBlueprintAssignment
$publishedBp = Get-AzBlueprint -SubscriptionId "fe42e645-902d-46b7-be7c-7f9fe59a2b29" -Name "Boilerplate" -LatestPublished

# Each resource group artifact in the blueprint will need a hashtable for the actual RG name and location
#$rgHash = @{ name="MyBoilerplateRG"; location = "eastus" }

# all other (non-rg) parameters are listed in a single hashtable, with a key/value pair for each parameter

#$user = Get-AzADUser -UserPrincipalName "dragos@111429.com"
#$parameters = @{ principalIds=$user.Id }

# All of the resource group artifact hashtables are themselves grouped into a parent hashtable
# the 'key' for each item in the table should match the RG placeholder name in the blueprint
#$rgArray = @{ SingleRG = $rgHash }

# Assign the new blueprint to the specified subscription (Assignment updates should use Set-AzBlueprintAssignment
New-AzBlueprintAssignment -Name "UniqueBlueprintAssignmentName" -Blueprint $publishedBp -Location eastus -SubscriptionId "fe42e645-902d-46b7-be7c-7f9fe59a2b29" -Parameter $parameters