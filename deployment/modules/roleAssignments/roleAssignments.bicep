param subscriptionId string = ''
param resourceGroupName string
param principals array
param dataFactoryName string

module rg './resource-group.bicep' = {
  name: resourceGroupName
  scope: subscription(subscriptionId) // Passing subscription scope
  params: {
    resourceGroupName: resourceGroupName
  }
}

module rgroles './resourcegroup-roles.bicep' = {
  name: resourceGroupName
  params: {
    dataFactoryName:dataFactoryName
    principals:principals
    resourceGroupName: resourceGroupName
  }

}

