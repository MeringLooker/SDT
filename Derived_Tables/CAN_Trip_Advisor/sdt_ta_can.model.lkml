connection: "mc_panoply"

include: "*.view.lkml"
include: "/DCM/*.view"
include: "/Publisher_Passback/*/*.view"

datagroup: sdt_ta_can_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: ndt_ta_can_campaign {
  #persist_with: vca_dream365_datagroup
  label: "CAN TripAdvisor Program"
  view_label: "CAN TripAdvisor Program"
  group_label: "San Diego Tourism"
  hidden: yes
}
