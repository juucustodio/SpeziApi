@description('Name of the Web App')
param webAppName string

@description('Location for the resources')
param location string = resourceGroup().location

@description('ID of the existing App Service Plan')
param appServicePlanId string

@description('Docker image URL')
param dockerImageUrl string

@description('Name of the Virtual Network')
param vnetName string

@description('Name of the Subnet')
param subnetName string = 'default'

@description('Application Insights Instrumentation Key')
param appInsightsInstrumentationKey string

@description('Application Insights Connection String')
param appInsightsConnectionString string

resource webApp 'Microsoft.Web/sites@2021-02-01' = {
  name: webAppName
  location: location
  properties: {
    serverFarmId: appServicePlanId
    siteConfig: {
      linuxFxVersion: dockerImageUrl
    }
    virtualNetworkSubnetId: resourceId('Microsoft.Network/virtualNetworks/subnets', vnetName, subnetName)
  }
}

resource webAppSettings 'Microsoft.Web/sites/config@2021-02-01' = {
  name: '${webAppName}/appsettings'
  properties: {
    'APPINSIGHTS_INSTRUMENTATIONKEY': appInsightsInstrumentationKey
    'APPLICATIONINSIGHTS_CONNECTION_STRING': appInsightsConnectionString
    'ApplicationInsightsAgent_EXTENSION_VERSION': '~2'
  }
}

output webAppHostname string = webApp.properties.defaultHostName
