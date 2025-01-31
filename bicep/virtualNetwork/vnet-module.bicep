@description('Name of the Virtual Network')
param vnetName string

@description('Location for the resources')
param location string = resourceGroup().location

@description('Enable DDoS protection')
param enableDdosProtection bool = true

resource vnet 'Microsoft.Network/virtualNetworks@2020-11-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: '10.0.0.0/24'
          delegations: [
            {
              name: 'webappDelegation'
              properties: {
                serviceName: 'Microsoft.Web/serverFarms'
              }
            }
          ]
        }
      }
    ]
    ddosProtectionPlan: {
      id: ddosProtectionPlan.id
    }
  }
}

resource ddosProtectionPlan 'Microsoft.Network/ddosProtectionPlans@2020-11-01' = if (enableDdosProtection) {
  name: '${vnetName}-ddos-plan'
  location: location
  properties: {}
}

output vnetId string = vnet.id
