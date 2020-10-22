view: sojern_pt_test_view {
  sql_table_name: public.sojern_pt_test_view ;;

  dimension: clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension_group: date {
    hidden: no
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

  dimension: dcm_join_id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.dcm_join_id ;;
  }

  dimension: impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: placement {
    hidden: no
    type: string
    sql: ${TABLE}.placement ;;
  }

  measure: total_impressions {
    label: "1P Impressions"
    type: sum_distinct
    sql_distinct_key: ${dcm_join_id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    label: "1P Clicks"
    type: sum_distinct
    sql_distinct_key: ${dcm_join_id} ;;
    sql: ${clicks} ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
