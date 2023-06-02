param subscriptionId string = ''
param resourceGroupName string
param location string
param tags object
param webApp object

module rg 'resource-group.bicep' = {
  name: resourceGroupName
  scope: subscription(subscriptionId) // Passing subscription scope
  params: {
    resourceGroupName: resourceGroupName
    resourceGroupLocation: location
    tags: tags
  }
}

module testWebApp 'web-app.bicep' = {
  name: webApp.aspName
  params: {
    webApp: webApp
    location: location
  }
}
