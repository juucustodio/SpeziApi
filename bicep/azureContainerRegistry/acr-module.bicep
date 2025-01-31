@description('Name of the Azure Container Registry')
param acrName string

@description('Location for the resources')
param location string = resourceGroup().location

@description('SKU for the Azure Container Registry')
param sku string = 'Basic'

resource acr 'Microsoft.ContainerRegistry/registries@2021-06-01-preview' = {
  name: acrName
  location: location
  sku: {
    name: sku
  }
  properties: {
    adminUserEnabled: true
  }
}

output acrLoginServer string = acr.properties.loginServer
output acrAdminUsername string = listCredentials(acr.id, '2021-06-01-preview').username
output acrAdminPassword string = listCredentials(acr.id, '2021-06-01-preview').passwords[0].value
