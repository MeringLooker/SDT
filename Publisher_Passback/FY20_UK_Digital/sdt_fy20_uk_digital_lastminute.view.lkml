view: sdt_fy20_uk_digital_lastminute {
  sql_table_name: public.sdt_fy20_uk_digital_lastminute ;;
  drill_fields: [id]

#### Primary Key ####

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: passback_join { ## placement ID + date ALWAYS ##
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

  dimension: ad_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ad_id ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: content_views {
    type: number
    hidden: yes
    sql: ${TABLE}.content_views ;;
  }

  dimension: dwell_time {
    type: number
    hidden: yes
    sql: ${TABLE}.total_dwell_time ;;
  }

  dimension: media_spend {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: video_views {
    type: number
    hidden: yes
    sql: '0' ;;
  }

  #### Measures ###

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
    sql: ${media_spend} ;;
    value_format_name: usd
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

  measure: total_video_views {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${video_views} ;;
    value_format_name: usd
  }

  measure: total_content_views {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${content_views} ;;
  }

  measure: total_dwell_time {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${dwell_time} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
