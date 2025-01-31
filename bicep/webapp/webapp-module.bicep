@description('Name of the Web App')
param webAppName string

@description('Location for the resources')
param location string = resourceGroup().location

@description('ID of the existing App Service Plan')
param appServicePlanId string

@description('Docker image URL')
param dockerImageUrl string

@description('ID of the Virtual Network')
param vnetId string

resource webApp 'Microsoft.Web/sites@2021-02-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlanId
    siteConfig: {
      linuxFxVersion: dockerImageUrl
    }
    virtualNetworkSubnetId: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetId, 'default')
  }
}

output webAppHostname string = webApp.properties.defaultHostName
