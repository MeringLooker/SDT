view: gdn_ga_test {
  sql_table_name: public.gdn_ga_test ;;

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: comp_key {
    type: string
    sql: ${TABLE}.comp_key ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: day {
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
    sql: ${TABLE}.day ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: total_conv_value {
    type: number
    sql: ${TABLE}.total_conv_value ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
