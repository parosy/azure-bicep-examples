param sqlServerName string
param adminUser string
param adminPassword string
param location string = resourceGroup().location

resource sql 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: adminUser
    administratorLoginPassword: adminPassword
  }
}

resource firewall 'Microsoft.Sql/servers/firewallRules@2022-05-01-preview' = {
  name: 'AllowAllAzure'
  parent: sql
  properties: {
    startIpAddress: '0.0.0.0'
    endIpAddress: '0.0.0.0'
  }
}

