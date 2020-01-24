view: sdt_ga_userinfo {
  sql_table_name: public.sdt_ga_userinfo ;;
  drill_fields: [id]

 ######## Primary Key ########

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

######### Join Id ##########

  dimension: join_id {
    hidden: yes
    type: string
    sql: ${keyword}||'_'||${date_date} ;;
  }

####### AdWords Join ID #######

  dimension: adwords_join_id {
    hidden: yes
    type: string
    sql: ${adwordsadgroupid}||'_'||${devicecategory}||'_'||${date_date} ;;
  }

####### All Dimensions go Below #######

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

  dimension: bounces {
    type: number
    sql: ${TABLE}.bounces ;;
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

  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
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

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  dimension: usertype {
    type: string
    sql: ${TABLE}.usertype ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

######### All measures go below #########

  measure: total_sessions {
    label: "Sessions"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${sessions} ;;
  }

  measure: total_session_duration {
    label: "Total Time on Site"
    hidden: yes
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${sessionduration} ;;
  }

  measure: avg_time_on_site {
    label: "Avg. TOS - Unformatted"
    hidden: yes
    description: "Average Length of a User's session"
    type: number
    sql: ${total_session_duration}/nullif(${total_sessions}, 0);;
    value_format: "0.##"
  }

  measure: formatted_tos {
    label: "Avg. TOS"
    type: number
    sql:  ${avg_time_on_site}::float/86400 ;;
    value_format: "m:ss"
  }

  measure: total_users {
    label: "Users"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${users} ;;
  }

#   measure: new_users {
#     label: "New Users"
#     type: sum_distinct
#     sql_distinct_key: ${id} ;;
#     sql: ${newusers} ;;
#   }

#   measure: percent_new_users {
#     label: "% New Users"
#     type: number
#     sql: ${new_users}/nullif(${total_users}, 0) ;;
#     value_format_name: percent_0
#   }

  measure: total_pageviews {
    label: "Pageviews"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${pageviews} ;;
  }

  measure: pages_per_session {
    label: "Pgs/Session"
    type: number
    sql: ${total_pageviews}/nullif(${total_sessions}, 0) ;;
    value_format: "#.0"
  }

  measure: total_bounces {
    label: "Bounces"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${bounces} ;;
  }

  measure: bounce_rate {
    label: "Bounce Rate"
    type: number
    sql: ${total_bounces}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_0
  }

}
