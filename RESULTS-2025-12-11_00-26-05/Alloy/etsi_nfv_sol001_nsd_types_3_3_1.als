// --------------------------------------------------
// TOSCA Topology Metadata
// --------------------------------------------------

// tosca_definitions_version: tosca_simple_yaml_1_3
// description: ETSI NFV SOL 001 nsd types definitions version 3.3.1

open cloudnet/LocationGraphs
open cloudnet/TOSCA
open cloudnet/tosca_simple_yaml_1_3

// --------------------------------------------------
// Imports
// --------------------------------------------------

open etsi_nfv_sol001_common_types_3_3_1
open etsi_nfv_sol001_vnfd_types_3_3_1
open etsi_nfv_sol001_pnfd_types_3_3_1

// --------------------------------------------------
// Data Types
// --------------------------------------------------

//
// Describes additional instantiation data for a given NsVirtualLink used in a specific NS deployment flavour.
//
sig tosca_datatypes_nfv_NsVlProfile extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML max_bitrate_requirements: {'type': 'tosca.datatypes.nfv.LinkBitrateRequirements', 'description': 'Specifies the maximum bitrate requirements for a VL instantiated according to this profile.', 'required': True}
  //
  // Specifies the maximum bitrate requirements for a VL instantiated according to this profile.
  //
  max_bitrate_requirements: one tosca_datatypes_nfv_LinkBitrateRequirements,

  // YAML min_bitrate_requirements: {'type': 'tosca.datatypes.nfv.LinkBitrateRequirements', 'description': 'Specifies the minimum bitrate requirements for a VL instantiated according to this profile.', 'required': True}
  //
  // Specifies the minimum bitrate requirements for a VL instantiated according to this profile.
  //
  min_bitrate_requirements: one tosca_datatypes_nfv_LinkBitrateRequirements,

  // YAML qos: {'type': 'tosca.datatypes.nfv.NsVirtualLinkQos', 'description': 'Specifies the QoS requirements of a VL instantiated according to this profile.', 'required': False}
  //
  // Specifies the QoS requirements of a VL instantiated according to this profile.
  //
  qos: lone tosca_datatypes_nfv_NsVirtualLinkQos,

  // YAML service_availability_level: {'type': 'integer', 'description': 'Specifies the service availability level for the VL instance created from this profile', 'required': False, 'constraints': [{'greater_or_equal': 1}]}
  //
  // Specifies the service availability level for the VL instance created from this profile
  //
  service_availability_level: lone integer,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  some service_availability_level implies service_availability_level.greater_or_equal[1]

}

/** There exists some tosca.datatypes.nfv.NsVlProfile */
run Show_tosca_datatypes_nfv_NsVlProfile {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_NsVlProfile
  expect 1

//
// describes QoS data for a given VL used in a VNF deployment flavour
//
sig tosca_datatypes_nfv_NsVirtualLinkQos extends tosca_datatypes_nfv_Qos
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML priority: {'type': 'integer', 'constraints': [{'greater_or_equal': 0}], 'description': 'Specifies the priority level in case of congestion on the underlying physical links', 'required': False}
  //
  // Specifies the priority level in case of congestion on the underlying physical links
  //
  priority: lone integer,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  some priority implies priority.greater_or_equal[0]

}

/** There exists some tosca.datatypes.nfv.NsVirtualLinkQos */
run Show_tosca_datatypes_nfv_NsVirtualLinkQos {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_NsVirtualLinkQos
  expect 1

//
// describes a profile for instantiating NSs of a particular NS DF according to a specific NSD and NS DF.
//
sig tosca_datatypes_nfv_NsProfile extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML ns_instantiation_level: {'type': 'string', 'description': 'Identifier of the instantiation level of the NS DF to be used for instantiation. If not present, the default instantiation level as declared in the NSD shall be used.', 'required': False}
  //
  // Identifier of the instantiation level of the NS DF to be used for instantiation. If not present, the default instantiation level as declared in the NSD shall be used.
  //
  ns_instantiation_level: lone string,

  // YAML min_number_of_instances: {'type': 'integer', 'description': 'Minimum number of instances of the NS based on this NSD that is permitted to exist for this NsProfile.', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Minimum number of instances of the NS based on this NSD that is permitted to exist for this NsProfile.
  //
  min_number_of_instances: one integer,

  // YAML max_number_of_instances: {'type': 'integer', 'description': 'Maximum number of instances of the NS based on this NSD that is permitted to exist for this NsProfile.', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  //
  // Maximum number of instances of the NS based on this NSD that is permitted to exist for this NsProfile.
  //
  max_number_of_instances: one integer,

  // YAML flavour_id: {'type': 'string', 'description': 'Identifies the applicable network service DF within the scope of the NSD.', 'required': True}
  //
  // Identifies the applicable network service DF within the scope of the NSD.
  //
  flavour_id: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  min_number_of_instances.greater_or_equal[0]
  max_number_of_instances.greater_or_equal[0]

}

