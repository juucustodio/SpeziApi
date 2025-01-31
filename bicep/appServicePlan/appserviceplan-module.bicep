@description('Name of app service plan')
param appServicePlanName string

@description('Location')
param location string = resourceGroup().location

@description('SKU Name')
param skuName string

@description('Sku Tier')
param skuTier string

@description('Minimum Instances')
param minimumInstances int

@description('Maximum Elastic Worker Count')
param maximumElasticWorkerCount int

@description('Elastic Scale Enabled')
param elasticScaleEnabled bool

resource hostingPlan 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: appServicePlanName
  location: location
  sku:{
    name: skuName
    tier: skuTier
    capacity: minimumInstances
  }
  kind: 'linux'
  properties:{
    reserved: true
    elasticScaleEnabled: elasticScaleEnabled
    maximumElasticWorkerCount: maximumElasticWorkerCount
  }
}

output appServicePlanId string = hostingPlan.id
