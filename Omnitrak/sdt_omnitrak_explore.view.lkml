include: "/Google_Analytics/*.view"
include: "/TrueView/*.view"
include: "/Facebook/*.view"
include: "/DCM/*.view"
include: "/AdWords/*.view"
include: "/Pinterest/*.view"
include: "/Omnitrak/*.view"

datagroup: sdt_omnitrak_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: sdt_omnitrak {
  hidden:  yes
  view_name: sdt_omnitrak_union
  label: "Omnitrak Research"
  view_label: "Ads Data"
  group_label: "San Diego Tourism"

}
