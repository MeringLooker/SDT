view: sdt_fy21_2h_pt_dcm_view {
  sql_table_name: public.sdt_fy21_2h_pt_dcm_view ;;

#### Primary Key ####

  dimension: dcm_join_id {
    type: string
    hidden: yes
    primary_key:  yes
    sql: ${TABLE}.dcm_join_id ;;
  }

  dimension: ad_id {
    type: number
    sql: ${TABLE}.ad_id ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: video_completions {
    type: number
    hidden: yes
    sql: ${TABLE}.video_completions ;;
  }

  dimension: video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.video_views ;;
  }

  #### Mesures go below ####

  measure: total_impressions {
    label: "Total Impressions"
    type: sum_distinct
    sql_distinct_key: ${dcm_join_id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    label: "Total Clicks"
    type: sum_distinct
    sql_distinct_key: ${dcm_join_id} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    label: "CTR"
    type: number
    value_format_name: percent_2
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
  }

  measure: total_cost {
    label: "Total Media Cost"
    type: sum_distinct
    sql_distinct_key: ${dcm_join_id} ;;
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: total_views {
    label: "Total Video Views"
    type: sum_distinct
    sql_distinct_key: ${dcm_join_id} ;;
    sql: ${video_views} ;;
  }

  measure: total_completes {
    label: "Total Video Completes"
    type: sum_distinct
    sql_distinct_key: ${dcm_join_id} ;;
    sql: ${video_completions} ;;
  }

  measure: view_rate {
    label: "View Rate"
    type: number
    value_format_name: percent_0
    sql: ${total_views}/nullif(${total_impressions}, 0) ;;
  }

  measure: completion_rate {
    label: "Completion Rate"
    type: number
    value_format_name: percent_0
    sql: ${total_completes}/nullif(${total_impressions}, 0) ;;
  }

  measure: cost_per_view {
    label: "Cost per View"
    type: number
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_completes}, 0) ;;
  }

  measure: cost_per_thousand {
    label: "CPM"
    type: number
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
