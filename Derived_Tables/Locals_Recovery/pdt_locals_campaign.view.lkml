# view: pdt_locals_campaign {
#   derived_table: {
#     sql:
#         select * from ${pdt_locals_gdn.SQL_TABLE_NAME}
#           union
#         select * from ${pdt_locals_sdut.SQL_TABLE_NAME}
#           union
#         select * from ${pdt_locals_fb.SQL_TABLE_NAME}
#         ;;
#     sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*8)/(60*60*24)) ;;
#     distribution_style: all
#   }


# #### Primary Key Added ####

#   dimension: primary_key {
#     type: string
#     hidden: yes
#     primary_key: yes
#     sql: ${campaign}||'_'||${publisher}||'_'||${layer}||'_'||${placement}||'_'||${ad_size}||'_'||${creative_name}||'_'||${date} ;;
#   }

# ### All dimensions go below ###

#   dimension: publisher {
#     type: string
#     drill_fields: [layer,week,month]
#     sql: ${TABLE}.publisher ;;
#   }

#   dimension: campaign {
#     type: string
#     hidden: yes
#     sql: ${TABLE}.campaign ;;
#   }

#   dimension: layer {
#     type: string
#     drill_fields: [publisher,week,month]
#     sql: ${TABLE}.layer ;;
#   }

#   dimension: placement {
#     type: string
#     sql: ${TABLE}.placement ;;
#   }

#   dimension: ad_size {
#     type: string
#     sql: ${TABLE}.ad_size ;;
#   }

#   dimension: creative_name {
#     type: string
#     sql: ${TABLE}.creative_name ;;
#   }

#   dimension: fiscal_year {
#     type:  string
#     group_label: "Date Periods"
#     sql:
#       CASE
#       WHEN ${date} BETWEEN '2020-07-01' AND '2021-06-30' THEN 'FY 20/21'
#       ELSE 'Uncategorized'
#       END
#     ;;
#   }

#   dimension: date {
#     type: date
#     group_label: "Date Periods"
#     sql: ${TABLE}.date ;;
#   }

#   dimension: week {
#     type: date_week
#     group_label: "Date Periods"
#     sql: ${TABLE}.week ;;
#   }

#   dimension: month {
#     type: date_month
#     group_label: "Date Periods"
#     sql: ${TABLE}.month ;;
#   }

#   dimension: impressions {
#     type: number
#     hidden: yes
#     sql: ${TABLE}.total_impressions ;;
#   }

#   dimension: clicks {
#     type: number
#     hidden: yes
#     sql: ${TABLE}.total_clicks ;;
#   }

#   dimension: views {
#     type: number
#     hidden: yes
#     sql: ${TABLE}.total_views ;;
#   }

#   dimension: completes {
#     type: number
#     hidden: yes
#     sql: ${TABLE}.total_completes ;;
#   }

#   dimension: cost {
#     type: number
#     hidden: yes
#     sql:  ${TABLE}.total_cost ;;
#     value_format_name: usd
#   }

#   dimension: sessions {
#     type: number
#     hidden: yes
#     sql: ${TABLE}.total_sessions ;;
#   }

#   dimension: session_duration {
#     type: number
#     hidden: yes
#     sql: ${TABLE}.total_session_duration ;;
#   }

# ### All measures go below ###

#   measure: total_impressions {
#     type: sum_distinct
#     label: "Impressions"
#     sql_distinct_key: ${primary_key} ;;
#     sql: ${impressions} ;;
#   }

#   measure: total_clicks {
#     type: sum_distinct
#     label: "Clicks"
#     sql_distinct_key: ${primary_key} ;;
#     sql: ${clicks} ;;
#   }

#   measure: click_through_rate {
#     type: number
#     label: "CTR"
#     sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
#     value_format_name: percent_2
#   }

#   measure: total_views {
#     type: sum_distinct
#     label: "Video Views"
#     sql_distinct_key: ${primary_key} ;;
#     sql: ${views} ;;
#   }

#   measure: total_completes {
#     type: sum_distinct
#     label: "Video Completes"
#     sql_distinct_key: ${primary_key} ;;
#     sql: ${completes} ;;
#     value_format_name: decimal_0
#   }

#   measure: total_cost {
#     type: sum_distinct
#     label: "Media Spend"
#     sql_distinct_key: ${primary_key} ;;
#     value_format_name: usd
#     sql: ${cost} ;;
#   }

#   measure: video_impressions {
#     type: sum_distinct
#     hidden: yes
#     sql_distinct_key: ${primary_key} ;;
#     sql:
#       case
#         when ${views} > 0 then ${impressions}
#         else null
#         end
#         ;;
#   }

#   measure: view_rate {
#     type: number
#     label: "View Rate"
#     sql: 1.0*${total_views}/nullif(${video_impressions}, 0) ;;
#     value_format_name: percent_2
#   }

#   measure: completion_rate {
#     type: number
#     label: "Completion Rate"
#     sql: 1.0*${total_completes}/nullif(${video_impressions}, 0) ;;
#     value_format_name: percent_2
#   }

#   measure: cost_per_thousand {
#     type: number
#     label: "CPM"
#     value_format_name: usd
#     sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
#   }

#   measure: cost_per_click {
#     type: number
#     label: "CPC"
#     value_format_name: usd
#     sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
#   }

#   measure: video_cost {
#     type: sum_distinct
#     hidden: yes
#     sql_distinct_key: ${primary_key} ;;
#     sql:
#       case
#         when ${views} > 0 then ${cost}
#         else null
#         end
#         ;;
#   }

#   measure: cost_per_view {
#     type: number
#     label: "CPV"
#     value_format_name: usd
#     sql: ${video_cost}/nullif(${total_views}, 0) ;;
#   }

#   measure: cost_per_complete {
#     type: number
#     label: "CPcV"
#     value_format_name: usd
#     sql: ${video_cost}/nullif(${total_completes}, 0) ;;
#   }

#   measure: total_sessions {
#     type: sum_distinct
#     label: "Sessions"
#     sql_distinct_key: ${primary_key} ;;
#     sql: ${sessions} ;;
#   }

#   measure: cost_per_session {
#     type: number
#     label: "CPS"
#     value_format_name: usd
#     sql: ${total_cost}/nullif(${total_sessions}, 0) ;;
#   }

#   measure: total_session_duration {
#     type: sum_distinct
#     hidden: yes
#     sql_distinct_key: ${primary_key} ;;
#     sql: ${session_duration} ;;
#   }

#   measure: avg_session_duration {
#     label: "Avg. TOS"
#     type: number
#     sql: (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400 ;;
#     value_format: "m:ss"
#   }
# }
