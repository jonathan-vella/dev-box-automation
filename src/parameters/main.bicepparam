using '../main.bicep'

param networkSettings = {
  resourceGroup: {
    name: 'rg-devctr-eus01'
    location: 'eastus'
    tags: {}
  }
  resources: {
    virtualNetwork: {
      name: 'Microsoft.Network'
      addressPrefix: '172.168.0.0/16'
      subnet: {
        addressPrefix: '172.168.0.0/24'
      }
    }
    securityGroup: {
      name: 'nsg-devctr-eus01'
    }
  }
}

param computeSettings = {
  resourceGroup: {
    name: 'rg-devctr-eus01'
    location: 'eastus'
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
    name: 'rg-devctr-eus01'
    location: 'eastus'
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
    name: 'rg-devctr-eus01'
    location: 'eastus'
    tags: {}
  }
  resources: {
    networkConnection: {
      name: 'eastus'
      resourceGroup: 'rg-devctr-eus01'
    }
    devcenter: {
      name: 'devcenter'
    }
    definitions: [
      {
        name: 'standard'
        image: 'win-11-ent-23h2-os'
        sku: '8-vcpu-32gb-ram-256-ssd'
      }
      {
        name: 'office'
        image: 'win-11-ent-23h2-m365'
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
