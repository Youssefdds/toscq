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


// --------------------------------------------------
// Topology Template
// --------------------------------------------------

sig nsd_topology_template extends TOSCA/TopologyTemplate
{
  // --------------------------------------------------
  // YAML node_templates:
  // --------------------------------------------------

  // YAML vl1: {'type': 'tosca.nodes.nfv.VL'}
  // ERROR: type tosca.nodes.nfv.VL undefined
  // YAML vl2: {'type': 'tosca.nodes.nfv.VL'}
  // ERROR: type tosca.nodes.nfv.VL undefined
  // YAML vnf_container: {'requirements': [{'vl': 'vl2'}], 'type': 'tosca.nodes.nfv.VNF'}
  // ERROR: type tosca.nodes.nfv.VNF undefined
  // YAML vnf_vm1: {'requirements': [{'vl': 'vl1'}], 'type': 'tosca.nodes.nfv.VNF'}
  // ERROR: type tosca.nodes.nfv.VNF undefined
  // YAML vnf_vm2: {'requirements': [{'vl': 'vl1'}], 'type': 'tosca.nodes.nfv.VNF'}
  // ERROR: type tosca.nodes.nfv.VNF undefined
  // --------------------------------------------------
  // YAML relationship_templates:
  // --------------------------------------------------

  // --------------------------------------------------
  // YAML groups:
  // --------------------------------------------------

  // YAML ns_scaling_group: {'members': ['vnf_vm1', 'vnf_vm2', 'vnf_container'], 'properties': {'max_instances': 2, 'min_instances': 1}, 'type': 'tosca.groups.Scaling'}
  // ERROR: type tosca.groups.Scaling undefined
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

  #nodes = 5
  // YAML vl1: {'type': 'tosca.nodes.nfv.VL'}
  node[vl1]
  vl1.name["vl1"]
  vl1.node_type_name = "tosca.nodes.nfv.VL"
  // YAML properties:
  // YAML interfaces:
  no vl1.interfaces
  // YAML artifacts:
  no vl1.artifacts
  // YAML capabilities:

  // YAML vl2: {'type': 'tosca.nodes.nfv.VL'}
  node[vl2]
  vl2.name["vl2"]
  vl2.node_type_name = "tosca.nodes.nfv.VL"
  // YAML properties:
  // YAML interfaces:
  no vl2.interfaces
  // YAML artifacts:
  no vl2.artifacts
  // YAML capabilities:

  // YAML vnf_container: {'requirements': [{'vl': 'vl2'}], 'type': 'tosca.nodes.nfv.VNF'}
  node[vnf_container]
  vnf_container.name["vnf_container"]
  vnf_container.node_type_name = "tosca.nodes.nfv.VNF"
  // YAML properties:
  // YAML interfaces:
  no vnf_container.interfaces
  // YAML artifacts:
  no vnf_container.artifacts
  // YAML capabilities:
  // YAML vl: vl2
  vnf_container.unknown.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  no vnf_container.unknown.relationship.interfaces

  // YAML vnf_vm1: {'requirements': [{'vl': 'vl1'}], 'type': 'tosca.nodes.nfv.VNF'}
  node[vnf_vm1]
  vnf_vm1.name["vnf_vm1"]
  vnf_vm1.node_type_name = "tosca.nodes.nfv.VNF"
  // YAML properties:
  // YAML interfaces:
  no vnf_vm1.interfaces
  // YAML artifacts:
  no vnf_vm1.artifacts
  // YAML capabilities:
  // YAML vl: vl1
  vnf_vm1.unknown.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  no vnf_vm1.unknown.relationship.interfaces

  // YAML vnf_vm2: {'requirements': [{'vl': 'vl1'}], 'type': 'tosca.nodes.nfv.VNF'}
  node[vnf_vm2]
  vnf_vm2.name["vnf_vm2"]
  vnf_vm2.node_type_name = "tosca.nodes.nfv.VNF"
  // YAML properties:
  // YAML interfaces:
  no vnf_vm2.interfaces
  // YAML artifacts:
  no vnf_vm2.artifacts
  // YAML capabilities:
  // YAML vl: vl1
  vnf_vm2.unknown.relationship._name_ = "(anonymous)"
  // YAML interfaces:
  no vnf_vm2.unknown.relationship.interfaces


  // --------------------------------------------------
  // YAML relationship_templates:
  // --------------------------------------------------

  no relationships

  // --------------------------------------------------
  // YAML groups:
  // --------------------------------------------------

  #groups = 1
  // YAML ns_scaling_group: {'members': ['vnf_vm1', 'vnf_vm2', 'vnf_container'], 'properties': {'max_instances': 2, 'min_instances': 1}, 'type': 'tosca.groups.Scaling'}
  group[group_ns_scaling_group]
  group_ns_scaling_group.name["ns_scaling_group"]
  // YAML properties:
  // YAML interfaces:
  no group_ns_scaling_group.interfaces
  // YAML members: ['vnf_vm1', 'vnf_vm2', 'vnf_container']
  group_ns_scaling_group.members[vnf_vm1 + vnf_vm2 + vnf_container]


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

/** There exists some nsd_topology_template */
run Show_nsd_topology_template {
} for 0 but
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 1 LocationGraphs/LocationGraph,
  exactly 0 LocationGraphs/Location,
  exactly 8 LocationGraphs/Value,
  exactly 6 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 0 LocationGraphs/Role,
  exactly 0 TOSCA/Scalar,
  exactly 0 TOSCA/scalar_unit_size,
  exactly 0 TOSCA/scalar_unit_frequency,
  exactly 0 TOSCA/scalar_unit_time,
  exactly 0 TOSCA/map_integer/Map,
  exactly 0 TOSCA/map_string/Map,
  exactly 0 TOSCA/map_data/Map,
  exactly 0 TOSCA/map_map_data/Map,
  exactly 0 TOSCA/ToscaComponent,
  exactly 0 TOSCA/ToscaRole,
  exactly 0 TOSCA/ToscaValue,
  exactly 1 TOSCA/TopologyTemplate,
  exactly 0 TOSCA/Node,
  exactly 0 TOSCA/Requirement,
  exactly 0 TOSCA/Capability,
  exactly 0 TOSCA/Relationship,
  exactly 0 TOSCA/Group,
  exactly 0 TOSCA/Policy,
  exactly 0 TOSCA/Interface,
  exactly 0 TOSCA/Operation,
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
  exactly 0 tosca_datatypes_Root,
  exactly 0 tosca_datatypes_Credential,
  exactly 0 tosca_datatypes_TimeInterval,
  exactly 0 tosca_datatypes_network_NetworkInfo,
  exactly 0 tosca_datatypes_network_PortInfo,
  exactly 0 tosca_datatypes_network_PortSpec,
  exactly 0 tosca_capabilities_Root,
  exactly 0 tosca_capabilities_Node,
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
  exactly 0 tosca_interfaces_Root,
  exactly 0 tosca_interfaces_node_lifecycle_Standard,
  exactly 0 tosca_interfaces_relationship_Configure,
  exactly 0 tosca_relationships_Root,
  exactly 0 tosca_relationships_DependsOn,
  exactly 0 tosca_relationships_HostedOn,
  exactly 0 tosca_relationships_ConnectsTo,
  exactly 0 tosca_relationships_AttachesTo,
  exactly 0 tosca_relationships_RoutesTo,
  exactly 0 tosca_relationships_network_LinksTo,
  exactly 0 tosca_relationships_network_BindsTo,
  exactly 0 tosca_nodes_Root,
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
  exactly 0 tosca_nodes_Container_Application,
  exactly 0 tosca_nodes_LoadBalancer,
  exactly 0 tosca_nodes_network_Network,
  exactly 0 tosca_nodes_network_Port,
  exactly 0 tosca_groups_Root,
  exactly 0 tosca_policies_Root,
  exactly 0 tosca_policies_Placement,
  exactly 0 tosca_policies_Scaling,
  exactly 0 tosca_policies_Update,
  exactly 0 tosca_policies_Performance,
  exactly 1 nsd_topology_template,
  exactly 2 tosca_nodes_nfv_VL,
  exactly 3 tosca_nodes_nfv_VNF,
  exactly 1 tosca_groups_Scaling,
  8 Int,
  0 seq
  expect 1


