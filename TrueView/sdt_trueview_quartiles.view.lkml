view: sdt_trueview_quartiles {
  sql_table_name: public.sdt_trueview_quartiles ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: trueview_join {
    type: string
    sql: ${ad_group_id}||'_'||${date_date} ;;
  }

  dimension_group: __senttime {
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
    sql: ${TABLE}.__senttime ;;
  }

  dimension: __state {
    type: string
    sql: ${TABLE}.__state ;;
  }

  dimension_group: __updatetime {
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
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
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

  dimension: trueview_join_id {
    type: string
    sql: ${TABLE}.trueview_join_id ;;
  }

  dimension: video_played_to_100 {
    type: number
    sql: ${TABLE}.video_played_to_100 ;;
  }

  dimension: video_played_to_25 {
    type: number
    sql: ${TABLE}.video_played_to_25 ;;
  }

  dimension: video_played_to_50 {
    type: number
    sql: ${TABLE}.video_played_to_50 ;;
  }

  dimension: video_played_to_75 {
    type: number
    sql: ${TABLE}.video_played_to_75 ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
