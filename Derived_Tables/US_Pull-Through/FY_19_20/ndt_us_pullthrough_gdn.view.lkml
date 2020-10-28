# view: ndt_us_pullthrough_gdn {
#   derived_table: {
#     explore_source: sdt_gdn {
#       column: publisher {field: sdt_gdn_ga_view.publisher}
#       column: campaign {field: sdt_gdn_ga_view.sdt_campaign}
#       column: market {field: sdt_gdn_ga_view.sdt_market}
#       column: layer {field: sdt_gdn_ga_view.sdt_layer}
#       column: placement {field: sdt_gdn_ga_view.sdt_placement}
#       column: ad_size {field: sdt_gdn_ga_view.ad_size}
#       column: date {field: sdt_gdn_ga_view.day_date}
#       column: week {field: sdt_gdn_ga_view.day_week}
#       column: month {field: sdt_gdn_ga_view.day_month}
#       column: quarter {field: sdt_gdn_ga_view.day_quarter}
#       column: total_impressions {field: sdt_gdn_ga_view.total_impressions}
#       column: total_clicks {field: sdt_gdn_ga_view.total_clicks}
#       column: total_cost {field: sdt_gdn_ga_view.total_cost}
#       column: total_sessions {field: sdt_gdn_ga_view.total_sessions}
#       column: total_session_duration {field: sdt_gdn_ga_view.total_session_duration}
#       filters: {
#         field: sdt_gdn_ga_view.sdt_campaign
#         value: "US Pull-Through"
#       }
#       filters: {
#         field: sdt_gdn_ga_view.day_date
#         value: "2019/09/16 to 2020/03/14"
#       }
#     }
#     datagroup_trigger: sdt_default_datagroup
#     distribution_style: all
#   }
# }
