targetScope = 'resourceGroup'

// ---------
// Resources
// ---------

// Managed Identity
resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2018-11-30' = {
  name: settings.resources.managedIdentity.name
  location: settings.resourceGroup.location
}

// ----------
// Parameters
// ----------

param settings object

// -------
// Outputs
// -------

output identityId string = managedIdentity.id
