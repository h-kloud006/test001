param resourceGroupName string

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' existing = {
  scope: subscription()
  name: resourceGroupName
}

resource rgroles 'Microsoft.Authorization/roleAssignments@2022-04-01'={
  name: guid(rg.name,'62920cd3-8133-4bca-9ca3-a2e27aa62397',resourceId('Microsoft.Authorization/roleDefinitions','b24988ac-6180-42a0-ab88-20f7382dd24c'))
  properties: {
    principalId: '62920cd3-8133-4bca-9ca3-a2e27aa62397'
    roleDefinitionId:'b24988ac-6180-42a0-ab88-20f7382dd24c'
    principalType:'Group'
  }
}
