view: sdt_pinterest {
  sql_table_name: public.sdt_pinterest ;;

  #### Primary Key ####

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

### GA Join Key ###


#### Dimensions Added to this table via LookML ####


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

  dimension: ad_group_id {
    type: string
    group_label: "Pinterest IDs"
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_group_name {
    type: string
    group_label: "Pinterest Dimensions"
    sql: ${TABLE}.ad_group_name ;;
  }

  dimension: campaign_id {
    type: string
    group_label: "Pinterest IDs"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    group_label: "Pinterest Dimensions"
    sql: ${TABLE}.campaign_name ;;
  }

  dimension_group: date {
    type: time
    label: ""
    group_label: "Date Periods"
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

  dimension: pin_description {
    type: string
    group_label: "Pinterest Dimensions"
    sql: ${TABLE}.pin_description ;;
  }

  dimension: pin_id {
    type: string
    group_label: "Pinterest IDs"
    sql: ${TABLE}.pin_id ;;
  }

  dimension: promoted_pin_id {
    type: string
    group_label: "Pinterest IDs"
    sql: ${TABLE}.promoted_pin_id ;;
  }

  dimension: promoted_pin_name {
    type: string
    group_label: "Pinterest Dimensions"
    sql: ${TABLE}.promoted_pin_name ;;
  }

  dimension: spend {
    type: number
    hidden: yes
    sql: ${TABLE}.spend ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.total_clicks ;;
  }

  dimension: conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.total_conversions ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: saves {
    type: number
    hidden: yes
    sql: ${TABLE}.total_saves ;;
  }

  dimension: video_starts {
    type: number
    hidden: yes
    sql: ${TABLE}.total_video_starts ;;
  }

  dimension: video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.total_video_views ;;
  }

  dimension: views_at_100 {
    type: number
    hidden: yes
    sql: ${TABLE}.total_views_at_100 ;;
  }

  dimension: views_at_25 {
    type: number
    hidden: yes
    sql: ${TABLE}.total_views_at_25 ;;
  }

  dimension: views_at_50 {
    type: number
    hidden: yes
    sql: ${TABLE}.total_views_at_50 ;;
  }

  dimension: views_at_75 {
    type: number
    hidden: yes
    sql: ${TABLE}.total_views_at_75 ;;
  }

  dimension: views_at_95 {
    type: number
    hidden: yes
    sql: ${TABLE}.total_views_at_95 ;;
  }

### All measures go below ###

  measure: total_spend {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${spend} ;;
  }

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

  measure: click_through_rate  {
    label: "CTR"
    type: number
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    label: "CPC"
    type: number
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand  {
    label: "CPM"
    type: number
    sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_conversions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${conversions} ;;
  }

  measure: total_saves {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${saves} ;;
  }

  measure: total_video_starts {
    type: sum_distinct
    group_label: "Video Metrics"
    sql_distinct_key: ${id} ;;
    sql: ${video_starts} ;;
  }

  measure: total_video_views {
    type: sum_distinct
    group_label: "Video Metrics"
    sql_distinct_key: ${id} ;;
    sql: ${video_views} ;;
  }

  measure: total_views_at_100 {
    type: sum_distinct
    group_label: "Video Metrics"
    sql_distinct_key: ${id} ;;
    sql: ${views_at_100} ;;
  }

  measure: total_views_at_25 {
    type: sum_distinct
    group_label: "Video Metrics"
    sql_distinct_key: ${id} ;;
    sql: ${views_at_25} ;;
  }

  measure: total_views_at_50 {
    type: sum_distinct
    group_label: "Video Metrics"
    sql_distinct_key: ${id} ;;
    sql: ${views_at_50} ;;
  }

  measure: total_views_at_75 {
    type: sum_distinct
    group_label: "Video Metrics"
    sql_distinct_key: ${id} ;;
    sql: ${views_at_75} ;;
  }

  measure: total_views_at_95 {
    type: sum_distinct
    group_label: "Video Metrics"
    sql_distinct_key: ${id} ;;
    sql: ${views_at_95} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, ad_group_name, campaign_name, promoted_pin_name]
  }
}
