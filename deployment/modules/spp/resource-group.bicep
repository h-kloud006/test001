param resourceGroupName string


resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' existing = {
  scope: subscription()
  name: resourceGroupName

}