/** There exists some tosca.datatypes.nfv.NsProfile */
run Show_tosca_datatypes_nfv_NsProfile {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_NsProfile
  expect 1

sig tosca_datatypes_nfv_Mask extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML starting_point: {'description': 'Indicates the offset between the last bit of the source mac address and the first bit of the sequence of bits to be matched.', 'type': 'integer', 'required': True}
  //
  // Indicates the offset between the last bit of the source mac address and the first bit of the sequence of bits to be matched.
  //
  starting_point: one integer,

  // YAML length: {'description': 'Indicates the number of bits to be matched.', 'type': 'integer', 'required': True}
  //
  // Indicates the number of bits to be matched.
  //
  length: one integer,

  // YAML value: {'description': 'Provide the sequence of bit values to be matched.', 'type': 'string', 'required': True}
  //
  // Provide the sequence of bit values to be matched.
  //
  value: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


}

/** There exists some tosca.datatypes.nfv.Mask */
run Show_tosca_datatypes_nfv_Mask {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_Mask
  expect 1

//
// Is an empty base type for deriving data types for describing NS-specific additional parameters to be passed when invoking NS lifecycle management operations
//
sig tosca_datatypes_nfv_NsOperationAdditionalParameters extends tosca_datatypes_Root
{
} {
}

/** There exists some tosca.datatypes.nfv.NsOperationAdditionalParameters */
run Show_tosca_datatypes_nfv_NsOperationAdditionalParameters {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_NsOperationAdditionalParameters
  expect 1

//
// Represents information on virtualised resource related performance metrics applicable to the NS.
//
sig tosca_datatypes_nfv_NsMonitoringParameter extends tosca_datatypes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML name: {'type': 'string', 'description': 'Human readable name of the monitoring parameter', 'required': True}
  //
  // Human readable name of the monitoring parameter
  //
  name: one string,

  // YAML performance_metric: {'type': 'string', 'description': 'Identifies a performance metric to be monitored, according to ETSI GS NFV-IFA 027.', 'required': True, 'constraints': [{'valid_values': ['byte_incoming_sap', 'byte_outgoing_sap', 'packet_incoming_sap', 'packet_outgoing_sap', 'byte_incoming', 'byte_outgoing', 'packet_incoming', 'packet_outgoing']}]}
  //
  // Identifies a performance metric to be monitored, according to ETSI GS NFV-IFA 027.
  //
  performance_metric: one string,

  // YAML collection_period: {'type': 'scalar-unit.time', 'description': 'Describes the periodicity at which to collect the performance information.', 'required': False}
  //
  // Describes the periodicity at which to collect the performance information.
  //
  collection_period: lone scalar_unit_time,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  performance_metric.valid_values["byte_incoming_sap" + "byte_outgoing_sap" + "packet_incoming_sap" + "packet_outgoing_sap" + "byte_incoming" + "byte_outgoing" + "packet_incoming" + "packet_outgoing"]

}

/** There exists some tosca.datatypes.nfv.NsMonitoringParameter */
run Show_tosca_datatypes_nfv_NsMonitoringParameter {
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_datatypes_nfv_NsMonitoringParameter
  expect 1

// --------------------------------------------------
// Capability Types
// --------------------------------------------------

sig tosca_capabilities_nfv_Forwarding extends tosca_capabilities_Root
{
} {
}

/** There exists some tosca.capabilities.nfv.Forwarding */
run Show_tosca_capabilities_nfv_Forwarding {
  tosca_capabilities_nfv_Forwarding.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 1 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Requirement,
  exactly 0 TOSCA/Operation,
  exactly 1 tosca_capabilities_nfv_Forwarding
  expect 1

// --------------------------------------------------
// Relationship Types
// --------------------------------------------------

sig tosca_relationships_nfv_ForwardTo extends tosca_relationships_Root
{
} {
  valid_target_types[tosca_capabilities_nfv_Forwarding]
}

/** There exists some tosca.relationships.nfv.ForwardTo */
run Show_tosca_relationships_nfv_ForwardTo {
  tosca_relationships_nfv_ForwardTo.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 3 LocationGraphs/Location,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_relationships_nfv_ForwardTo
  expect 1

// --------------------------------------------------
// Interface Types
// --------------------------------------------------

//
// This interface encompasses a set of TOSCA operations corresponding to NS LCM operations defined in ETSI GS NFV-IFA 013. as well as to preamble and postamble procedures to the execution of the NS LCM operations.
//
sig tosca_interfaces_nfv_Nslcm extends tosca_interfaces_Root
{
  // --------------------------------------------------
  // Operations
  // --------------------------------------------------

  // YAML instantiate_start: {'description': 'Preamble to execution of the instantiate operation'}
  //
  // Preamble to execution of the instantiate operation
  //
  operation_instantiate_start: one TOSCA/Operation,

  // YAML instantiate: {'description': 'Base procedure for instantiating an NS, corresponding to the Instantiate NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for instantiating an NS, corresponding to the Instantiate NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_instantiate: one TOSCA/Operation,

  // YAML instantiate_end: {'description': 'Postamble to the execution of the instantiate operation'}
  //
  // Postamble to the execution of the instantiate operation
  //
  operation_instantiate_end: one TOSCA/Operation,

  // YAML terminate_start: {'description': 'Preamble to execution of the terminate operation'}
  //
  // Preamble to execution of the terminate operation
  //
  operation_terminate_start: one TOSCA/Operation,

  // YAML terminate: {'description': 'Base procedure for terminating an NS, corresponding to the Terminate NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for terminating an NS, corresponding to the Terminate NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_terminate: one TOSCA/Operation,

  // YAML terminate_end: {'description': 'Postamble to the execution of the terminate operation'}
  //
  // Postamble to the execution of the terminate operation
  //
  operation_terminate_end: one TOSCA/Operation,

  // YAML update_start: {'description': 'Preamble to execution of the update operation'}
  //
  // Preamble to execution of the update operation
  //
  operation_update_start: one TOSCA/Operation,

  // YAML update: {'description': 'Base procedure for updating an NS, corresponding to the Update NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for updating an NS, corresponding to the Update NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_update: one TOSCA/Operation,

  // YAML update_end: {'description': 'Postamble to the execution of the update operation'}
  //
  // Postamble to the execution of the update operation
  //
  operation_update_end: one TOSCA/Operation,

  // YAML scale_start: {'description': 'Preamble to execution of the scale operation'}
  //
  // Preamble to execution of the scale operation
  //
  operation_scale_start: one TOSCA/Operation,

  // YAML scale: {'description': 'Base procedure for scaling an NS, corresponding to the Scale NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for scaling an NS, corresponding to the Scale NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_scale: one TOSCA/Operation,

  // YAML scale_end: {'description': 'Postamble to the execution of the scale operation'}
  //
  // Postamble to the execution of the scale operation
  //
  operation_scale_end: one TOSCA/Operation,

  // YAML heal_start: {'description': 'Preamble to execution of the heal operation'}
  //
  // Preamble to execution of the heal operation
  //
  operation_heal_start: one TOSCA/Operation,

  // YAML heal: {'description': 'Base procedure for healing an NS, corresponding to the Heal NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for healing an NS, corresponding to the Heal NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_heal: one TOSCA/Operation,

  // YAML heal_end: {'description': 'Postamble to the execution of the heal operation'}
  //
  // Postamble to the execution of the heal operation
  //
  operation_heal_end: one TOSCA/Operation,

} {
  // --------------------------------------------------
  // Operations
  // --------------------------------------------------

  // YAML instantiate_start: {'description': 'Preamble to execution of the instantiate operation'}
  //
  // Preamble to execution of the instantiate operation
  //
  operation_instantiate_start.name["instantiate_start"]
  operation[operation_instantiate_start]

  // YAML instantiate: {'description': 'Base procedure for instantiating an NS, corresponding to the Instantiate NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for instantiating an NS, corresponding to the Instantiate NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_instantiate.name["instantiate"]
  operation[operation_instantiate]

  // YAML instantiate_end: {'description': 'Postamble to the execution of the instantiate operation'}
  //
  // Postamble to the execution of the instantiate operation
  //
  operation_instantiate_end.name["instantiate_end"]
  operation[operation_instantiate_end]

  // YAML terminate_start: {'description': 'Preamble to execution of the terminate operation'}
  //
  // Preamble to execution of the terminate operation
  //
  operation_terminate_start.name["terminate_start"]
  operation[operation_terminate_start]

  // YAML terminate: {'description': 'Base procedure for terminating an NS, corresponding to the Terminate NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for terminating an NS, corresponding to the Terminate NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_terminate.name["terminate"]
  operation[operation_terminate]

  // YAML terminate_end: {'description': 'Postamble to the execution of the terminate operation'}
  //
  // Postamble to the execution of the terminate operation
  //
  operation_terminate_end.name["terminate_end"]
  operation[operation_terminate_end]

  // YAML update_start: {'description': 'Preamble to execution of the update operation'}
  //
  // Preamble to execution of the update operation
  //
  operation_update_start.name["update_start"]
  operation[operation_update_start]

  // YAML update: {'description': 'Base procedure for updating an NS, corresponding to the Update NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for updating an NS, corresponding to the Update NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_update.name["update"]
  operation[operation_update]

  // YAML update_end: {'description': 'Postamble to the execution of the update operation'}
  //
  // Postamble to the execution of the update operation
  //
  operation_update_end.name["update_end"]
  operation[operation_update_end]

  // YAML scale_start: {'description': 'Preamble to execution of the scale operation'}
  //
  // Preamble to execution of the scale operation
  //
  operation_scale_start.name["scale_start"]
  operation[operation_scale_start]

  // YAML scale: {'description': 'Base procedure for scaling an NS, corresponding to the Scale NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for scaling an NS, corresponding to the Scale NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_scale.name["scale"]
  operation[operation_scale]

  // YAML scale_end: {'description': 'Postamble to the execution of the scale operation'}
  //
  // Postamble to the execution of the scale operation
  //
  operation_scale_end.name["scale_end"]
  operation[operation_scale_end]

  // YAML heal_start: {'description': 'Preamble to execution of the heal operation'}
  //
  // Preamble to execution of the heal operation
  //
  operation_heal_start.name["heal_start"]
  operation[operation_heal_start]

  // YAML heal: {'description': 'Base procedure for healing an NS, corresponding to the Heal NS operation defined in ETSI GS NFV-IFA 013.'}
  //
  // Base procedure for healing an NS, corresponding to the Heal NS operation defined in ETSI GS NFV-IFA 013.
  //
  operation_heal.name["heal"]
  operation[operation_heal]

  // YAML heal_end: {'description': 'Postamble to the execution of the heal operation'}
  //
  // Postamble to the execution of the heal operation
  //
  operation_heal_end.name["heal_end"]
  operation[operation_heal_end]

}

/** There exists some tosca.interfaces.nfv.Nslcm */
run Show_tosca_interfaces_nfv_Nslcm {
  tosca_interfaces_nfv_Nslcm.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 0 LocationGraphs/Name,
  exactly 0 LocationGraphs/Role,
  exactly 0 LocationGraphs/Process,
  exactly 0 LocationGraphs/Sort,
  exactly 0 TOSCA/Artifact,
  exactly 0 TOSCA/Attribute,
  exactly 1 TOSCA/Operation,
  exactly 8 TOSCA/Parameter,
  exactly 1 tosca_interfaces_nfv_Nslcm
  expect 1

// --------------------------------------------------
// Node Types
// --------------------------------------------------

sig tosca_nodes_nfv_NS extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML descriptor_id: {'type': 'string', 'description': 'Identifier of this NS descriptor', 'required': True}
  //
  // Identifier of this NS descriptor
  //
  property_descriptor_id: one string,

  // YAML designer: {'type': 'string', 'description': 'Identifies the designer of the NSD.', 'required': True}
  //
  // Identifies the designer of the NSD.
  //
  property_designer: one string,

  // YAML version: {'type': 'string', 'description': 'Identifies the version of the NSD.', 'required': True}
  //
  // Identifies the version of the NSD.
  //
  property_version: one string,

  // YAML name: {'type': 'string', 'description': 'Provides the human readable name of the NSD.', 'required': True}
  //
  // Provides the human readable name of the NSD.
  //
  property_name: one string,

  // YAML invariant_id: {'type': 'string', 'description': 'Identifies an NSD in a version independent manner. This attribute is invariant across versions of NSD', 'required': True}
  //
  // Identifies an NSD in a version independent manner. This attribute is invariant across versions of NSD
  //
  property_invariant_id: one string,

  // YAML flavour_id: {'type': 'string', 'description': 'Identifier of the NS Deployment Flavour within the NSD', 'required': True}
  //
  // Identifier of the NS Deployment Flavour within the NSD
  //
  property_flavour_id: one string,

  // YAML ns_profile: {'type': 'tosca.datatypes.nfv.NsProfile', 'description': 'Specifies a profile of a NS, when this NS is used as nested NS within another NS.', 'required': False}
  //
  // Specifies a profile of a NS, when this NS is used as nested NS within another NS.
  //
  property_ns_profile: lone tosca_datatypes_nfv_NsProfile,

  // YAML service_availability_level: {'type': 'integer', 'description': 'Specifies the service availability level for the NS instance.', 'required': False, 'constraints': [{'greater_or_equal': 1}]}
  //
  // Specifies the service availability level for the NS instance.
  //
  property_service_availability_level: lone integer,


  // --------------------------------------------------
  // Interfaces
  // --------------------------------------------------

  // YAML Nslcm: {'type': 'tosca.interfaces.nfv.Nslcm'}
  interface_Nslcm: one tosca_interfaces_nfv_Nslcm,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'node': 'tosca.nodes.nfv.NsVirtualLink', 'occurrences': [0, 1]}
  requirement_virtual_link: lone TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  some property_service_availability_level implies property_service_availability_level.greater_or_equal[1]

  // --------------------------------------------------
  // Interfaces
  // --------------------------------------------------

  // YAML Nslcm: {'type': 'tosca.interfaces.nfv.Nslcm'}
  interface[interface_Nslcm]
  interface_Nslcm.name["Nslcm"]

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'node': 'tosca.nodes.nfv.NsVirtualLink', 'occurrences': [0, 1]}
  requirement["virtual_link", requirement_virtual_link]
  requirement_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]
  requirement_virtual_link.node[tosca_nodes_nfv_NsVirtualLink]

}

/** There exists some tosca.nodes.nfv.NS */
run Show_tosca_nodes_nfv_NS {
  tosca_nodes_nfv_NS.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_NS
  expect 1

//
// node definition of SAP.
//
sig tosca_nodes_nfv_Sap extends tosca_nodes_nfv_Cp
{
  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML external_virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [0, 1]}
  requirement_external_virtual_link: lone TOSCA/Requirement,

  // YAML internal_virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [1, 1]}
  requirement_internal_virtual_link: one TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML external_virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [0, 1]}
  requirement["external_virtual_link", requirement_external_virtual_link]
  requirement_external_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_external_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]

  // YAML internal_virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo', 'occurrences': [1, 1]}
  requirement["internal_virtual_link", requirement_internal_virtual_link]
  requirement_internal_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_internal_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]

}

