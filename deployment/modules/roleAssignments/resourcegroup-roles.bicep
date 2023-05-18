param resourceGroupName string
param principals array

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' existing = {
  scope:subscription()
  name: resourceGroupName
}

resource rgroles 'Microsoft.Authorization/roleAssignments@2022-04-01'=[for principal in principals :{
  name: guid(resourceGroupName,principal.principalID,principal.roleDefinitionId)
  properties: {
    principalId: principal.principalID
    roleDefinitionId:principal.roleDefinitionId
    principalType:principal.principalType
  }
}]