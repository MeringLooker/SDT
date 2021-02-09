# view: case_study_fb {
#   derived_table: {
#     explore_source: sdt_fb {
#       column: ad_id {field: sdt_fb_ga_view.ad_id}
#       column: ad_name {field: sdt_fb_ga_view.ad_name}
#       column: date {field: sdt_fb_ga_view.date_start_date}
#       column: campaign {field: sdt_fb_ga_view.sdt_campaign}
#       column: placement {field: sdt_fb_ga_view.sdt_placement}
#       column: publisher {field: sdt_fb_ga_view.publisher}
#       column: region {field: sdt_fb_ga_view.sdt_region}
#       column: creative_name {field: sdt_fb_ga_view.creative_name}
#       column: total_impressions {field: sdt_fb_ga_view.total_impressions}
#       column: total_clicks {field: sdt_fb_ga_view.total_clicks}
#       column: total_cost {field: sdt_fb_ga_view.total_spend}
#       column: total_views {field: sdt_fb_ga_view.total_thruplays}
#       column: total_completes {field: sdt_fb_ga_view.total_video_completes}
#       column: total_sessions {field: sdt_fb_ga_view.total_sessions}
#       column: total_session_duration {field: sdt_fb_ga_view.total_session_duration}
#       filters: {
#         field: sdt_fb_ga_view.total_impressions
#         value: ">0"
#       }
#       filters: {
#         field: sdt_fb_ga_view.date_start_date
#         value: "2020/07/01 to 2021/01/01"
#       }
#       filters: {
#         field: sdt_fb_ga_view.sdt_campaign
#         value: "Fall Drive Market,US Pull-Through,Locals Recovery"
#       }
#     }
#     datagroup_trigger: sdt_omnitrak_datagroup
#     distribution_style: all
#   }
# }
