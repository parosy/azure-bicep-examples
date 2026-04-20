param aksName string
param location string = resourceGroup().location

resource aks 'Microsoft.ContainerService/managedClusters@2023-07-01' = {
  name: aksName
  location: location
  properties: {
    dnsPrefix: '${aksName}-dns'
    agentPoolProfiles: [
      {
        name: 'nodepool1'
        count: 1
        vmSize: 'Standard_B2s'
        mode: 'System'
      }
    ]
  }
}

