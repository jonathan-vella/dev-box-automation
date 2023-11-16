using '../main.bicep'

param networkSettings = {
  resourceGroup: {
    name: 'rg-network'
    location: 'uksouth'
    tags: {}
  }
  resources: {
    virtualNetwork: {
      name: 'Microsoft.Network'
      addressPrefix: '10.0.0.0/16'
      subnet: {
        addressPrefix: '10.0.0.0/24'
      }
    }
    securityGroup: {
      name: 'sg-devcenter'
    }
  }
}

param computeSettings = {
  resourceGroup: {
    name: 'rg-computer'
    location: 'uksouth'
    tags: {}
  }
  resources: {
    galleries: [
      {
        name: 'gallerydevcenter'
      }
    ]
  }
}

param identitySettings = {
  resourceGroup: {
    name: 'rg-identity'
    location: 'uksouth'
    tags: {}
  }
  resources: {
    managedIdentity: {
      name: 'mi-devcenter'
    }
  }
}

param devcenterSettings = {
  resourceGroup: {
    name: 'rg-devcenter'
    location: 'uksouth'
    tags: {}
  }
  resources: {
    networkConnection: {
      name: 'uksouth'
      resourceGroup: 'rg-networkconnection'
    }
    devcenter: {
      name: 'devcenter'
    }
    definitions: [
      {
        name: 'standard'
        image: 'win-11-ent-22h2-os'
        sku: '8-vcpu-32gb-ram-256-ssd'
      }
      {
        name: 'office'
        image: 'win-11-ent-22h2-m365'
        sku: '8-vcpu-32gb-ram-256-ssd'
      }
      {
        name: 'developer'
        image: 'vs-22-ent-win-11-m365'
        sku: '8-vcpu-32gb-ram-256-ssd'
      }
    ]
    projects: [
      {
        name: 'default'
        description: 'This is the default project'
        pools: [
          {
            name: 'standard'
            definition: ''
            administrator: 'Enabled'
          }
          {
            name: 'office'
            definition: ''
            administrator: 'Enabled'
          }
          {
            name: 'developer'
            definition: ''
            administrator: 'Enabled'
          }
        ]
      }
    ]
  }
}
