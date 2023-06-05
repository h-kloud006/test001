param container object
param tags object

resource acr 'Microsoft.ContainerRegistry/registries@2023-01-01-preview' = {
  sku: {
    name: container.skuName
  }
  name: container.containerName
  location: container.containerLocation
  tags: tags
  properties: {
    adminUserEnabled: true
    networkRuleSet: {
      defaultAction: 'Deny'
      ipRules: []
    }
    policies: {
      quarantinePolicy: {
        status: 'disabled'
      }
      trustPolicy: {
        type: 'Notary'
        status: 'disabled'
      }
      retentionPolicy: {
        days: 7
        status: 'disabled'
      }
      exportPolicy: {
        status: 'enabled'
      }
      azureADAuthenticationAsArmPolicy: {
        status: 'enabled'
      }
      softDeletePolicy: {
        retentionDays: 7
        status: 'disabled'
      }
    }
    encryption: {
      status: 'disabled'
    }
    dataEndpointEnabled: false
    publicNetworkAccess: 'Enabled'
    networkRuleBypassOptions: 'AzureServices'
    zoneRedundancy: 'Disabled'
    anonymousPullEnabled: container.anonymousPullEnabled
  }
}


resource acrPrivateEndpoint 'Microsoft.Network/privateEndpoints@2021-05-01' = {
  name: container.acrPepName
  location: container.location
  properties: {
    subnet: {
      id: container.subnetId
    }
    privateLinkServiceConnections: [
      {
        name: '${container.acrPepName}-privateserviceconnection'
        properties: {
          privateLinkServiceId: container.adfId
          groupIds: [
            'registry'
          ]
        }
      }
    ]
  }
}

resource pvtEndpointDnsGroup 'Microsoft.Network/privateEndpoints/privateDnsZoneGroups@2021-05-01' = {
  name: container.dnsGroupName
  properties: {
    privateDnsZoneConfigs: [
      {
        name: 'config1'
        properties: {
          privateDnsZoneId: container.privateDnsZoneid
        }
      }
    ]
  }
  dependsOn: [
    acrPrivateEndpoint
  ]
}
