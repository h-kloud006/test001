param mlWorkspace object
param workspaceLocation string
param tags object

resource ml 'Microsoft.MachineLearningServices/workspaces@2023-04-01' = {

  name: mlWorkspace.name
  location: workspaceLocation
  tags: tags
  identity:{
    type: 'SystemAssigned'
  }
  properties: {
    storageAccount: resourceId('Microsoft.Storage/storageAccounts', mlWorkspace.storageAccountName)
    keyVault: resourceId('Microsoft.KeyVault/vaults', mlWorkspace.keyVaultName)
    applicationInsights: resourceId('Microsoft.Insights/components', mlWorkspace.applicationInsightsName)
    containerRegistry: resourceId('Microsoft.ContainerRegistry/registries', mlWorkspace.containerRegistryName)
  }
}

