view: sdt_fy21_pt_2h_adara_offline {
  sql_table_name: public.sdt_fy21_pt_2h_adara_offline ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: publisher {
    type: string
    group_label: "Client Dimensions"
    sql: 'Adara' ;;
  }

  dimension: sdt_market {
    type: string
    label: "Market"
    group_label: "Client Dimensions"
    sql: 'United States' ;;
  }

  dimension: sdt_campaign {
    type: string
    label: "Campaign"
    group_label: "Client Dimensions"
    sql: 'US Pull-Through' ;;
  }

  dimension: sdt_layer {
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql: 'Intent' ;;
  }

  dimension: ad_size {
    type: string
    sql: ${TABLE}.ad_size ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: creative_name {
    type: string
    sql: ${TABLE}.creative_name ;;
  }

  dimension: omni_ad_name {
    type: string
    sql: ${TABLE}.creative_name ;;
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
    sql: ${TABLE}.impressions ;;
  }

  dimension: placement_name {
    type: string
    sql: ${TABLE}.placement_name ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: session_duration {
    type: number
    sql: ${TABLE}.session_duration ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  ## Measures Below ##

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Clicks"
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Cost"
    sql: ${cost} ;;
  }

  measure: total_views {
    type: sum
    label: "Views"
    sql: 0 ;;
  }

  measure: total_completes {
    type: sum
    label: "Completes"
    sql: 0 ;;
  }

  measure: total_sessions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Sessions"
    sql: ${sessions} ;;
  }

  measure: total_session_duration {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Session Duration"
    sql: ${session_duration} ;;
  }

  # measure: count {
  #   type: count
  #   drill_fields: [id, placement_name, creative_name]
  # }
}
