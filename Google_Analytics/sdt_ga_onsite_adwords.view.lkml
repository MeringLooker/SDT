view: sdt_ga_onsite_adwords {
  sql_table_name: public.sdt_ga_onsite_adwords ;;

####### AdWords Join ID #######

  dimension: adwords_join_id {
    type: string
    hidden: yes
    sql: ${adwordsadgroupid}||'_'||${date_date} ;;
  }

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${sourcemedium}||'_'||${adwordsadgroupid}||'_'||${date_date} ;;
  }


  dimension: adwordsadgroupid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension_group: date {
    type: time
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

  dimension: newusers {
    type: number
    hidden: yes
    sql: ${TABLE}.newusers ;;
  }

  dimension: pageviews {
    type: number
    hidden: yes
    sql: ${TABLE}.pageviews ;;
  }

  dimension: sessionduration {
    type: number
    hidden: yes
    sql: ${TABLE}.sessionduration ;;
  }

  dimension: sessions {
    type: number
    hidden: yes
    sql: ${TABLE}.sessions ;;
  }

  dimension: sourcemedium {
    type: string
    hidden: yes
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }
  ######### All measures go below #########

  measure: total_sessions {
    label: "Sessions"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${sessions} ;;
  }

  measure: total_session_duration {
    label: "Total Time on Site"
    hidden: yes
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${sessionduration} ;;
  }

  measure: avg_time_on_site {
    label: "Avg. TOS"
    description: "Average Length of a User's session"
    type: number
    sql: (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400;;
    value_format: "m:ss"
  }

  measure: total_users {
    label: "Users"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${users} ;;
  }

  measure: new_users {
    label: "New Users"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${newusers} ;;
  }

  measure: percent_new_users {
    label: "% New Users"
    type: number
    sql: ${new_users}/nullif(${total_users}, 0) ;;
    value_format_name: percent_0
  }

  measure: total_pageviews {
    label: "Pageviews"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
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
    sql_distinct_key: ${primary_key} ;;
    sql: ${bounces} ;;
  }

  measure: bounce_rate {
    label: "Bounce Rate"
    type: number
    sql: ${total_bounces}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_0
  }

  measure: count {
    type: count
  }
}