/** There exists some tosca.nodes.nfv.Sap */
run Show_tosca_nodes_nfv_Sap {
  tosca_nodes_nfv_Sap.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 2 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 2 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_Sap
  expect 1

//
// node definition of Virtual Links
//
sig tosca_nodes_nfv_NsVirtualLink extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML vl_profile: {'type': 'tosca.datatypes.nfv.NsVlProfile', 'description': 'Specifies instantiation parameters for a virtual link of a particular NS deployment flavour.', 'required': True}
  //
  // Specifies instantiation parameters for a virtual link of a particular NS deployment flavour.
  //
  property_vl_profile: one tosca_datatypes_nfv_NsVlProfile,

  // YAML connectivity_type: {'type': 'tosca.datatypes.nfv.ConnectivityType', 'required': True}
  property_connectivity_type: one tosca_datatypes_nfv_ConnectivityType,

  // YAML test_access: {'type': 'list', 'description': 'Test access facilities available on the VL', 'required': False, 'entry_schema': {'type': 'string', 'constraints': [{'valid_values': ['passive_monitoring', 'active_loopback']}]}}
  //
  // Test access facilities available on the VL
  //
  property_test_access: seq string,

  // YAML description: {'type': 'string', 'required': False, 'description': 'Human readable information on the purpose of the virtual link (e.g. VL for control plane traffic).'}
  //
  // Human readable information on the purpose of the virtual link (e.g. VL for control plane traffic).
  //
  property_description: lone string,

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_linkable: {'type': 'tosca.capabilities.nfv.VirtualLinkable'}
  capability_virtual_linkable: some tosca_capabilities_nfv_VirtualLinkable,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_test_access.elems.valid_values["passive_monitoring" + "active_loopback"]

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_linkable: {'type': 'tosca.capabilities.nfv.VirtualLinkable'}
  capability_virtual_linkable.name["virtual_linkable"]
  capability[capability_virtual_linkable]

}

