view: sdt_fy20_us_pullthrough_adroll {
  sql_table_name: public.sdt_fy20_us_pullthrough_adroll ;;
  drill_fields: [id]

### Primary Key ###

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: passback_join { ## date + the keyword field in GA
    type: string
    hidden: yes
    sql: ${adgroup}||'_'||${day_date} ;;
  }

### Added Client dimensions for this file ###

  dimension: publisher {
    type: string
    sql: 'AdRoll' ;;
  }

  dimension: sdt_campaign {
    type: string
    sql: 'US Pull-Through' ;;
  }

  dimension: sdt_market {
    type: string
    sql: 'United States' ;;
  }

  dimension: sdt_layer {
    type: string
    sql:
      case
        when ${adgroup} = 'Competitive Conquesting_Audience' then 'Competitive Conquest'
        when ${adgroup} = 'Disneyland_Audience' then 'Disneyland'
        when ${adgroup} = 'Los Angeles_Audience' then 'Los Angeles'
        when ${adgroup} = 'Pull-Through Audience' then 'Pull-Through Base'
        end;;
  }

### Dimensions native to this table ###

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

  dimension: adgroup {
    type: string
    sql: ${TABLE}.adgroup ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension_group: day {
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
    sql: ${TABLE}.day ;;
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

  ### Measures ###

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

  measure: total_cost {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${media_cost} ;;
    value_format_name: usd
  }

  measure: ga_sessions {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${sdt_ga_onsite.id};;
    sql: ${sdt_ga_onsite.sessions} ;;
  }

  measure: ga_total_session_duration {
    group_label: "GA Reporting"
    type: sum_distinct
    sql_distinct_key: ${sdt_ga_onsite.id};;
    label: "Total Session Duration"
    sql: ${sdt_ga_onsite.sessionduration} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
