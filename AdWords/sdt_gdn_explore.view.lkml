include: "/AdWords/**/*.view"
include: "/Google_Analytics/**/*.view"


explore: sdt_gdn {
  hidden: yes
  view_name: sdt_gdn_view
  label: "AdWords Display"
  view_label: "AdWords Display"
  group_label: "San Diego Tourism"

#   join: sdt_ga_onsite_adwords {
#     view_label: "Google Analytics"
#     type: left_outer
#     fields: []
#     sql_on: ${sdt_gdn_view.join_id_onsite} = ${sdt_ga_onsite_adwords.adwords_join_id} ;;
#     relationship: many_to_one
#   }
#
#   join: sdt_ga_pageinfo {
#     view_label: "Google Analytics - Page Info"
#     type: left_outer
#     sql_on: ${sdt_gdn_view.join_id_pageInfo} = ${sdt_ga_pageinfo.adwords_join_id} ;;
#     relationship: many_to_one
#   }
}
