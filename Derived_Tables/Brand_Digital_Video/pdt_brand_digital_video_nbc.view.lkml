# view: pdt_brand_digital_video_nbc {
#   derived_table: {
#     explore_source: sdt_dcm {
#       column: publisher {field: sdt_dcm_ga_view.publisher}
#       column: campaign {field: sdt_dcm_ga_view.sdt_campaign}
#       column: market {field: sdt_dcm_ga_view.sdt_market}
#       column: region {field: sdt_dcm_ga_view.sdt_region}
#       column: audience {field: sdt_dcm_ga_view.sdt_audience}
#       column: creative_name {field: sdt_dcm_ga_view.creative_name}
#       column: date {field: sdt_dcm_ga_view.date_date}
#       column: week {field: sdt_dcm_ga_view.date_week}
#       column: month {field: sdt_dcm_ga_view.date_month}
#       column: quarter {field: sdt_dcm_ga_view.date_quarter}
#       column: total_impressions {field: sdt_fy20_digitalvideo_dcm_view.total_impressions}
#       column: total_clicks {field: sdt_fy20_digitalvideo_dcm_view.total_clicks}
#       column: total_views {field: sdt_fy20_digitalvideo_dcm_view.total_video_views}
#       column: total_completes {field: sdt_fy20_digitalvideo_dcm_view.total_video_completes}
#       column: total_cost {field: sdt_fy20_digitalvideo_dcm_view.total_media_cost}

#       filters: {
#         field: sdt_dcm_ga_view.sdt_campaign
#         value: "Brand Digital Video"
#       }
#       filters: {
#         field: sdt_dcm_ga_view.publisher
#         value: "NBC Sports"
#       }
#       filters: {
#         field: sdt_dcm_ga_view.date_date
#         value: "2019/08/25 to 2020/03/17"
#       }
#     }
#     datagroup_trigger: sdt_default_datagroup
#     distribution_style: all
#   }
# }
