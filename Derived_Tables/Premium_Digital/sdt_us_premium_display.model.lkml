connection: "mc_panoply"

include: "*.view.lkml"
include: "/Google_Analytics/*.view"
include: "/DCM/*.view"
include: "/Publisher_Passback/**/*.view"

datagroup: sdt_premium_digital_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: ndt_premium_display_campaign {
  #persist_with: vca_dream365_datagroup
  label: "Premium Digital Display"
  view_label: "Premium Digital Display"
  group_label: "San Diego Tourism"
  hidden: yes
}
