view: sdt_mc_ga_view {
  sql_table_name: public.sdt_mc_ga_view ;;
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

  dimension: adcontent {
    type: string
    sql: ${TABLE}.adcontent ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: comp_key {
    type: string
    sql: ${TABLE}.comp_key ;;
  }

  dimension: comp_key_backup {
    type: string
    sql: ${TABLE}.comp_key_backup ;;
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

  dimension: devicecategory {
    type: string
    sql: ${TABLE}.devicecategory ;;
  }

  dimension: keyword {
    type: string
    sql: ${TABLE}.keyword ;;
  }

  dimension: newusers {
    type: number
    sql: ${TABLE}.newusers ;;
  }

  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: region {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.region ;;
  }

  dimension: sessionduration {
    type: number
    sql: ${TABLE}.sessionduration ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
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

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  measure: total_sessions {
    label: "Sessions"
    type: sum
    sql: ${sessions} ;;
  }

  measure: total_session_duration {
    label: "Total Time on Site"
    hidden: yes
    type: sum
    sql: ${sessionduration} ;;
  }

  measure: avg_time_on_site {
    label: "Avg. TOS"
    description: "Average Length of a User's session"
    type: number
    sql: ${total_session_duration}/nullif(${total_sessions}, 0);;
    value_format: "0.##"
  }

  measure: total_users {
    label: "Users"
    type: sum
    sql: ${users} ;;
  }

  measure: new_users {
    label: "New Users"
    type: sum
    sql: ${newusers} ;;
  }

  measure: percent_new_users {
    label: "% New Users"
    type: number
    sql: ${new_users}/nullif(${total_users}, 0) ;;
    value_format_name: percent_0
  }


  measure: count {
    type: count
    drill_fields: [id]
  }
}
