#Shows the user what resource groups are available 
Get-AzureRmResourceGroup 

#Prompts the user what the name of the rg that needs to be deleted
$rg = Read-Host "Please tell us what Resource Group should be deleted ?"

#Command that will remove the selected Resource Group
Remove-AzureRmResourceGroup -Name $rg