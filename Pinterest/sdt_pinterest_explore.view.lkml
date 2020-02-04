include: "/Pinterest/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: sdt_pinterest_ads {
  view_name: sdt_pinterest
  hidden: yes
  label: "Pinterest"
  view_label: "Pinterest"
  group_label: "San Diego Tourism"

  join: sdt_ga_onsite {
    view_label: "Google Analytics"
    type: left_outer
    fields: []
    sql_on: ${sdt_pinterest.pinterest_ga_join} = ${sdt_ga_onsite.join_id} ;;
    relationship: one_to_many
  }
}
