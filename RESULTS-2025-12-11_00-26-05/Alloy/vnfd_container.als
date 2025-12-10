// --------------------------------------------------
// TOSCA Topology Metadata
// --------------------------------------------------

// tosca_definitions_version: tosca_simple_yaml_1_3

open cloudnet/LocationGraphs
open cloudnet/TOSCA
open cloudnet/tosca_simple_yaml_1_3

// --------------------------------------------------
// Imports
// --------------------------------------------------

open etsi_nfv_sol001_common_types_3_3_1
open etsi_nfv_sol001_vnfd_types_3_3_1
open custom_scaling_types
open custom_scaling_types
open custom_scaling_types

// --------------------------------------------------
// Topology Template
// --------------------------------------------------

sig vnfd_container_topology_template extends TOSCA/TopologyTemplate
{
  // --------------------------------------------------
  // YAML node_templates:
  // --------------------------------------------------

  // YAML podA: {'type': 'tosca.nodes.Container.Application'}
  // YAML type: tosca.nodes.Container.Application
  podA: one tosca_nodes_Container_Application,

  // YAML podB: {'type': 'tosca.nodes.Container.Application'}
  // YAML type: tosca.nodes.Container.Application
  podB: one tosca_nodes_Container_Application,

  // --------------------------------------------------
  // YAML relationship_templates:
  // --------------------------------------------------

  // --------------------------------------------------
  // YAML groups:
  // --------------------------------------------------

  // YAML scaling_group_cont: {'type': 'tosca.groups.Scaling', 'members': ['podA', 'podB'], 'properties': {'min_instances': 1, 'max_instances': 5}}
  // YAML type: tosca.groups.Scaling
  group_scaling_group_cont: one tosca_groups_Scaling,

  // --------------------------------------------------
  // YAML policies:
  // --------------------------------------------------

  // --------------------------------------------------
  // YAML outputs:
  // --------------------------------------------------

} {
  // YAML description: None
  no description

  // --------------------------------------------------
  // YAML inputs:
  // --------------------------------------------------

  no inputs

  // --------------------------------------------------
  // YAML node_templates:
  // --------------------------------------------------

  #nodes = 2
  // YAML podA: {'type': 'tosca.nodes.Container.Application'}
  node[podA]
  podA.name["podA"]
  podA.node_type_name = "tosca.nodes.Container.Application"
  // YAML properties:
  // YAML interfaces:
  #podA.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no podA.interface_Standard.operation_create.implementation
  no podA.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no podA.interface_Standard.operation_configure.implementation
  no podA.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no podA.interface_Standard.operation_start.implementation
  no podA.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no podA.interface_Standard.operation_stop.implementation
  no podA.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no podA.interface_Standard.operation_delete.implementation
  no podA.interface_Standard.operation_delete.inputs
  #podA.interface_Standard.operations = 5
  // YAML artifacts:
  no podA.artifacts
  // YAML capabilities:
  // YAML   feature: None

  // YAML podB: {'type': 'tosca.nodes.Container.Application'}
  node[podB]
  podB.name["podB"]
  podB.node_type_name = "tosca.nodes.Container.Application"
  // YAML properties:
  // YAML interfaces:
  #podB.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no podB.interface_Standard.operation_create.implementation
  no podB.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no podB.interface_Standard.operation_configure.implementation
  no podB.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no podB.interface_Standard.operation_start.implementation
  no podB.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no podB.interface_Standard.operation_stop.implementation
  no podB.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no podB.interface_Standard.operation_delete.implementation
  no podB.interface_Standard.operation_delete.inputs
  #podB.interface_Standard.operations = 5
  // YAML artifacts:
  no podB.artifacts
  // YAML capabilities:
  // YAML   feature: None


  // --------------------------------------------------
  // YAML relationship_templates:
  // --------------------------------------------------

  no relationships

  // --------------------------------------------------
  // YAML groups:
  // --------------------------------------------------

  #groups = 1
  // YAML scaling_group_cont: {'type': 'tosca.groups.Scaling', 'members': ['podA', 'podB'], 'properties': {'min_instances': 1, 'max_instances': 5}}
  group[group_scaling_group_cont]
  group_scaling_group_cont.name["scaling_group_cont"]
  // YAML properties:
  // YAML min_instances: 1
  group_scaling_group_cont.property_min_instances = 1
  // YAML max_instances: 5
  group_scaling_group_cont.property_max_instances = 5
  // YAML interfaces:
  #group_scaling_group_cont.interfaces = 1
  // YAML Standard:
  // YAML create: {'description': 'Standard lifecycle create operation.'}
  no group_scaling_group_cont.interface_Standard.operation_create.implementation
  no group_scaling_group_cont.interface_Standard.operation_create.inputs
  // YAML configure: {'description': 'Standard lifecycle configure operation.'}
  no group_scaling_group_cont.interface_Standard.operation_configure.implementation
  no group_scaling_group_cont.interface_Standard.operation_configure.inputs
  // YAML start: {'description': 'Standard lifecycle start operation.'}
  no group_scaling_group_cont.interface_Standard.operation_start.implementation
  no group_scaling_group_cont.interface_Standard.operation_start.inputs
  // YAML stop: {'description': 'Standard lifecycle stop operation.'}
  no group_scaling_group_cont.interface_Standard.operation_stop.implementation
  no group_scaling_group_cont.interface_Standard.operation_stop.inputs
  // YAML delete: {'description': 'Standard lifecycle delete operation.'}
  no group_scaling_group_cont.interface_Standard.operation_delete.implementation
  no group_scaling_group_cont.interface_Standard.operation_delete.inputs
  #group_scaling_group_cont.interface_Standard.operations = 5
  // YAML members: ['podA', 'podB']
  group_scaling_group_cont.members[podA + podB]


  // --------------------------------------------------
  // YAML policies:
  // --------------------------------------------------

  no policies
  // --------------------------------------------------
  // YAML outputs:
  // --------------------------------------------------

  no outputs

  // --------------------------------------------------
  // Substitution Mappings
  // --------------------------------------------------

  // YAML substitution_mappings: None
  no substitution_mapping
}

