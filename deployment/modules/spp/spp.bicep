param resourceGroupName string

module rg './resource-group.bicep' = {
  name: resourceGroupName
  params: {
    resourceGroupName: resourceGroupName
  }
}
