view: sdt_fy20_ta_us_hub_traffic_drivers {
  sql_table_name: public.sdt_fy20_ta_us_hub_traffic_drivers ;;
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
    hidden: yes
    sql: ${ad_id}||'_'||${date_date} ;;
  }

######## Dimensions from DCM that join to this table #######

  dimension: placement {
    type: string
    group_label: "DCM Dimensions"
    sql: ${sdt_dcm_ga_view.placement} ;;
  }

  dimension: sdt_placement {
    type: string
    group_label: "Client Dimensions"
    label: "Placement Name"
    sql: ${sdt_dcm_ga_view.sdt_placement} ;;
  }

  dimension: sdt_pillar {
    type: string
    group_label: "Client Dimensions"
    label: "Pillar"
    sql: ${sdt_dcm_ga_view.sdt_pillar} ;;
  }

  dimension: ad {
    type: string
    group_label: "DCM Dimensions"
    sql: ${sdt_dcm_ga_view.ad} ;;
  }

  dimension: publisher {
    type: string
    group_label: "DCM Dimensions"
    sql: 'TripAdvisor' ;;
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
    type: number
    group_label: "DCM Dimensions"
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

  dimension: views {
    type: number
    hidden: yes
    sql: 0 ;;
  }

  dimension: completes {
    type: number
    hidden: yes
    sql: 0 ;;
  }

### All measures go below ###

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

  measure: total_views {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${completes} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