/** There exists some vnfd_container_topology_template */
run Show_vnfd_container_topology_template {
} for 0 but
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 1 LocationGraphs/LocationGraph,
  exactly 3 LocationGraphs/Location,
  exactly 17 LocationGraphs/Value,
  exactly 3 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 6 LocationGraphs/Role,
  exactly 0 TOSCA/Scalar,
  exactly 0 TOSCA/scalar_unit_size,
  exactly 0 TOSCA/scalar_unit_frequency,
  exactly 0 TOSCA/scalar_unit_time,
  exactly 0 TOSCA/map_integer/Map,
  exactly 0 TOSCA/map_string/Map,
  exactly 0 TOSCA/map_data/Map,
  exactly 0 TOSCA/map_map_data/Map,
  exactly 3 TOSCA/ToscaComponent,
  exactly 6 TOSCA/ToscaRole,
  exactly 6 TOSCA/ToscaValue,
  exactly 1 TOSCA/TopologyTemplate,
  exactly 2 TOSCA/Node,
  exactly 4 TOSCA/Requirement,
  exactly 2 TOSCA/Capability,
  exactly 0 TOSCA/Relationship,
  exactly 1 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 TOSCA/Interface,
  exactly 5 TOSCA/Operation,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Data,
  exactly 0 TOSCA/AbstractProperty,
  exactly 0 TOSCA/Property,
  exactly 0 TOSCA/Parameter,
  exactly 0 tosca_artifacts_Root,
  exactly 0 tosca_artifacts_File,
  exactly 0 tosca_artifacts_Deployment,
  exactly 0 tosca_artifacts_Deployment_Image,
  exactly 0 tosca_artifacts_Deployment_Image_VM,
  exactly 0 tosca_artifacts_Implementation,
  exactly 0 tosca_artifacts_Implementation_Bash,
  exactly 0 tosca_artifacts_Implementation_Python,
  exactly 0 tosca_artifacts_template,
  exactly 0 tosca_artifacts_nfv_SwImage,
  exactly 0 tosca_artifacts_Implementation_nfv_Mistral,
  exactly 0 tosca_datatypes_Root,
  exactly 0 tosca_datatypes_Credential,
  exactly 0 tosca_datatypes_TimeInterval,
  exactly 0 tosca_datatypes_network_NetworkInfo,
  exactly 0 tosca_datatypes_network_PortInfo,
  exactly 0 tosca_datatypes_network_PortSpec,
  exactly 0 tosca_datatypes_nfv_L2AddressData,
  exactly 0 tosca_datatypes_nfv_L3AddressData,
  exactly 0 tosca_datatypes_nfv_AddressData,
  exactly 0 tosca_datatypes_nfv_ConnectivityType,
  exactly 0 tosca_datatypes_nfv_LinkBitrateRequirements,
  exactly 0 tosca_datatypes_nfv_CpProtocolData,
  exactly 0 tosca_datatypes_nfv_VnfProfile,
  exactly 0 tosca_datatypes_nfv_Qos,
  exactly 0 tosca_datatypes_nfv_VnfMonitoringParameter,
  exactly 0 tosca_datatypes_nfv_VirtualNetworkInterfaceRequirements,
  exactly 0 tosca_datatypes_nfv_RequestedAdditionalCapability,
  exactly 0 tosca_datatypes_nfv_VirtualMemory,
  exactly 0 tosca_datatypes_nfv_VirtualCpu,
  exactly 0 tosca_datatypes_nfv_VirtualCpuPinning,
  exactly 0 tosca_datatypes_nfv_VnfcConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VnfcAdditionalConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VduProfile,
  exactly 0 tosca_datatypes_nfv_VlProfile,
  exactly 0 tosca_datatypes_nfv_VirtualLinkProtocolData,
  exactly 0 tosca_datatypes_nfv_L2ProtocolData,
  exactly 0 tosca_datatypes_nfv_L3ProtocolData,
  exactly 0 tosca_datatypes_nfv_IpAllocationPool,
  exactly 0 tosca_datatypes_nfv_InstantiationLevel,
  exactly 0 tosca_datatypes_nfv_VduLevel,
  exactly 0 tosca_datatypes_nfv_VnfLcmOperationsConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfInstantiateOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfScaleOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfScaleToLevelOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfHealOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfTerminateOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfOperateOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_ScaleInfo,
  exactly 0 tosca_datatypes_nfv_ScalingAspect,
  exactly 0 tosca_datatypes_nfv_VnfConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VnfAdditionalConfigurableProperties,
  exactly 0 tosca_datatypes_nfv_VnfInfoModifiableAttributes,
  exactly 0 tosca_datatypes_nfv_VnfInfoModifiableAttributesExtensions,
  exactly 0 tosca_datatypes_nfv_VnfInfoModifiableAttributesMetadata,
  exactly 0 tosca_datatypes_nfv_LogicalNodeData,
  exactly 0 tosca_datatypes_nfv_SwImageData,
  exactly 0 tosca_datatypes_nfv_VirtualBlockStorageData,
  exactly 0 tosca_datatypes_nfv_VirtualObjectStorageData,
  exactly 0 tosca_datatypes_nfv_VirtualFileStorageData,
  exactly 0 tosca_datatypes_nfv_VirtualLinkBitrateLevel,
  exactly 0 tosca_datatypes_nfv_VnfOperationAdditionalParameters,
  exactly 0 tosca_datatypes_nfv_VnfChangeFlavourOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfChangeExtConnectivityOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfcMonitoringParameter,
  exactly 0 tosca_datatypes_nfv_VirtualLinkMonitoringParameter,
  exactly 0 tosca_datatypes_nfv_InterfaceDetails,
  exactly 0 tosca_datatypes_nfv_UriComponents,
  exactly 0 tosca_datatypes_nfv_UriAuthority,
  exactly 0 tosca_datatypes_nfv_ChecksumData,
  exactly 0 tosca_datatypes_nfv_VnfmInterfaceInfo,
  exactly 0 tosca_datatypes_nfv_OauthServerInfo,
  exactly 0 tosca_datatypes_nfv_BootData,
  exactly 0 tosca_datatypes_nfv_KvpData,
  exactly 0 tosca_datatypes_nfv_ContentOrFileData,
  exactly 0 tosca_datatypes_nfv_BootDataVimSpecificProperties,
  exactly 0 tosca_datatypes_nfv_VnfPackageChangeSelector,
  exactly 0 tosca_datatypes_nfv_VnfPackageChangeComponentMapping,
  exactly 0 tosca_datatypes_nfv_VnfChangeCurrentPackageOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfCreateSnapshotOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_VnfRevertToSnapshotOperationConfiguration,
  exactly 0 tosca_datatypes_nfv_LocationInfo,
  exactly 0 tosca_datatypes_nfv_CivicAddressElement,
  exactly 0 tosca_datatypes_nfv_GeographicCoordinates,
  exactly 0 tosca_datatypes_nfv_NsVlProfile,
  exactly 0 tosca_datatypes_nfv_NsVirtualLinkQos,
  exactly 0 tosca_datatypes_nfv_NsProfile,
  exactly 0 tosca_datatypes_nfv_Mask,
  exactly 0 tosca_datatypes_nfv_NsOperationAdditionalParameters,
  exactly 0 tosca_datatypes_nfv_NsMonitoringParameter,
  exactly 2 tosca_capabilities_Root,
  exactly 2 tosca_capabilities_Node,
  exactly 0 tosca_capabilities_Container,
  exactly 0 tosca_capabilities_Compute,
  exactly 0 tosca_capabilities_Network,
  exactly 0 tosca_capabilities_Storage,
  exactly 0 tosca_capabilities_Endpoint,
  exactly 0 tosca_capabilities_Endpoint_Public,
  exactly 0 tosca_capabilities_Endpoint_Admin,
  exactly 0 tosca_capabilities_Endpoint_Database,
  exactly 0 tosca_capabilities_Attachment,
  exactly 0 tosca_capabilities_OperatingSystem,
  exactly 0 tosca_capabilities_Scalable,
  exactly 0 tosca_capabilities_network_Bindable,
  exactly 0 tosca_capabilities_network_Linkable,
  exactly 0 tosca_capabilities_nfv_VirtualLinkable,
  exactly 0 tosca_capabilities_nfv_VirtualBindable,
  exactly 0 tosca_capabilities_nfv_VirtualCompute,
  exactly 0 tosca_capabilities_nfv_VirtualStorage,
  exactly 0 tosca_capabilities_nfv_Forwarding,
  exactly 1 tosca_interfaces_Root,
  exactly 1 tosca_interfaces_node_lifecycle_Standard,
  exactly 0 tosca_interfaces_relationship_Configure,
  exactly 0 tosca_interfaces_nfv_Vnflcm,
  exactly 0 tosca_interfaces_nfv_VnfIndicator,
  exactly 0 tosca_interfaces_nfv_ChangeCurrentVnfPackage,
  exactly 0 tosca_interfaces_nfv_Nslcm,
  exactly 0 tosca_relationships_Root,
  exactly 0 tosca_relationships_DependsOn,
  exactly 0 tosca_relationships_HostedOn,
  exactly 0 tosca_relationships_ConnectsTo,
  exactly 0 tosca_relationships_AttachesTo,
  exactly 0 tosca_relationships_RoutesTo,
  exactly 0 tosca_relationships_network_LinksTo,
  exactly 0 tosca_relationships_network_BindsTo,
  exactly 0 tosca_relationships_nfv_VirtualLinksTo,
  exactly 0 tosca_relationships_nfv_VipVirtualLinksTo,
  exactly 0 tosca_relationships_nfv_VirtualBindsTo,
  exactly 0 tosca_relationships_nfv_AttachesTo,
  exactly 0 tosca_relationships_nfv_ForwardTo,
  exactly 2 tosca_nodes_Root,
  exactly 0 tosca_nodes_Abstract_Compute,
  exactly 0 tosca_nodes_Compute,
  exactly 0 tosca_nodes_SoftwareComponent,
  exactly 0 tosca_nodes_WebServer,
  exactly 0 tosca_nodes_WebApplication,
  exactly 0 tosca_nodes_DBMS,
  exactly 0 tosca_nodes_Database,
  exactly 0 tosca_nodes_Abstract_Storage,
  exactly 0 tosca_nodes_Storage_ObjectStorage,
  exactly 0 tosca_nodes_Storage_BlockStorage,
  exactly 0 tosca_nodes_Container_Runtime,
  exactly 2 tosca_nodes_Container_Application,
  exactly 0 tosca_nodes_LoadBalancer,
  exactly 0 tosca_nodes_network_Network,
  exactly 0 tosca_nodes_network_Port,
  exactly 0 tosca_nodes_nfv_Cp,
  exactly 0 tosca_nodes_nfv_VNF,
  exactly 0 tosca_nodes_nfv_VnfExtCp,
  exactly 0 tosca_nodes_nfv_Vdu_Compute,
  exactly 0 tosca_nodes_nfv_Vdu_VirtualBlockStorage,
  exactly 0 tosca_nodes_nfv_Vdu_VirtualObjectStorage,
  exactly 0 tosca_nodes_nfv_Vdu_VirtualFileStorage,
  exactly 0 tosca_nodes_nfv_VduCp,
  exactly 0 tosca_nodes_nfv_VnfVirtualLink,
  exactly 0 tosca_nodes_nfv_VipCp,
  exactly 0 tosca_nodes_nfv_PNF,
  exactly 0 tosca_nodes_nfv_PnfExtCp,
  exactly 0 tosca_nodes_nfv_NS,
  exactly 0 tosca_nodes_nfv_Sap,
  exactly 0 tosca_nodes_nfv_NsVirtualLink,
  exactly 0 tosca_nodes_nfv_NfpPositionElement,
  exactly 0 tosca_nodes_nfv_NfpPosition,
  exactly 0 tosca_nodes_nfv_NFP,
  exactly 0 tosca_nodes_nfv_Forwarding,
  exactly 1 tosca_groups_Root,
  exactly 0 tosca_groups_nfv_PlacementGroup,
  exactly 0 tosca_groups_nfv_NsPlacementGroup,
  exactly 0 tosca_groups_nfv_VNFFG,
  exactly 1 tosca_groups_Scaling,
  exactly 0 tosca_policies_Root,
  exactly 0 tosca_policies_Placement,
  exactly 0 tosca_policies_Scaling,
  exactly 0 tosca_policies_Update,
  exactly 0 tosca_policies_Performance,
  exactly 0 tosca_policies_nfv_Abstract_SecurityGroupRule,
  exactly 0 tosca_policies_nfv_InstantiationLevels,
  exactly 0 tosca_policies_nfv_VduInstantiationLevels,
  exactly 0 tosca_policies_nfv_VirtualLinkInstantiationLevels,
  exactly 0 tosca_policies_nfv_ScalingAspects,
  exactly 0 tosca_policies_nfv_VduScalingAspectDeltas,
  exactly 0 tosca_policies_nfv_VirtualLinkBitrateScalingAspectDeltas,
  exactly 0 tosca_policies_nfv_VduInitialDelta,
  exactly 0 tosca_policies_nfv_VirtualLinkBitrateInitialDelta,
  exactly 0 tosca_policies_nfv_AffinityRule,
  exactly 0 tosca_policies_nfv_AntiAffinityRule,
  exactly 0 tosca_policies_nfv_SupportedVnfInterface,
  exactly 0 tosca_policies_nfv_SecurityGroupRule,
  exactly 0 tosca_policies_nfv_VnfIndicator,
  exactly 0 tosca_policies_nfv_VnfPackageChange,
  exactly 0 tosca_policies_nfv_PnfSecurityGroupRule,
  exactly 0 tosca_policies_nfv_NsAffinityRule,
  exactly 0 tosca_policies_nfv_NsAntiAffinityRule,
  exactly 0 tosca_policies_nfv_NsSecurityGroupRule,
  exactly 0 tosca_policies_nfv_NfpRule,
  exactly 0 tosca_policies_nfv_NsMonitoring,
  exactly 0 tosca_policies_nfv_VnfMonitoring,
  exactly 1 vnfd_container_topology_template,
  8 Int,
  0 seq
  expect 1


