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

@description('Client ID of the App Registration')
param appRegistrationClientId string

resource keyVault 'Microsoft.KeyVault/vaults@2021-06-01-preview' = {
  name: keyVaultName
  location: location
  properties: {
    sku: {
      family: 'A'
      name: skuName
    }
    tenantId: subscription().tenantId
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: appRegistrationClientId
        permissions: {
          keys: [
            'get'
            'list'
            'create'
            'update'
            'import'
            'delete'
            'backup'
            'restore'
            'recover'
            'purge'
          ]
          secrets: [
            'get'
            'list'
            'set'
            'delete'
            'backup'
            'restore'
            'recover'
            'purge'
          ]
          certificates: [
            'get'
            'list'
            'delete'
            'create'
            'import'
            'update'
            'managecontacts'
            'getissuers'
            'listissuers'
            'setissuers'
            'deleteissuers'
            'manageissuers'
            'recover'
            'purge'
          ]
        }
      }
    ]
    enableSoftDelete: enableSoftDelete
    enablePurgeProtection: enablePurgeProtection
  }
}

output keyVaultId string = keyVault.id
output keyVaultUri string = keyVault.properties.vaultUri
