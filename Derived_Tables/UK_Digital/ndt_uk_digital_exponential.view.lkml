# view: ndt_uk_digital_exponential {
#   derived_table: {
#     explore_source: sdt_dcm {
#       column: publisher {field: sdt_dcm_ga_view.publisher}
#       column: campaign {field: sdt_dcm_ga_view.sdt_campaign}
#       column: market {field: sdt_dcm_ga_view.sdt_market}
#       column: layer {field: sdt_dcm_ga_view.sdt_layer}
#       column: placement {field: sdt_dcm_ga_view.sdt_placement}
#       column: creative_name {field: sdt_dcm_ga_view.creative_name}
#       column: date {field: sdt_dcm_ga_view.date_date}
#       column: week {field: sdt_dcm_ga_view.date_week}
#       column: month {field: sdt_dcm_ga_view.date_month}
#       column: total_impressions {field: sdt_fy20_uk_dcm_view.total_impressions}
#       column: total_clicks {field: sdt_fy20_uk_dcm_view.total_clicks}
#       column: total_views {field: sdt_fy20_uk_dcm_view.total_video_views}
#       column: total_completes {field: sdt_fy20_uk_dcm_view.total_video_completes}
#       column: total_cost {field: sdt_fy20_uk_dcm_view.total_media_cost}
#       column: total_sessions {field: sdt_dcm_ga_view.total_sessions}
#       column: total_session_duration {field: sdt_dcm_ga_view.total_session_duration}
#       filters: {
#         field: sdt_dcm_ga_view.campaign
#         value: "SDT: 004877_01 FY20 UK Digital Campaign"
#       }
#       filters: {
#         field: sdt_dcm_ga_view.publisher
#         value: "Exponential"
#       }
#       filters: {
#         field: sdt_dcm_ga_view.date_date
#         value: "2020/01/06 to 2020/03/22"
#       }
#     }
#     datagroup_trigger: sdt_default_datagroup
#     distribution_style: all
#   }
# }
