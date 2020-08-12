view: pdt_fy21_drivemarket_campaign {
  derived_table: {
    sql:
          select * from ${pdt_fy21_drivemarket_pin.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_drivemarket_fb.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_drivemarket_meredith.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_drivemarket_cn.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_drivemarket_abc.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_drivemarket_cbs.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_drivemarket_hulu.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_drivemarket_nbc.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_drivemarket_pandora.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_drivemarket_spotify.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_drivemarket_spotx.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_drivemarket_ta.SQL_TABLE_NAME}
            ;;
    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*1)/(60*60*24)) ;;
    distribution_style: all
  }

#### Primary Key Added ####

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${campaign}||'_'||${publisher}||'_'||${market}||'_'||${layer}||'_'||${region}||'_'||${placement}||'_'||${creative_name}||'_'||${date} ;;
  }

### All dimensions go below ###

  dimension: publisher {
    type: string
    sql: ${TABLE}.publisher ;;
  }

  dimension: campaign {
    type: string
    hidden: yes
    sql: ${TABLE}.campaign ;;
  }

  dimension: market {
    type: string
    hidden: yes
    sql: ${TABLE}.market ;;
  }

  dimension: layer {
    type: string
    sql: ${TABLE}.layer ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: placement {
    type: string
    label: "Campaign Placement"
    sql: ${TABLE}.placement ;;
  }

  dimension: creative_name {
    type: string
    sql: ${TABLE}.creative_name ;;
  }

  dimension: fiscal_year {
    type:  string
    group_label: "Date Periods"
    sql:
      CASE
      WHEN ${date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
      WHEN ${date} BETWEEN '2020-07-01' AND '2021-06-30' THEN 'FY 20/21'
      ELSE 'Uncategorized'
      END
    ;;
  }

  dimension: date {
    type: date
    group_label: "Date Periods"
    sql: ${TABLE}.date ;;
  }

  dimension: week {
    type: date_week
    group_label: "Date Periods"
    sql: ${TABLE}.week ;;
  }

  dimension: month {
    type: date_month
    group_label: "Date Periods"
    sql: ${TABLE}.month ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.total_clicks ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql:  ${TABLE}.total_cost ;;
    value_format_name: usd
  }

  dimension: completes {
    type: number
    hidden: yes
    sql: ${TABLE}.total_completes ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: ${TABLE}.total_views ;;
  }

  dimension: sessions {
    type: number
    hidden: yes
    sql: ${TABLE}.total_sessions ;;
  }

  dimension: session_duration {
    type: number
    hidden: yes
    sql: ${TABLE}.total_session_duration ;;
  }

### All measures go below ###

  measure: total_impressions {
    type: sum_distinct
    label: "Impressions"
    sql_distinct_key: ${primary_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    label: "Clicks"
    sql_distinct_key: ${primary_key} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views {
    type: sum_distinct
    label: "Video Views"
    sql_distinct_key: ${primary_key} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    label: "Video Completes"
    sql_distinct_key: ${primary_key} ;;
    sql: ${completes} ;;
    value_format_name: decimal_0
  }

  measure: total_cost {
    type: sum_distinct
    label: "Media Spend"
    sql_distinct_key: ${primary_key} ;;
    value_format_name: usd
    sql: ${cost} ;;
  }

  measure: video_impressions {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${primary_key} ;;
    sql:
      case
        when ${views} > 0 then ${impressions}
        else null
        end
        ;;
  }

  measure: view_rate {
    type: number
    label: "View Rate"
    sql: 1.0*${total_views}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: completion_rate {
    type: number
    label: "Completion Rate"
    sql: 1.0*${total_completes}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
  }

  measure: video_cost {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${primary_key} ;;
    sql:
      case
        when ${views} > 0 then ${cost}
        else null
        end
        ;;
  }

  measure: cost_per_view {
    type: number
    label: "CPV"
    value_format_name: usd
    sql: ${video_cost}/nullif(${total_views}, 0) ;;
  }

  measure: cost_per_complete {
    type: number
    label: "CPcV"
    value_format_name: usd
    sql: ${video_cost}/nullif(${total_completes}, 0) ;;
  }

  measure: total_sessions {
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${primary_key} ;;
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    type: number
    label: "CPS"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_sessions}, 0) ;;
  }

  measure: total_session_duration {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${primary_key} ;;
    sql: ${session_duration} ;;
  }

  measure: avg_session_duration {
    label: "Avg. TOS"
    type: number
    sql: (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400 ;;
    value_format: "m:ss"
  }
}
