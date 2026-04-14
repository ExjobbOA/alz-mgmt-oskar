using '../../../../../../platform/templates/core/governance/mgmt-groups/platform/platform-identity/main.bicep'

var location          = readEnvironmentVariable('LOCATION_PRIMARY')
var locationSecondary = readEnvironmentVariable('LOCATION_SECONDARY', '')
var enableTelemetry   = bool(readEnvironmentVariable('ENABLE_TELEMETRY', 'true'))
var intRootMgId     = readEnvironmentVariable('INTERMEDIATE_ROOT_MANAGEMENT_GROUP_ID')
var mgNamePlatform  = readEnvironmentVariable('MG_NAME_PLATFORM', 'platform')
var mgNameIdentity  = readEnvironmentVariable('MG_NAME_IDENTITY', 'identity')

param parLocations = [
  location
  locationSecondary
]
param parEnableTelemetry = enableTelemetry

param platformIdentityConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: mgNameIdentity
  managementGroupParentId: mgNamePlatform
  managementGroupIntermediateRootName: intRootMgId
  managementGroupDisplayName: 'Identity'
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
