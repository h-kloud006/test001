param dns object

resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {

  name: dns.dnsName
  location: dns.dnsLocation
  properties: {}
}



resource privateDnsZoneLink 'Microsoft.Network/privateDnsZones/virtualNetworkLinks@2020-06-01' = {
  parent: privateDnsZone
  name: '${privateDnsZone.name}-link'
  location: 'global'
  properties: {
    registrationEnabled: false
    virtualNetwork: {
      id: dns.vnetId
    }
  }
}



