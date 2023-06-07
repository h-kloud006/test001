param appInsightsLocation string
param appInsights object
param tags object

resource ai 'Microsoft.Insights/components@2020-02-02' = {
  name: appInsights.name
  location: appInsightsLocation
  kind: 'web'
  tags: tags
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId:resourceId('microsoft.operationalinsights/workspaces','testhrlaw1')
  }

}
