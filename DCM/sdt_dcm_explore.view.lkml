include: "/DCM/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: sdt_dcm {
  view_name: sdt_dcm_view
  hidden: yes
  label: "DoubleClick"
  view_label: "DoubleClick"
  group_label: "San Diego Tourism"

  join: sdt_ga_onsite {
    view_label: "Google Analytics"
    type: left_outer
    fields: []
    sql_on: ${sdt_dcm_view.comp_key} = ${sdt_ga_onsite.join_id} ;;
    relationship: many_to_one
  }
}
