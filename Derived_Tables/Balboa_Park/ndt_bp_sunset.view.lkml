# view: ndt_bp_sunset {
#   derived_table: {
#     explore_source: sdt_dcm {
#       column: publisher {field: sdt_dcm_ga_view.publisher}
#       column: campaign {field: sdt_dcm_ga_view.sdt_campaign}
#       column: placement {field: sdt_dcm_ga_view.sdt_placement}
#       column: ad_size {field: sdt_dcm_ga_view.ad_size}
#       column: date {field: sdt_dcm_ga_view.date_date}
#       column: week {field: sdt_dcm_ga_view.date_week}
#       column: month {field: sdt_dcm_ga_view.date_month}
#       column: total_impressions {field: sdt_fy20_balboapark_sunset.total_impressions}
#       column: total_clicks {field:sdt_fy20_balboapark_sunset.total_clicks}
#       column: total_cost {field: sdt_fy20_balboapark_sunset.total_media_cost}
#       column: total_sessions {field: sdt_dcm_ga_view.total_sessions}
#       column: total_session_duration {field: sdt_dcm_ga_view.total_session_duration}
#       filters: {
#         field: sdt_dcm_ga_view.sdt_campaign
#         value: "Balboa Park Digital"
#       }
#       filters: {
#         field: sdt_dcm_ga_view.publisher
#         value: "Sunset"
#       }
#       filters: {
#         field: sdt_dcm_ga_view.date_date
#         value: "2020/02/24 to 2020/03/14"
#       }
#     }
#     datagroup_trigger: sdt_default_datagroup
#     distribution_style: all
#   }
# }
