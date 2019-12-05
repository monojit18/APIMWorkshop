$resourceGroup = "workshopsgroups"
$location = "eastus"
$accountName = "apimblobaccount"
$containerName = "apimautoblob"
$sku = "Standard_LRS"
$kind = "BlobStorage"
$accessTier = "Hot"

$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroup -Name $accountName
if (!$storageAccount)
{

    New-AzStorageAccount -ResourceGroupName $resourceGroup -Name $accountName -SkuName $sku `
    -Location $location -Kind $kind -AccessTier $accessTier

}

$storageAccountContext = New-AzStorageContext -ConnectionString $storageAccount.Context.ConnectionString
if (!$storageAccountContext)
{

    Write-Host "Error creating Storage Context"    
    return;

}

$storageContainer = Get-AzStorageContainer -Name $containerName -Context $storageAccountContext
if (!$storageContainer)
{

    $storageContainer = New-AzStorageContainer -Name $containerName -Permission Container `
    -Context $storageAccountContext

}

$blobEndPoint = $storageContainer.Context.BlobEndPoint
$blobEndPoint += $containerName
Write-Host "Blob EndPoint: $blobEndPoint"

$startTime = Get-Date
$expiryTime = $startTime.AddYears(1)

$containerSASToken = New-AzStorageContainerSASToken -Name $containerName -Permission "r" `
-StartTime $startTime -ExpiryTime $expiryTime -Context $storageAccountContext
Write-Host "Container SAS Token: $containerSASToken"

# $storageAccountKeysArray = Get-AzStorageAccountKey -ResourceGroupName $resourceGroup `
# -Name $accountName
# $storageAccountKey = $storageAccountKeysArray[0]
# $storageAccountKeyBytes = [System.Text.Encoding]::Unicode.GetBytes($storageAccountKey.Value)
# $storageAccountKey = [System.Convert]::ToBase64String($storageAccountKeyBytes)

