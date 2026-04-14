using '../../../../../../platform/templates/core/governance/mgmt-groups/landingzones/landingzones-online/main.bicep'

var location          = readEnvironmentVariable('LOCATION_PRIMARY')
var locationSecondary = readEnvironmentVariable('LOCATION_SECONDARY', '')
var enableTelemetry   = bool(readEnvironmentVariable('ENABLE_TELEMETRY', 'true'))
var intRootMgId        = readEnvironmentVariable('INTERMEDIATE_ROOT_MANAGEMENT_GROUP_ID')
var mgNameLandingzones = readEnvironmentVariable('MG_NAME_LANDINGZONES', 'landingzones')
var mgNameOnline       = readEnvironmentVariable('MG_NAME_ONLINE', 'online')

param parLocations = [
  location
  locationSecondary
]
param parEnableTelemetry = enableTelemetry

param landingZonesOnlineConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: mgNameOnline
  managementGroupParentId: mgNameLandingzones
  managementGroupIntermediateRootName: intRootMgId
  managementGroupDisplayName: 'Online'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: []
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 10
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 10
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 10
  waitForConsistencyCounterBeforePolicyAssignments: 40
  waitForConsistencyCounterBeforeRoleAssignments: 40
  waitForConsistencyCounterBeforeSubPlacement: 10
}

param parPolicyAssignmentParameterOverrides = {}
