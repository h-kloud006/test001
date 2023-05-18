param subscriptionId string = ''
param resourceGroupName string
param principals array

module rg './resource-group.bicep' = {
  name: resourceGroupName
  scope: subscription(subscriptionId) // Passing subscription scope
  params: {
    resourceGroupName: resourceGroupName
  }
}

module rgroles './resourcegroup-roles.bicep' ={
 name:resourceGroupName
 scope:resourceGroup(rg.name)
 params:{
  principals:principals
  resourceGroupName:resourceGroupName
 }

}