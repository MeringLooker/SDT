include: "/Facebook/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: sdt_fb {
  view_name: sdt_fb_ga_view
  hidden: yes
  label: "Facebook"
  view_label: "Facebook"
  group_label: "San Diego Tourism"

#   join: facebookads__mc_visit_san_diego_actions {
#     type: left_outer
#     fields: []
#     sql_on: ${sdt_fb_view.id} =${facebookads__mc_visit_san_diego_actions.facebookads__mc_visit_san_diego_id} ;;
#     relationship: many_to_one
#   }
#

}