/** There exists some tosca.nodes.nfv.NsVirtualLink */
run Show_tosca_nodes_nfv_NsVirtualLink {
  tosca_nodes_nfv_NsVirtualLink.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_NsVirtualLink
  expect 1

//
// node definition of NfpPositionElement
//
sig tosca_nodes_nfv_NfpPositionElement extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding'}
  capability_forwarding: some tosca_capabilities_nfv_Forwarding,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML profile_element: {'capability': 'tosca.capabilities.nfv.Forwarding', 'relationship': 'tosca.relationships.nfv.ForwardTo', 'occurrences': [1, 2]}
  requirement_profile_element: some TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding'}
  capability_forwarding.name["forwarding"]
  capability[capability_forwarding]

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML profile_element: {'capability': 'tosca.capabilities.nfv.Forwarding', 'relationship': 'tosca.relationships.nfv.ForwardTo', 'occurrences': [1, 2]}
  requirement["profile_element", requirement_profile_element]
  requirement_profile_element.capability[tosca_capabilities_nfv_Forwarding]
  requirement_profile_element.relationship[tosca_relationships_nfv_ForwardTo]
  // YAML occurrences: [1, 2]
  #requirement_profile_element >= 1
  #requirement_profile_element <= 2

}

/** There exists some tosca.nodes.nfv.NfpPositionElement */
run Show_tosca_nodes_nfv_NfpPositionElement {
  tosca_nodes_nfv_NfpPositionElement.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_NfpPositionElement
  expect 1

//
// node definition of NFP position
//
sig tosca_nodes_nfv_NfpPosition extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML forwarding_behaviour: {'type': 'string', 'description': 'Identifies a rule to apply to forward traffic to CP or SAP instances corresponding to the referenced NfpPositionElement(s).', 'constraints': [{'valid_values': ['all', 'lb', 'ff']}], 'required': False}
  //
  // Identifies a rule to apply to forward traffic to CP or SAP instances corresponding to the referenced NfpPositionElement(s).
  //
  property_forwarding_behaviour: lone string,

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding'}
  capability_forwarding: some tosca_capabilities_nfv_Forwarding,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML element: {'capability': 'tosca.capabilities.nfv.Forwarding', 'node': 'tosca.nodes.nfv.NfpPositionElement', 'relationship': 'tosca.relationships.nfv.ForwardTo', 'occurrences': [1, 'UNBOUNDED']}
  requirement_element: some TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_forwarding_behaviour.valid_values["all" + "lb" + "ff"]

  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding'}
  capability_forwarding.name["forwarding"]
  capability[capability_forwarding]

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML element: {'capability': 'tosca.capabilities.nfv.Forwarding', 'node': 'tosca.nodes.nfv.NfpPositionElement', 'relationship': 'tosca.relationships.nfv.ForwardTo', 'occurrences': [1, 'UNBOUNDED']}
  requirement["element", requirement_element]
  requirement_element.capability[tosca_capabilities_nfv_Forwarding]
  requirement_element.relationship[tosca_relationships_nfv_ForwardTo]
  requirement_element.node[tosca_nodes_nfv_NfpPositionElement]
  // YAML occurrences: [1, 'UNBOUNDED']
  #requirement_element >= 1

}

