param subscriptionId string = ''
param resourceGroupName string
param location string
param logAnalytics object
param tags object

module rg './resource-group.bicep' = {
  name: resourceGroupName
  scope: subscription(subscriptionId) // Passing subscription scope
  params: {
    resourceGroupName: resourceGroupName
    resourceGroupLocation: location
    tags: tags
  }
}

module law 'log-analytics.bicep' = {
  scope: resourceGroup(rg.name)
  name: logAnalytics.lawName
  params: {
    logAnalytics: logAnalytics
  }
}
