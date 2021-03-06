# view: ndt_can_digital_sem {
#   derived_table: {
#     explore_source: sdt_sem {
#       column: publisher {field: sdt_sem_ga_view.publisher}
#       column: campaign {field: sdt_sem_ga_view.sdt_campaign}
#       column: market {field: sdt_sem_ga_view.sdt_market}
#       column: layer {field: sdt_sem_ga_view.sdt_layer}
#       column: placement {field: sdt_sem_ga_view.sdt_placement}
#       column: creative_name {field: sdt_sem_ga_view.creative_name}
#       column: date {field: sdt_sem_ga_view.day_date}
#       column: week {field: sdt_sem_ga_view.day_week}
#       column: month {field: sdt_sem_ga_view.day_month}
#       column: total_impressions {field: sdt_sem_ga_view.total_impressions}
#       column: total_clicks {field: sdt_sem_ga_view.total_clicks}
#       column: total_views {field: sdt_sem_ga_view.total_views}
#       column: total_completes {field: sdt_sem_ga_view.total_completes}
#       column: total_cost {field: sdt_sem_ga_view.total_cost}
#       column: total_sessions {field: sdt_sem_ga_view.total_sessions}
#       column: total_session_duration {field: sdt_sem_ga_view.total_session_duration}
#       filters: {
#         field: sdt_sem_ga_view.sdt_campaign
#         value: "Canada Digital"
#       }
#       filters: {
#         field: sdt_sem_ga_view.day_date
#         value: "2019/11/04 to 2020/03/13"
#       }
#     }
#     datagroup_trigger: sdt_default_datagroup
#     distribution_style: all
#   }
# }
