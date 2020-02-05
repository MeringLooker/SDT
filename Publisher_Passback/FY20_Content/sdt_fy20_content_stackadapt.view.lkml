view: sdt_fy20_content_stackadapt {
  sql_table_name: public.sdt_fy20_content_stackadapt ;;
  drill_fields: [id]

### Primary Key ###

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: passback_join { ## ad ID + date ALWAYS ##
    type: string
    hidden: yes
    sql: ${ad_id}||'_'||${date_date} ;;
  }

######## Dimensions from DCM that join to this table #######

  dimension: placement {
    type: string
    sql: ${sdt_dcm_view.placement} ;;
  }

  dimension: publisher {
    type: string
    sql: ${sdt_dcm_view.publisher} ;;
  }

  dimension: creative_name {
    type: string
    sql: ${sdt_dcm_view.ad} ;;
  }

######## Dimensions native to passback file #######

  dimension_group: __senttime {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.__senttime ;;
  }

  dimension: __state {
    type: string
    hidden: yes
    sql: ${TABLE}.__state ;;
  }

  dimension_group: __updatetime {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: ad_id {
    type: string
#     hidden: yes
    sql: ${TABLE}.ad_id ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension_group: date {
    type: time
    group_label: "Date Periods"
    label: ""
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

  dimension: media_cost {
    type: number
    hidden: yes
    sql: ${TABLE}.media_cost ;;
  }

  dimension: video_complete {
    type: number
    hidden: yes
    sql: ${TABLE}.video_complete ;;
  }

  dimension: video_started {
    type: number
    hidden: yes
    sql: ${TABLE}.video_started ;;
  }

  dimension: view_to_25 {
    type: number
    hidden: yes
    sql: ${TABLE}.view_to_25 ;;
  }

  dimension: view_to_50 {
    type: number
    hidden: yes
    sql: ${TABLE}.view_to_50 ;;
  }

  dimension: view_to_75 {
    type: number
    hidden: yes
    sql: ${TABLE}.view_to_75 ;;
  }

  #### All Measures go below ####

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_cost {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${media_cost} ;;
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    sql: 1.0*${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_video_completes {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${video_complete} ;;
  }

  measure: total_video_started {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${video_started} ;;
  }

  measure: cost_per_view {
    type: number
    label: "CPV"
    sql: ${total_cost}/nullif(${total_video_started}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_complete {
    type: number
    label: "CPcV"
    sql: ${total_cost}/nullif(${total_video_completes}, 0) ;;
    value_format_name: usd
  }

  measure: total_view_to_25 {
    type: sum_distinct
    label: "Views to 25%"
    group_label: "Quartile Reporting"
    sql_distinct_key: ${id} ;;
    sql: ${view_to_25} ;;
  }

  measure: total_view_to_50 {
    type: sum_distinct
    label: "Views to 50%"
    group_label: "Quartile Reporting"
    sql_distinct_key: ${id} ;;
    sql: ${view_to_50} ;;
  }

  measure: total_view_to_75 {
    type: sum_distinct
    label: "Views to 75%"
    group_label: "Quartile Reporting"
    sql_distinct_key: ${id} ;;
    sql: ${view_to_75} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
