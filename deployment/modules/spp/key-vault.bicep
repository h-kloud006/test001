param keyVault object
param tags object

resource kv 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVault.kvName
  location: keyVault.kvLocation
  tags: tags
  properties: {
    sku: keyVault.sku
    tenantId: keyVault.tenantId
    accessPolicies: keyVault.accessPolicies
    enabledForDeployment: false
    enabledForDiskEncryption: false
    enabledForTemplateDeployment: true
    enableSoftDelete: true
    softDeleteRetentionInDays: 90
    enableRbacAuthorization: false
    provisioningState: 'Succeeded'
    publicNetworkAccess: 'Enabled'
    enablePurgeProtection:true
  }
}


