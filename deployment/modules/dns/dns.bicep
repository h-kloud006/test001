param subscriptionId string = ''
param resourceGroupName string
param dns object
param Env string

module rg './resource-group.bicep' = if (Env == true){
  name: resourceGroupName
  scope: subscription(subscriptionId) // Passing subscription scope
  params: {
    resourceGroupName: resourceGroupName
  }
}

module privateDnsZone 'private-dns.bicep' = {
  name: dns.dnsName
  params: {
    dns: dns

  }
}
