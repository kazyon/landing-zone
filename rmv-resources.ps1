#----------------------------------------Shows the user what resource groups are available----------------------------------------#
Write-Host "Logging into Azure AD"
Write-Host "====================="
Get-AzureRmResourceGroup 

#----------------------------------------User Input----------------------------------------#
#Prompts the user what the name of the rg that needs to be deleted 
Write-Host "Prompting the user for which Resource Group should be deleted"
Write-Host "============================================================="
$rg = Read-Host "Please tell us what Resource Group should be deleted ?"

#----------------------------------------Removing Selection----------------------------------------#
#Command that will remove the selected Resource Group
Remove-AzureRmResourceGroup -Name $rg
Write-Host "===================================="
Write-Host "Deletion of the RG is done, wait 5-10 minutes to see the result"