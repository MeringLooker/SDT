view: sdt_fy20_uk_digital_exponential {
  sql_table_name: public.sdt_fy20_uk_digital_exponential ;;
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

### Dimensions native to this table ###

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

  dimension: engagements {
    type: number
    hidden: yes
    sql: ${TABLE}.engagements ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: media_spend {
    type: number
    hidden: yes
    sql: ${TABLE}.media_spend ;;
  }

  dimension: placement_id {
    type: number
    hidden: yes
    sql: ${TABLE}.placement_id ;;
  }

  dimension: video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.video_views ;;
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
  }

  measure: cost_per_view {
    type: number
    label: "CPV"
    sql: ${total_cost}/nullif(${total_video_views}, 0) ;;
    value_format_name: usd
  }

  measure: total_engagements {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${engagements} ;;
  }

  measure: post_engagement_click_through_rate {
    type: number
    label: "Post-Engagement CTR"
    sql: 1.0*${total_clicks}/nullif(${total_engagements}, 0) ;;
    value_format_name: percent_2
  }

  measure: viewable_engagement_click_through_rate {
    type: number
    label: "Viewable Engagement CTR"
    sql: 1.0*${total_engagements}/nullif(${total_video_views}, 0) ;;
    value_format_name: percent_2
  }

  measure: view_rate {
    type: number
    label: "View Rate"
    sql: 1.0*${total_video_views}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
