# view: ndt_uk_pullthrough_campaign {
#   derived_table: {
#     sql:
#         select * from ${ndt_uk_pullthrough_expedia.SQL_TABLE_NAME}
#             ;;
#     sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*1)/(60*60*24)) ;;
#     distribution_style: all
#   }

# #### Primary Key Added ####

#   dimension: primary_key {
#     type: string
#     hidden: yes
#     primary_key: yes
#     sql: ${campaign}||'_'||${publisher}||'_'||${market}||'_'||${layer}||'_'||${placement}||'_'||${ad_size}||'_'||${date} ;;
#   }

# ### All dimensions go below ###

#   dimension: publisher {
#     type: string
#     drill_fields: [date,placement,ad_size]
#     sql: ${TABLE}.publisher ;;
#   }

#   dimension: campaign {
#     type: string
#     hidden: yes
#     sql: ${TABLE}.campaign ;;
#   }

#   dimension: market {
#     type: string
#     hidden: yes
#     drill_fields: [publisher,layer,date]
#     sql: ${TABLE}.market ;;
#   }

#   dimension: layer {
#     type: string
#     hidden: yes
#     drill_fields: [publisher,date]
#     sql: ${TABLE}.layer ;;
#   }

#   dimension: placement {
#     type: string
#     drill_fields: [ad_size,date]
#     sql: ${TABLE}.placement ;;
#   }

#   dimension: ad_size {
#     type: string
#     drill_fields: [date]
#     sql: ${TABLE}.ad_size ;;
#   }

#   dimension: fiscal_year {
#     type:  string
#     group_label: "Date Periods"
#     sql:
#       CASE
#       WHEN ${date} BETWEEN '2013-07-01' AND '2014-06-30' THEN 'FY 13/14'
#       WHEN ${date} BETWEEN '2014-07-01' AND '2015-06-30' THEN 'FY 14/15'
#       WHEN ${date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
#       WHEN ${date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
#       WHEN ${date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
#       WHEN ${date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
#       WHEN ${date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
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

#   dimension: quarter {
#     type: date_quarter
#     group_label: "Date Periods"
#     sql: ${TABLE}.quarter ;;
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
#     sql_distinct_key: ${primary_key} ;;
#     sql: ${impressions} ;;
#   }

#   measure: total_clicks {
#     type: sum_distinct
#     sql_distinct_key: ${primary_key} ;;
#     sql: ${clicks} ;;
#   }

#   measure: click_through_rate {
#     type: number
#     label: "CTR"
#     sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
#     value_format_name: percent_2
#   }

#   measure: total_cost {
#     type: sum_distinct
#     sql_distinct_key: ${primary_key} ;;
#     value_format_name: usd
#     sql: ${cost} ;;
#   }

#   measure: cost_per_click {
#     type: number
#     label: "CPC"
#     value_format_name: usd
#     sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
#   }

#   measure: cost_per_thousand {
#     type: number
#     label: "CPM"
#     value_format_name: usd
#     sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
#   }

#   measure: total_sessions {
#     type: sum_distinct
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
#     sql_distinct_key: ${primary_key} ;;
#     sql: ${session_duration} ;;
#     hidden: yes
#   }

#   measure: avg_session_duration {
#     label: "Avg. TOS"
#     type: number
#     sql: (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400 ;;
#     value_format: "m:ss"
#   }

# }
