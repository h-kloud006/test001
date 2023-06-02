param webApp object
param location string

resource asp 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: webApp.aspNAme
  location: location
  sku: webApp.aspSku
}

resource webApplication 'Microsoft.Web/sites@2021-01-15' = {
  name: webApp.webAppName
  location: location
  properties: {
    serverFarmId: asp.id
  }

}
