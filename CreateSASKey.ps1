#Make sure that you have the latest version of PowerShellGet installed. Open a Windows PowerShell window, and run the following command to install the latest version:
Install-Module PowerShellGet –Repository PSGallery –Force

#Install the latest version of Azure PowerShell:
Install-Module Az –Repository PSGallery –AllowClobber

#Run the following command to install the latest version of the Azure Storage PowerShell module:
Install-Module -Name Az.Storage -Repository PSGallery -Force

#To check which version of the Az.Storage module is installed, run the following command:
Get-Module -ListAvailable -Name Az.Storage -Refresh

#Sign in to Azure PowerShell with Azure AD
Connect-AzAccount

#Assign permissions with RBAC
#To create a user delegation SAS from Azure PowerShell, the Azure AD account used to sign into PowerShell must be assigned a role that includes the Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey
#The following example assigns the Storage Blob Data Contributor role, which includes the Microsoft.Storage/storageAccounts/blobServices/generateUserDelegationKey action. The role is scoped at the level of the storage account.

#New-AzRoleAssignment -SignInName <email> `
#    -RoleDefinitionName "Storage Blob Data Contributor" `
#    -Scope  "/subscriptions/<subscription>/resourceGroups/<resource-group>/providers/Microsoft.Storage/storageAccounts/<storage-account>"
######################################################

# PARAMETERS #
$mysigninname=""
$myresourcegroup=""
$mystorageaccount=""
$myscope = "/subscriptions/<subscription>/resourceGroups/"+$myresourcegroup+"/providers/Microsoft.Storage/storageAccounts/"+$mystorageaccount

######################################################
New-AzRoleAssignment -SignInName $mysigninname `
    -RoleDefinitionName "Storage Blob Data Contributor" `
    -Scope $myscope
