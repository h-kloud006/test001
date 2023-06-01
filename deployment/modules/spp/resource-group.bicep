param resourceGroupName string
param tags object

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' existing = {
  scope: subscription()
  name: resourceGroupName

}

resource rgTags 'Microsoft.Resources/tags@2022-09-01' = {

  name: 'default'
  properties: {
    tags: tags
  }
  dependsOn: [ rg ]
}
