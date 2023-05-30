param resourceGroupName string
param principals array
param dataFactoryName string

resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' existing = {
  scope: subscription()
  name: resourceGroupName
}

resource rgroles 'Microsoft.Authorization/roleAssignments@2022-04-01'=[for principal in principals: if (contains(principal.type, 'resourceGroup')){
  name: guid(rg.name,principal.principalId,principal.roleDefinitionId)
  properties: {
    principalId: principal.principalId
    roleDefinitionId:resourceId('Microsoft.Authorization/roleDefinitions', principal.roleDefinitionId)
    principalType:principal.principalType
  }
}]

resource adf 'Microsoft.DataFactory/factories@2018-06-01' existing = {
  name: dataFactoryName
}

resource adfroles 'Microsoft.Authorization/roleAssignments@2022-04-01'=[for principal in principals: if (contains(principal.type, 'adf')){
  name: guid(adf.name,principal.principalId,principal.roleDefinitionId)
  scope:adf
  properties: {
    principalId: principal.principalId
    roleDefinitionId:resourceId('Microsoft.Authorization/roleDefinitions', principal.roleDefinitionId)
    principalType:principal.principalType
  }
}]




