include: "/AdWords/**/*.view"
include: "/Google_Analytics/**/*.view"


explore: sdt_sem {
  hidden: yes
  view_name: sdt_sem_view
#   always_filter: {
#     filters: {
#       field: advertising_channel
#       value: "Search"
#     }
#   }
  label: "AdWords Search"
  view_label: "AdWords Search"
  group_label: "San Diego Tourism"

  join: sdt_ga_userinfo {
    view_label: "Google Analytics"
    type: left_outer
    fields: []
    sql_on: ${sdt_sem_view.join_id_userInfo} = ${sdt_ga_userinfo.adwords_join_id} ;;
    relationship: one_to_one
  }

  join: sdt_ga_pageinfo {
    view_label: "Google Analytics - Page Info"
    type: left_outer
    sql_on: ${sdt_sem_view.join_id_pageInfo} = ${sdt_ga_pageinfo.adwords_join_id} ;;
    relationship: many_to_one
  }
}
