param subscriptionId string = ''
param resourceGroupName string
param location string
param dnss array


module rg './resource-group.bicep' = {
  name: resourceGroupName
  scope: subscription(subscriptionId) // Passing subscription scope
  params: {
    resourceGroupName: resourceGroupName
    resourceGroupLocation:location
  }
}

module privateDnsZone './private-dns.bicep' = [for dns in dnss: {
  scope: resourceGroup(rg.name)
  name: dns.dnsName
  params: {
    dns: dns

  }
}]


