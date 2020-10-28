
function Read-AzLocation {
    [CmdletBinding()]
    param (
        
    )
    
    Read-Host "Where would you like to deploy the RG and Landing-zone? 
Example:
-eastus = East US
-eastus2 = East US 2
-northcentralus = North Central US
-centralus = Central US
-westus = West US
-westus2 = West US 2
-westcentralus = West Central US
-canadacentral = Canada Central
-uksouth = UK South
-ukwest = UK West
-westeurope = West Europe "
Write-Host "  "


}

function Read-ResourceGroupName {

        Read-Host "What is the name of the Resource Group where you want to deploy the Landing-Zone ?"
    
}


#----------------------------------------Prompting the user for name and location----------------------------------------#

#Prompts the user what the name of the rg is and where it should create it
Write-Host "Prompting the user for Resource Group Name and Location"
Write-Host "======================================================="
$rg = Read-ResourceGroupName

$location = Read-AzLocation
#----------------------------------------Creation of the RG----------------------------------------#
#Creation of the Resource Group at the specified location
Write-Host "Creating the Resource Group at the specified location"
Write-Host "====================================================="
New-AzureRMResourceGroup -Name $rg -Location $location