/** There exists some tosca.nodes.nfv.NfpPosition */
run Show_tosca_nodes_nfv_NfpPosition {
  tosca_nodes_nfv_NfpPosition.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_NfpPosition
  expect 1

//
// node definition of NFP
//
sig tosca_nodes_nfv_NFP extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML nfp_position: {'capability': 'tosca.capabilities.nfv.Forwarding', 'node': 'tosca.nodes.nfv.NfpPosition', 'relationship': 'tosca.relationships.nfv.ForwardTo', 'occurrences': [1, 'UNBOUNDED']}
  requirement_nfp_position: some TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML nfp_position: {'capability': 'tosca.capabilities.nfv.Forwarding', 'node': 'tosca.nodes.nfv.NfpPosition', 'relationship': 'tosca.relationships.nfv.ForwardTo', 'occurrences': [1, 'UNBOUNDED']}
  requirement["nfp_position", requirement_nfp_position]
  requirement_nfp_position.capability[tosca_capabilities_nfv_Forwarding]
  requirement_nfp_position.relationship[tosca_relationships_nfv_ForwardTo]
  requirement_nfp_position.node[tosca_nodes_nfv_NfpPosition]
  // YAML occurrences: [1, 'UNBOUNDED']
  #requirement_nfp_position >= 1

}

