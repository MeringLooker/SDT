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
#   join: facebookads__mc_visit_san_diego_video_p100_watched_actions {
#     type: left_outer
#     fields: []
#     sql_on: ${sdt_fb_view.id} =${facebookads__mc_visit_san_diego_video_p100_watched_actions.facebookads__mc_visit_san_diego_id} ;;
#     relationship: many_to_one
#   }
#
#   join: facebookads__mc_visit_san_diego_video_p75_watched_actions {
#     type: left_outer
#     fields: []
#     sql_on: ${sdt_fb_view.id} =${facebookads__mc_visit_san_diego_video_p75_watched_actions.facebookads__mc_visit_san_diego_id} ;;
#     relationship: many_to_one
#   }
#
#   join: facebookads__mc_visit_san_diego_video_p50_watched_actions {
#     type: left_outer
#     fields: []
#     sql_on: ${sdt_fb_view.id} =${facebookads__mc_visit_san_diego_video_p50_watched_actions.facebookads__mc_visit_san_diego_id} ;;
#     relationship: many_to_one
#   }
#
#   join: facebookads__mc_visit_san_diego_video_p25_watched_actions {
#     type: left_outer
#     fields: []
#     sql_on: ${sdt_fb_view.id} =${facebookads__mc_visit_san_diego_video_p25_watched_actions.facebookads__mc_visit_san_diego_id} ;;
#     relationship: many_to_one
#   }
#
#   join: sdt_ga_onsite {
#     view_label: "Google Analytics"
#     type: left_outer
#     fields: []
#     sql_on: ${sdt_fb_view.comp_key} = ${sdt_ga_onsite.join_id} ;;
#     relationship: one_to_many
#   }
#
#   join: sdt_fb_thruplays {
#     type: left_outer
#     fields: []
#     sql_on: ${sdt_fb_view.thruplay_join_id} = ${sdt_fb_thruplays.thruplay_join} ;;
#     relationship: one_to_many
#   }

}
