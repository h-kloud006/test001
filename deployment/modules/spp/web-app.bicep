param webApp object
param location string

resource asp 'Microsoft.Web/serverfarms@2020-12-01' = {
  name: webApp.aspNAme
  location: location
  sku: webApp.aspSku
}
