param subscriptionId string = ''
param resourceGroupName string

module rg './resource-group.bicep' = {
  name: resourceGroupName
  scope: subscription(subscriptionId) // Passing subscription scope aa
  params: {
    resourceGroupName: resourceGroupName
  }
}

module rgroles './resourcegroup-roles.bicep' = {
  name: resourceGroupName
  params: {

    resourceGroupName: resourceGroupName
  }

}


harish
