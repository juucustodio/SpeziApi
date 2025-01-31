@description('Name of the App Service Plan')
param appServicePlanName string

@description('Sku Tier')
param skuTier string

@description('Sku Name')
param skuName string

@description('Minimum Instances')
param minimumInstances int

@description('Maximum Elastic Worker Count')
param maximumElasticWorkerCount int

@description('Elastic Scale Enabled')
param elasticScaleEnabled bool

@description('Name of the Azure Container Registry')
param acrName string

@description('Name of the Web App')
param webAppName string

@description('Location for the resources')
param location string = resourceGroup().location

@description('Enable DDoS protection')
param enableDdosProtection bool = true

@description('Name of the Virtual Network')
param vnetName string

module appservicePlanModule './appServicePlan/appserviceplan-module.bicep' = {
  name: 'appservicePlanDeploy'
  params: {
    appServicePlanName: appServicePlanName
    skuName: skuName
    skuTier: skuTier
    minimumInstances: minimumInstances
    maximumElasticWorkerCount: maximumElasticWorkerCount
    elasticScaleEnabled: elasticScaleEnabled
  }
}

module acrModule './azureContainerRegistry/acr-module.bicep' = {
  name: 'acrDeploy'
  params: {
    acrName: acrName
    location: location
  }
}

module vnetModule './virtualNetwork/vnet-module.bicep' = {
  name: 'vnetDeploy'
  params: {
    vnetName: vnetName
    location: location
    enableDdosProtection: enableDdosProtection
  }
}

module webAppModule './webapp/webapp-module.bicep' = {
  name: 'webAppDeploy'
  params: {
    webAppName: webAppName
    location: location
    appServicePlanId: appservicePlanModule.outputs.appServicePlanId
    dockerImageUrl: '${acrModule.outputs.acrLoginServer}/spezi-api:latest'
    vnetId: vnetModule.outputs.vnetId
  }
  dependsOn: [
  ]
}

output webAppHostname string = webAppModule.outputs.webAppHostname
