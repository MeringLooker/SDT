view: sdt_fy20_ta_uk_outstream_video_banners {
  sql_table_name: public.sdt_fy20_ta_uk_outstream_video_banners ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: ad_id {
    type: number
    sql: ${TABLE}.ad_id ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: complete {
    type: number
    sql: ${TABLE}.complete ;;
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

  dimension: engagements {
    type: number
    sql: ${TABLE}.engagements ;;
  }

  dimension: first_quartile {
    type: number
    sql: ${TABLE}.first_quartile ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: media_cost {
    type: number
    sql: ${TABLE}.media_cost ;;
  }

  dimension: mid_point {
    type: number
    sql: ${TABLE}.mid_point ;;
  }

  dimension: third_quartile {
    type: number
    sql: ${TABLE}.third_quartile ;;
  }

  dimension: video_starts {
    type: number
    sql: ${TABLE}.video_starts ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
