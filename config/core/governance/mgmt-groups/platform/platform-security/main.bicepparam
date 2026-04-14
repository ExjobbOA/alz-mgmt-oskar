using '../../../../../../platform/templates/core/governance/mgmt-groups/platform/platform-security/main.bicep'

var location          = readEnvironmentVariable('LOCATION_PRIMARY')
var locationSecondary = readEnvironmentVariable('LOCATION_SECONDARY', '')
var enableTelemetry   = bool(readEnvironmentVariable('ENABLE_TELEMETRY', 'true'))
var intRootMgId     = readEnvironmentVariable('INTERMEDIATE_ROOT_MANAGEMENT_GROUP_ID')
var mgNamePlatform  = readEnvironmentVariable('MG_NAME_PLATFORM', 'platform')
var mgNameSecurity  = readEnvironmentVariable('MG_NAME_SECURITY', 'security')

param parLocations = [
  location
  locationSecondary
]
param parEnableTelemetry = enableTelemetry

param platformSecurityConfig = {
  createOrUpdateManagementGroup: true
  managementGroupName: mgNameSecurity
  managementGroupParentId: mgNamePlatform
  managementGroupIntermediateRootName: intRootMgId
  managementGroupDisplayName: 'Security'
  managementGroupDoNotEnforcePolicyAssignments: []
  managementGroupExcludedPolicyAssignments: []
  customerRbacRoleDefs: []
  customerRbacRoleAssignments: []
  customerPolicyDefs: []
  customerPolicySetDefs: []
  customerPolicyAssignments: []
  subscriptionsToPlaceInManagementGroup: []
  waitForConsistencyCounterBeforeCustomPolicyDefinitions: 30
  waitForConsistencyCounterBeforeCustomPolicySetDefinitions: 30
  waitForConsistencyCounterBeforeCustomRoleDefinitions: 30
  waitForConsistencyCounterBeforePolicyAssignments: 30
  waitForConsistencyCounterBeforeRoleAssignments: 30
  waitForConsistencyCounterBeforeSubPlacement: 30
}

param parPolicyAssignmentParameterOverrides = {}
