using '../main.bicep'

param networkSettings = {
  resourceGroup: {
    name: ''
    location: 'eastus'
    tags: {}
  }
  resources: {
    virtualNetwork: {
      name: ''
      addressPrefix: '172.168.0.0/16'
      subnet: {
        addressPrefix: '172.168.0.0/24'
      }
    }
    securityGroup: {
      name: ''
    }
  }
}

param computeSettings = {
  resourceGroup: {
    name: ''
    location: 'eastus'
    tags: {}
  }
  resources: {
    galleries: [
      {
        name: ''
      }
    ]
  }
}

param identitySettings = {
  resourceGroup: {
    name: ''
    location: 'eastus'
    tags: {}
  }
  resources: {
    managedIdentity: {
      name: ''
    }
  }
}

param devcenterSettings = {
  resourceGroup: {
    name: ''
    location: 'eastus'
    tags: {}
  }
  resources: {
    networkConnection: {
      name: ''
      resourceGroup: ''
    }
    devcenter: {
      name: ''
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
