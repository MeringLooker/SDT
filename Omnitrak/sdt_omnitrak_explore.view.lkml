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

explore: sdt_omnitrak_ratings {
  hidden:  yes
  view_name: sdt_omnitrak
  label: "Omnitrak Ratings"
  view_label: "Ratings"
  group_label: "San Diego Tourism"

  join: sdt_omnitrak_union {
    view_label: "Ads Data"
    sql_on: ${sdt_omnitrak_union.omnitrak_program_creative_key} = ${sdt_omnitrak.omnitrak_key_new} ;;
    relationship: many_to_one
  }
}
