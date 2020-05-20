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
    sql: ${sdt_dcm_ga_view.placement} ;;
  }

  dimension: publisher {
    type: string
    sql: ${sdt_dcm_ga_view.publisher} ;;
  }

  dimension: creative_name {
    type: string
    sql: ${sdt_dcm_ga_view.ad} ;;
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

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
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
    sql: ${cost} ;;
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

  measure: total_video_completions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${video_completions} ;;
  }

  measure: total_video_views {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${video_views} ;;
  }

  measure: cost_per_view {
    type: number
    label: "CPV"
    sql: ${total_cost}/nullif(${total_video_views}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_complete {
    type: number
    label: "CPcV"
    sql: ${total_cost}/nullif(${total_video_completions}, 0) ;;
    value_format_name: usd
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
