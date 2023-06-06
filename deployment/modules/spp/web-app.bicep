param webApp object
param location string

resource asp 'Microsoft.Web/serverfarms@2022-09-01' = {
  name: webApp.aspNAme
  location: location
  sku: webApp.aspSku
}

resource webApplication 'Microsoft.Web/sites@2022-09-01' = {
  name: webApp.webAppName
  location: location
  properties: {
    siteConfig: {
      netFrameworkVersion: '7'
    }
    serverFarmId: asp.id
  }

}
