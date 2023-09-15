using '../main.bicep'

param networkSettings = {
  resourceGroup: {
    name: ''
    location: 'uksouth'
    tags: {}
  }
  resources: {
    virtualNetwork: {
      name: ''
      addressPrefix: '10.0.0.0/16'
      subnet: {
        addressPrefix: '10.0.0.0/24'
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
    location: 'uksouth'
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
    location: 'uksouth'
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
    location: 'uksouth'
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
        name: 'Standard'
        image: 'win-11-ent-22h2-os'
        compute: '8-vcpu-32gb-mem'
        storage: '256gb-ssd'
      }
      {
        name: 'Office'
        image: 'win-11-ent-22h2-m365'
        compute: '8-vcpu-32gb-mem'
        storage: '256gb-ssd'
      }
      {
        name: 'Developer'
        image: 'vs-22-ent-win-11-m365'
        compute: '8-vcpu-32gb-mem'
        storage: '256gb-ssd'
      }
    ]
    environments: [
      {
        name: 'development'
        tags: {}
      }
      {
        name: 'production'
        tags: {}
      }
    ]
    projects: [
      {
        name: 'default'
        description: 'This is the default project'
        pools: [
          {
            name: 'Standard'
            definition: 'Standard'
            administrator: 'Enabled'
          }
          {
            name: 'Office'
            definition: 'Office'
            administrator: 'Enabled'
          }
          {
            name: 'Developer'
            definition: 'Developer'
            administrator: 'Enabled'
          }
        ]
      }
    ]
  }
}