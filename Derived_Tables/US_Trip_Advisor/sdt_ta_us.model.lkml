connection: "mc_panoply"

include: "*.view.lkml"
include: "/DCM/*.view"
include: "/Publisher_Passback/*/*.view"

datagroup: sdt_ta_us_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: ndt_ta_us_campaign {
  label: "US TripAdvisor Program"
  view_label: "US TripAdvisor Program"
  group_label: "San Diego Tourism"
  hidden: yes
}
#
# explore: ndt_ta_us_audext_video {
#   #persist_with: vca_dream365_datagroup
#   label: "audext video"
#   view_label: "audext video"
#   group_label: "San Diego Tourism"
#   hidden: yes
# }
