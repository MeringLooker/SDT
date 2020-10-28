# view: ndt_us_pullthrough_kayak {
#   derived_table: {
#     explore_source: sdt_dcm {
#       column: publisher {field: sdt_dcm_ga_view.publisher}
#       column: campaign {field: sdt_dcm_ga_view.sdt_campaign}
#       column: market {field: sdt_dcm_ga_view.sdt_market}
#       column: layer {field: sdt_dcm_ga_view.sdt_layer}
#       column: placement {field: sdt_dcm_ga_view.sdt_placement}
#       column: ad_size {field: sdt_dcm_ga_view.ad_size}
#       column: date {field: sdt_dcm_ga_view.date_date}
#       column: week {field: sdt_dcm_ga_view.date_week}
#       column: month {field: sdt_dcm_ga_view.date_month}
#       column: quarter {field: sdt_dcm_ga_view.date_quarter}
#       column: total_impressions {field: sdt_dcm_ga_view.total_impressions}
#       column: total_clicks {field: sdt_dcm_ga_view.total_clicks}
#       column: total_cost {field: sdt_dcm_ga_view.total_cost}
#       column: total_sessions {field: sdt_dcm_ga_view.total_sessions}
#       column: total_session_duration {field: sdt_dcm_ga_view.total_session_duration}
#       filters: {
#         field: sdt_dcm_ga_view.campaign
#         value: "SDT: 004762_01 FY20 Pull-Through Campaign"
#       }
#       filters: {
#         field: sdt_dcm_ga_view.publisher
#         value: "Kayak"
#       }
#       filters: {
#         field: sdt_dcm_ga_view.date_date
#         value: "2019/09/16 to 2020/03/14"
#       }
#     }
#     datagroup_trigger: sdt_default_datagroup
#     distribution_style: all
#   }
# }
