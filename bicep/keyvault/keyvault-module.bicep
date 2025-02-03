@description('Name of the Key Vault')
param keyVaultName string

@description('Location for the Key Vault')
param location string = resourceGroup().location

@description('SKU for the Key Vault')
param skuName string = 'standard'

@description('Enable soft delete for the Key Vault')
param enableSoftDelete bool = false

@description('Enable purge protection for the Key Vault')
param enablePurgeProtection bool = false

@description('Access policies for the Key Vault')
param accessPolicies array = []

resource keyVault 'Microsoft.KeyVault/vaults@2021-06-01-preview' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: skuName
    }
    tenantId: subscription().tenantId
    accessPolicies: accessPolicies
    enableSoftDelete: enableSoftDelete
    // Only set enablePurgeProtection if it is false
    // If it is true, it cannot be reverted to false
    enablePurgeProtection: enablePurgeProtection ? enablePurgeProtection : null
  }
}

output keyVaultId string = keyVault.id
output keyVaultUri string = keyVault.properties.vaultUri
