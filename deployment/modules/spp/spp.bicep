param subscriptionId string = ''
param resourceGroupName string
param location string
param webApp object

module rg 'resource-group.bicep' = {
  name: resourceGroupName
  scope: subscription(subscriptionId) // Passing subscription scope
  params: {
    resourceGroupName: resourceGroupName
    resourceGroupLocation: location
  }
}

module testWebApp 'web-app.bicep' = {
  name: webApp.aspName
  params: {
    webApp: webApp
    location: location
  }
}