/** There exists some tosca.nodes.nfv.NFP */
run Show_tosca_nodes_nfv_NFP {
  tosca_nodes_nfv_NFP.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_NFP
  expect 1

sig tosca_nodes_nfv_Forwarding extends tosca_nodes_Root
{
  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_linkable: {'type': 'tosca.capabilities.nfv.VirtualLinkable'}
  capability_virtual_linkable: some tosca_capabilities_nfv_VirtualLinkable,

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding', 'occurrences': [1, 2]}
  capability_forwarding: some tosca_capabilities_nfv_Forwarding,

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo'}
  requirement_virtual_link: one TOSCA/Requirement,

} {
  // --------------------------------------------------
  // Capabilities
  // --------------------------------------------------

  // YAML virtual_linkable: {'type': 'tosca.capabilities.nfv.VirtualLinkable'}
  capability_virtual_linkable.name["virtual_linkable"]
  capability[capability_virtual_linkable]

  // YAML forwarding: {'type': 'tosca.capabilities.nfv.Forwarding', 'occurrences': [1, 2]}
  capability_forwarding.name["forwarding"]
  capability[capability_forwarding]
  // YAML occurrences: [1, 2]
  #capability_forwarding <= 2

  // --------------------------------------------------
  // Requirements
  // --------------------------------------------------

  // YAML virtual_link: {'capability': 'tosca.capabilities.nfv.VirtualLinkable', 'relationship': 'tosca.relationships.nfv.VirtualLinksTo'}
  requirement["virtual_link", requirement_virtual_link]
  requirement_virtual_link.capability[tosca_capabilities_nfv_VirtualLinkable]
  requirement_virtual_link.relationship[tosca_relationships_nfv_VirtualLinksTo]

}

/** There exists some tosca.nodes.nfv.Forwarding */
run Show_tosca_nodes_nfv_Forwarding {
  tosca_nodes_nfv_Forwarding.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 2 LocationGraphs/Location,
  exactly 35 LocationGraphs/Value,
  exactly 2 LocationGraphs/Name,
  exactly 1 LocationGraphs/Sort,
  exactly 1 LocationGraphs/Process,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 1 tosca_nodes_nfv_Forwarding
  expect 1

// --------------------------------------------------
// Group Types
// --------------------------------------------------

//
// NsPlacementGroup is used for describing the affinity or anti-affinity relationship applicable between VNF instances created using different VNFDs, the Virtual Link instances created using different VLDs or the nested NS instances created using different NSDs when used in a NSD.
//
sig tosca_groups_nfv_NsPlacementGroup extends tosca_groups_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML description: {'type': 'string', 'description': 'Human readable description of the group', 'required': True}
  //
  // Human readable description of the group
  //
  property_description: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  members_type[tosca_nodes_nfv_VNF + tosca_nodes_nfv_NsVirtualLink + tosca_nodes_nfv_NS]
}

/** There exists some tosca.groups.nfv.NsPlacementGroup */
run Show_tosca_groups_nfv_NsPlacementGroup {
  tosca_groups_nfv_NsPlacementGroup.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_groups_nfv_NsPlacementGroup
  expect 1

//
// the VNFFG group type describes a topology of the NS or a portion of the NS, and optionally forwarding rules, applicable to the traffic conveyed over this topology
//
sig tosca_groups_nfv_VNFFG extends tosca_groups_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML description: {'type': 'string', 'description': 'Human readable description of the group', 'required': True}
  //
  // Human readable description of the group
  //
  property_description: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------


  members_type[tosca_nodes_nfv_NFP + tosca_nodes_nfv_VNF + tosca_nodes_nfv_PNF + tosca_nodes_nfv_NS + tosca_nodes_nfv_NsVirtualLink + tosca_nodes_nfv_NfpPositionElement]
}

/** There exists some tosca.groups.nfv.VNFFG */
run Show_tosca_groups_nfv_VNFFG {
  tosca_groups_nfv_VNFFG.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_groups_nfv_VNFFG
  expect 1

// --------------------------------------------------
// Policy Types
// --------------------------------------------------

//
// The NsAffinityRule describes the affinity rules applicable for the defined targets
//
sig tosca_policies_nfv_NsAffinityRule extends tosca_policies_Placement
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML scope: {'type': 'string', 'description': 'Specifies the scope of the local affinity rule.', 'required': True, 'constraints': [{'valid_values': ['nfvi_node', 'zone', 'zone_group', 'nfvi_pop', 'network_link_and_node']}]}
  //
  // Specifies the scope of the local affinity rule.
  //
  property_scope: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_scope.valid_values["nfvi_node" + "zone" + "zone_group" + "nfvi_pop" + "network_link_and_node"]

  // YAML targets: ['tosca.nodes.nfv.VNF', 'tosca.nodes.nfv.NsVirtualLink', 'tosca.nodes.nfv.NS', 'tosca.groups.nfv.NsPlacementGroup']
  targets_type[tosca_nodes_nfv_VNF + tosca_nodes_nfv_NsVirtualLink + tosca_nodes_nfv_NS + tosca_groups_nfv_NsPlacementGroup]
}

/** There exists some tosca.policies.nfv.NsAffinityRule */
run Show_tosca_policies_nfv_NsAffinityRule {
  tosca_policies_nfv_NsAffinityRule.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NsAffinityRule
  expect 1

//
// The NsAntiAffinityRule describes the anti-affinity rules applicable for the defined targets
//
sig tosca_policies_nfv_NsAntiAffinityRule extends tosca_policies_Placement
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML scope: {'type': 'string', 'description': 'Specifies the scope of the local affinity rule..', 'required': True, 'constraints': [{'valid_values': ['nfvi_node', 'zone', 'zone_group', 'nfvi_pop', 'network_link_and_node']}]}
  //
  // Specifies the scope of the local affinity rule..
  //
  property_scope: one string,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_scope.valid_values["nfvi_node" + "zone" + "zone_group" + "nfvi_pop" + "network_link_and_node"]

  // YAML targets: ['tosca.nodes.nfv.VNF', 'tosca.nodes.nfv.NsVirtualLink', 'tosca.nodes.nfv.NS', 'tosca.groups.nfv.NsPlacementGroup']
  targets_type[tosca_nodes_nfv_VNF + tosca_nodes_nfv_NsVirtualLink + tosca_nodes_nfv_NS + tosca_groups_nfv_NsPlacementGroup]
}

/** There exists some tosca.policies.nfv.NsAntiAffinityRule */
run Show_tosca_policies_nfv_NsAntiAffinityRule {
  tosca_policies_nfv_NsAntiAffinityRule.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NsAntiAffinityRule
  expect 1

//
// The NsSecurityGroupRule type is a policy type specified the matching criteria for the ingress and/or egress traffic to/from visited SAPs.
//
sig tosca_policies_nfv_NsSecurityGroupRule extends tosca_policies_nfv_Abstract_SecurityGroupRule
{
} {
  // YAML targets: ['tosca.nodes.nfv.Sap']
  targets_type[tosca_nodes_nfv_Sap]
}

/** There exists some tosca.policies.nfv.NsSecurityGroupRule */
run Show_tosca_policies_nfv_NsSecurityGroupRule {
  tosca_policies_nfv_NsSecurityGroupRule.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NsSecurityGroupRule
  expect 1

//
// policy definition of NfpRule
//
sig tosca_policies_nfv_NfpRule extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML ether_destination_address: {'description': 'Indicates a destination Mac address.', 'type': 'string', 'required': False}
  //
  // Indicates a destination Mac address.
  //
  property_ether_destination_address: lone string,

  // YAML ether_source_address: {'description': 'Indicates a source Mac address.', 'type': 'string', 'required': False}
  //
  // Indicates a source Mac address.
  //
  property_ether_source_address: lone string,

  // YAML ether_type: {'description': 'Indicates the protocol carried over the Ethernet layer.', 'type': 'string', 'constraints': [{'valid_values': ['ipv4', 'ipv6']}], 'required': False}
  //
  // Indicates the protocol carried over the Ethernet layer.
  //
  property_ether_type: lone string,

  // YAML vlan_tag: {'description': 'Indicates a VLAN identifier in an IEEE 802.1Q-2014 tag [14]. Multiple tags can be included for QinQ stacking.', 'type': 'list', 'entry_schema': {'type': 'string'}, 'required': False}
  //
  // Indicates a VLAN identifier in an IEEE 802.1Q-2014 tag [14]. Multiple tags can be included for QinQ stacking.
  //
  property_vlan_tag: seq string,

  // YAML protocol: {'description': 'Indicates the L4 protocol, For IPv4 [15] this corresponds to the field called "Protocol" to identify the next level protocol. For IPv6 [16] this corresponds to the field is called the "Next Header" field. Permitted values: Any keyword defined in the IANA [17] protocol registry.', 'type': 'string', 'required': False}
  //
  // Indicates the L4 protocol, For IPv4 [15] this corresponds to the field called "Protocol" to identify the next level protocol. For IPv6 [16] this corresponds to the field is called the "Next Header" field. Permitted values: Any keyword defined in the IANA [17] protocol registry.
  //
  property_protocol: lone string,

  // YAML dscp: {'description': 'For IPv4 [15] a string of "0" and "1" digits that corresponds to the 6-bit Differentiated Services Code Point (DSCP) field of the IP header. For IPv6 [16] a string of "0" and "1" digits that corresponds to the 6 differentiated services bits of the traffic class header field.', 'type': 'string', 'required': False}
  //
  // For IPv4 [15] a string of "0" and "1" digits that corresponds to the 6-bit Differentiated Services Code Point (DSCP) field of the IP header. For IPv6 [16] a string of "0" and "1" digits that corresponds to the 6 differentiated services bits of the traffic class header field.
  //
  property_dscp: lone string,

  // YAML source_port_range: {'description': 'Indicates a range of source ports.', 'type': 'range', 'required': False, 'constraints': [{'in_range': [0, 65535]}]}
  //
  // Indicates a range of source ports.
  //
  property_source_port_range: lone range,

  // YAML destination_port_range: {'description': 'Indicates a range of destination ports.', 'type': 'range', 'required': False, 'constraints': [{'in_range': [0, 65535]}]}
  //
  // Indicates a range of destination ports.
  //
  property_destination_port_range: lone range,

  // YAML source_ip_address_prefix: {'description': 'Indicates the source IP address range in CIDR format.', 'type': 'string', 'required': False}
  //
  // Indicates the source IP address range in CIDR format.
  //
  property_source_ip_address_prefix: lone string,

  // YAML destination_ip_address_prefix: {'description': 'Indicates the destination IP address range in CIDR format.', 'type': 'string', 'required': False}
  //
  // Indicates the destination IP address range in CIDR format.
  //
  property_destination_ip_address_prefix: lone string,

  // YAML extended_criteria: {'description': 'Indicates values of specific bits in a frame.', 'type': 'list', 'entry_schema': {'type': 'tosca.datatypes.nfv.Mask'}, 'required': False}
  //
  // Indicates values of specific bits in a frame.
  //
  property_extended_criteria: seq tosca_datatypes_nfv_Mask,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_ether_type.valid_values["ipv4" + "ipv6"]
  some property_source_port_range implies property_source_port_range.in_range[0, 65535]
  some property_destination_port_range implies property_destination_port_range.in_range[0, 65535]

  // YAML targets: ['tosca.nodes.nfv.NFP']
  targets_type[tosca_nodes_nfv_NFP]
}

/** There exists some tosca.policies.nfv.NfpRule */
run Show_tosca_policies_nfv_NfpRule {
  tosca_policies_nfv_NfpRule.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NfpRule
  expect 1

//
// Policy type is used to identify information to be monitored during the lifetime of a network service instance as defined in ETSI GS NFV-IFA 014 [2].
//
sig tosca_policies_nfv_NsMonitoring extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML ns_monitoring_parameters: {'type': 'list', 'description': 'Specifies a virtualised resource related performance metric to be monitored on the NS level.', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.NsMonitoringParameter'}, 'constraints': [{'min_length': 1}]}
  //
  // Specifies a virtualised resource related performance metric to be monitored on the NS level.
  //
  property_ns_monitoring_parameters: seq tosca_datatypes_nfv_NsMonitoringParameter,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_ns_monitoring_parameters.min_length[1]

  // YAML targets: ['tosca.nodes.nfv.NS']
  targets_type[tosca_nodes_nfv_NS]
}

/** There exists some tosca.policies.nfv.NsMonitoring */
run Show_tosca_policies_nfv_NsMonitoring {
  tosca_policies_nfv_NsMonitoring.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_NsMonitoring
  expect 1

//
// Policy type is used to identify information to be monitored during the lifetime of a VNF instance as defined in ETSI GS NFV-IFA 014 [2].
//
sig tosca_policies_nfv_VnfMonitoring extends tosca_policies_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML vnf_monitoring_parameters: {'type': 'list', 'description': 'Specifies a virtualised resource related performance metric to be monitored on the NS level.', 'required': True, 'entry_schema': {'type': 'tosca.datatypes.nfv.VnfMonitoringParameter'}, 'constraints': [{'min_length': 1}]}
  //
  // Specifies a virtualised resource related performance metric to be monitored on the NS level.
  //
  property_vnf_monitoring_parameters: seq tosca_datatypes_nfv_VnfMonitoringParameter,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_vnf_monitoring_parameters.min_length[1]

  // YAML targets: ['tosca.nodes.nfv.VNF']
  targets_type[tosca_nodes_nfv_VNF]
}

/** There exists some tosca.policies.nfv.VnfMonitoring */
run Show_tosca_policies_nfv_VnfMonitoring {
  tosca_policies_nfv_VnfMonitoring.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_policies_nfv_VnfMonitoring
  expect 1

