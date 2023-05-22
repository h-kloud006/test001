param dns object

resource dns1 'Microsoft.Network/privateDnsZones@2020-06-01' = {

  name: dns.dnsName
  location: dns.dnsLocation
  properties: {}
}
