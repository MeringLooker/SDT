view: sdt_ga_events {
  sql_table_name: public.sdt_ga_events ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: __sampled {
    type: yesno
    sql: ${TABLE}.__sampled ;;
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

  dimension: adwordsadgroupid {
    type: number
    value_format_name: id
    sql: ${TABLE}.adwordsadgroupid ;;
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

  dimension: eventaction {
    type: string
    sql: ${TABLE}.eventaction ;;
  }

  dimension: eventcategory {
    type: string
    sql: ${TABLE}.eventcategory ;;
  }

  dimension: eventlabel {
    type: string
    sql: ${TABLE}.eventlabel ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: sourcemedium {
    type: string
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: totalevents {
    type: number
    sql: ${TABLE}.totalevents ;;
  }

  dimension: uniqueevents {
    type: number
    sql: ${TABLE}.uniqueevents ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
