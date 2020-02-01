view: sdt_fy20_digital_video_amobee {
  sql_table_name: public.sdt_fy20_digital_video_amobee ;;
  drill_fields: [id]

### Primary Key ###

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: passback_join { ## placement ID + date ALWAYS ##
    type: string
#     hidden: yes
    sql: ${placement_id}||'_'||${date_date} ;;
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
    sql: ${sdt_dcm_view.creative} ;;
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

  dimension: placement_id {
    type: number
    label: "Placement ID"
    sql: ${TABLE}.placement_id ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.publisher_clicks ;;
  }

  dimension: media_cost {
    type: number
    hidden: yes
    sql: ${TABLE}.publisher_cost ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.publisher_impressions ;;
  }

  dimension: video_completes {
    type: number
    hidden: yes
    sql: ${TABLE}.publisher_video_completions ;;
  }

  dimension: video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.publisher_video_views ;;
  }

###### All Measures go below ######

  measure: total_impressions {
    label: "Total Impressions"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    label: "Total Clicks"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    label: "CTR"
    type: number
    value_format_name: percent_2
    sql: ${clicks}/nullif(${impressions}, 0) ;;
  }

  measure: total_media_cost {
    label: "Total Media Cost"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${media_cost} ;;
    value_format_name: usd
  }

  measure: total_video_views {
    label: "Total Video Views"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${video_views} ;;
  }

  measure: total_video_completes {
    label: "Total Video Completes"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${video_completes} ;;
  }

  measure: view_rate {
    label: "View Rate"
    type: number
    value_format_name: percent_0
    sql: ${total_video_views}/nullif(${total_impressions}, 0) ;;
  }

  measure: completion_rate {
    label: "Completion Rate"
    type: number
    value_format_name: percent_0
    sql: ${total_video_completes}/nullif(${total_impressions}, 0) ;;
  }

  measure: cost_per_view {
    label: "Cost per View"
    type: number
    value_format_name: usd
    sql: ${total_media_cost}/nullif(${total_video_completes}, 0) ;;
  }

  measure: cost_per_thousand {
    label: "CPM"
    type: number
    value_format_name: usd
    sql: ${total_media_cost}/nullif(${total_impressions}/1000, 0) ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
