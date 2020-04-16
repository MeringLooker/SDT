connection: "mc_panoply"

include: "*.view.lkml"
include: "/Facebook/*.view"
include: "/TrueView/*.view"
include: "/AdWords/*.view"
include: "/Google_Analytics/*.view"
include: "/Pinterest/*.view"
include: "/Publisher_Passback/*/*.view"
include: "/DCM/*.view"

datagroup: sdt_content_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: pdt_content_campaign {
  label: "Always On Content"
  view_label: "Always On Content"
  group_label: "San Diego Tourism"
  hidden: yes
}
