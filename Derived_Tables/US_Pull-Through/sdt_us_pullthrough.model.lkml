connection: "mc_panoply"

include: "*.view.lkml"
include: "/Google_Analytics/*.view"
include: "/AdWords/*.view"
include: "/DCM/*.view"
include: "/Facebook/*.view"
include: "/Pinterest/*.view"

datagroup: sdt_us_pullthrough_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: ndt_us_pullthrough_campaign {
  #persist_with: vca_dream365_datagroup
  label: "US Pull-Through"
  view_label: "US Pull-Through"
  group_label: "San Diego Tourism"
  hidden: yes
}
