param sql object
param location string
@secure()
param adminLogin string
@secure()
param adminPassword string

resource sqlServer 'Microsoft.Sql/servers@2014-04-01' = {
  name: sql.serverName
  location: location
  properties: {
    administratorLogin: adminLogin
    administratorLoginPassword: adminPassword
  }
}



resource sqlServerDatabase 'Microsoft.Sql/servers/databases@2022-08-01-preview' = {
  parent: sqlServer
  name: sql.dbName
  location: location
  sku:{
    name: 
  }
  
 
}


