param subscriptionId string = ''
param resourceGroupName string
param location string
param Env string

module rg './resource-group.bicep' = if (Env == true){
  name: resourceGroupName
  scope: subscription(subscriptionId) // Passing subscription scope
  params: {
    resourceGroupName: resourceGroupName
    resourceGroupLocation:location
  }
}


