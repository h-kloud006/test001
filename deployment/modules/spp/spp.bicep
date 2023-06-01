param resourceGroupName string
param tags object

module rg './resource-group.bicep' = {
  name: resourceGroupName 
  params: {
    resourceGroupName: resourceGroupName
    tags: tags
  }
}
