include: "/Publisher_Passback/**/*.view"

explore: sdt_fy21_dm_hulu {
  hidden: yes
  label: "Hulu FY21 Drive Market"
  view_label: "Hulu FY21 Drive Market"
  group_label: "San Diego Tourism"

  join: sdt_dcm_ga_view {
    view_label: "DCM Dimensions"
    type: inner
    sql_on: ${sdt_dcm_ga_view.ad_id} = ${sdt_fy21_dm_hulu.ad_id} ;;
    fields: []
    relationship: one_to_one
  }

}
