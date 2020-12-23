include: "/Publisher_Passback/**/*.view"

explore: sdt_fy21_pt_adara {
  hidden: yes
  label: "Adara FY21 PullThrough"
  view_label: "Adara FY21 PullThrough"
  group_label: "San Diego Tourism"

  join: sdt_dcm_ga_view {
    view_label: "DCM Dimensions"
    type: inner
    sql_on: ${sdt_dcm_ga_view.adara_join} = ${sdt_fy21_pt_adara.adara_join} ;;
    fields: []
    relationship: one_to_one
  }
}
