using '../main.bicep'

param networkSettings = {
  resourceGroup: {
    name: 'rg-devbox-vnet-eus01'
    location: 'eastus'
    tags: {}
  }
  resources: {
    virtualNetwork: {
      name: 'vnet-devctr-eus01'
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
    name: 'rg-devbox-cpu-eus01'
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
    name: 'rg-devbox-id-eus01'
    location: 'eastus'
    tags: {}
  }
  resources: {
    managedIdentity: {
      name: 'mi-devbox-eus01'
    }
  }
}

param devcenterSettings = {
  resourceGroup: {
    name: 'rg-devbox-devc-eus01'
    location: 'eastus'
    tags: {}
  }
  resources: {
    networkConnection: {
      name: 'nc-eus01'
      resourceGroup: 'rg-devbox-devc-eus01'
    }
    devcenter: {
      name: 'devc-eus01'
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
            definition: 'standard'
            administrator: 'Enabled'
          }
          {
            name: 'office'
            definition: 'office'
            administrator: 'Enabled'
          }
          {
            name: 'developer'
            definition: 'developer'
            administrator: 'Enabled'
          }
        ]
      }
    ]
  }
}
