param dns object

resource privateDnsZone 'Microsoft.Network/privateDnsZones@2020-06-01' = {

  name: dns.dnsName
  location: dns.dnsLocation
  properties: {}
}

resource adfPrivateEndpoint 'Microsoft.Network/privateEndpoints@2021-05-01' = {
  name: dns.adfPepName
  location: dns.location
  properties: {
    subnet: {
      id: dns.subnetId
    }
    privateLinkServiceConnections: [
      {
        name: '${dns.adfPepName}-privateserviceconnection'
        properties: {
          privateLinkServiceId: dns.adfId
          groupIds: [
            'dataFactory'
          ]
        }
      }
    ]
  }
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

resource pvtEndpointDnsGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2021-05-01' = {
  name: dns.dnsGroupName
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'config1'
        properties: {
          privateDnsZoneId: privateDnsZone.id
        }
      }
    ]
  }
  dependsOn: [
    adfPrivateEndpoint
  ]
}

"dns": {
  "value": {
      "dnsName": "private.contosa.com",
      "dnsLocation": "global",
      "location":"eastus",
      "adfPepName": "testrgadfpep01",
      "vnetId": "/subscriptions/d5f65e91-af0d-4148-b838-e9499596b56b/resourceGroups/test-rg/providers/Microsoft.Network/virtualNetworks/test-vnet",
      "subnetId": "/subscriptions/d5f65e91-af0d-4148-b838-e9499596b56b/resourceGroups/test-rg/providers/Microsoft.Network/virtualNetworks/test-vnet/subnets/default",
      "adfId": "/subscriptions/d5f65e91-af0d-4148-b838-e9499596b56b/resourceGroups/test-rg/providers/Microsoft.DataFactory/factories/test-rg-adf",
      "dnsGroupName": "testrgadfpep01/group1"
  }
}
