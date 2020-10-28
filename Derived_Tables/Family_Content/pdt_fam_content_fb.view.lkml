# view: pdt_fam_content_fb {
#   derived_table: {
#     explore_source: sdt_fb {
#       column: publisher {field: sdt_fb_ga_view.publisher}
#       column: campaign {field: sdt_fb_ga_view.sdt_campaign}
#       column: layer {field: sdt_fb_ga_view.sdt_layer}
#       column: partner {field: sdt_fb_ga_view.sdt_partner}
#       column: placement {field: sdt_fb_ga_view.sdt_placement}
#       column: creative_name {field: sdt_fb_ga_view.creative_name}
#       column: date {field: sdt_fb_ga_view.date_start_date}
#       column: week {field: sdt_fb_ga_view.date_start_week}
#       column: month {field: sdt_fb_ga_view.date_start_month}
#       column: total_impressions {field: sdt_fb_ga_view.total_impressions}
#       column: total_clicks {field: sdt_fb_ga_view.total_clicks}
#       column: total_views {field: sdt_fb_ga_view.total_thruplays}
#       column: total_completes {field: sdt_fb_ga_view.total_video_completes}
#       column: total_cost {field: sdt_fb_ga_view.total_spend}
#       column: total_sessions {field: sdt_fb_ga_view.total_sessions}
#       column: total_session_duration {field: sdt_fb_ga_view.total_session_duration}
#       filters: {
#         field: sdt_fb_ga_view.sdt_campaign
#         value: "Family Content"
#       }
#       filters: {
#         field: sdt_fb_ga_view.date_start_date
#         value: "2020/02/03 to 2020/03/14"
#       }
#     }
#     datagroup_trigger: sdt_default_datagroup
#     distribution_style: all
#   }
# }
