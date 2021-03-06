include: "/Google_Analytics/**/*.view"
include: "/Publisher_Passback/**/*.view"

explore: sdt_fy20_us_pullthrough_adroll {
  hidden: yes
  label: "AdRoll"
  view_label: "AdRoll Social Passback"
  group_label: "San Diego Tourism"

  join: sdt_ga_acq_view {
    view_label: "Google Analytics"
    type: left_outer
    fields: []
    sql_on: ${sdt_fy20_us_pullthrough_adroll.passback_join} = ${sdt_ga_acq_view.adroll_join_id} ;;
    relationship: one_to_many
  }
}
