param registryLocation string
param registry object
param tags object

resource acr 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  name: registry.registryName
  location: registryLocation
  sku: registry.registrySku
  tags: tags

}
