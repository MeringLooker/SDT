include: "/TrueView/*.view.lkml"
include: "/Google_Analytics/*.view.lkml"

explore: sdt_trueview {
  view_name: sdt_trueview_view
  hidden: yes
  label: "YouTube"
  view_label: "YouTube"
  group_label: "San Diego Tourism"

  join: sdt_trueview_quartiles {
    type: left_outer
    fields: []
    sql_on: ${sdt_trueview_view.quartiles_join_id} = ${sdt_trueview_quartiles.trueview_join} ;;
    relationship: many_to_one
  }
}

explore: sdt_yt {
  view_name: sdt_quartiles_yt_view
  label: "YouTube (Quartiles)"
  view_label: "YouTube"
  group_label: "San Diego Tourism"
  hidden: yes
}
