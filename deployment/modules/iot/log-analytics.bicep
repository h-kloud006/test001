param logAnalytics object

resource law 'Microsoft.OperationalInsights/workspaces@2022-10-01' = {

  name: logAnalytics.lawname
  location: logAnalytics.lawlocation
  properties: {
    sku: logAnalytics.sku 
    retentionInDays: 30
    features: {
      legacy: 0
      searchVersion: 1
      enableLogAccessUsingOnlyResourcePermissions: true
    }
    workspaceCapping: {
      dailyQuotaGb: -1
    }
    publicNetworkAccessForIngestion: 'Enabled'
    publicNetworkAccessForQuery: 'Enabled'
  }
  tags: logAnalytics.tags
  etag: logAnalytics.etag
        
}
