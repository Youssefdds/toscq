// --------------------------------------------------
// TOSCA Topology Metadata
// --------------------------------------------------

// tosca_definitions_version: tosca_simple_yaml_1_3
// description: Custom scaling group types

open cloudnet/LocationGraphs
open cloudnet/TOSCA
open cloudnet/tosca_simple_yaml_1_3

// --------------------------------------------------
// Imports
// --------------------------------------------------

open etsi_nfv_sol001_common_types_3_3_1
open etsi_nfv_sol001_nsd_types_3_3_1
open etsi_nfv_sol001_vnfd_types_3_3_1
open etsi_nfv_sol001_pnfd_types_3_3_1

// --------------------------------------------------
// Group Types
// --------------------------------------------------

//
// Custom scaling group with min/max instances
//
sig tosca_groups_Scaling extends tosca_groups_Root
{
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  // YAML min_instances: {'type': 'integer', 'required': True, 'constraints': [{'greater_or_equal': 0}]}
  property_min_instances: one integer,

  // YAML max_instances: {'type': 'integer', 'required': True, 'constraints': [{'greater_or_equal': 1}]}
  property_max_instances: one integer,

} {
  // --------------------------------------------------
  // Properties
  // --------------------------------------------------

  property_min_instances.greater_or_equal[0]
  property_max_instances.greater_or_equal[1]

}

/** There exists some tosca.groups.Scaling */
run Show_tosca_groups_Scaling {
  tosca_groups_Scaling.no_name[]
} for 5 but
  8 Int,
  5 seq,
  // NOTE: Setting following scopes strongly reduces the research space.
  exactly 0 LocationGraphs/LocationGraph,
  exactly 1 LocationGraphs/Location,
  exactly 1 LocationGraphs/Name,
  exactly 1 LocationGraphs/Process,
  exactly 1 LocationGraphs/Sort,
  exactly 1 tosca_groups_Scaling
  expect 1

