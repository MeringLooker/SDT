view: sdt_fy20_us_pullthrough_adroll {
  sql_table_name: public.sdt_fy20_us_pullthrough_adroll ;;
  drill_fields: [id]

### Primary Key ###

  dimension: id {
    primary_key: yes
    hidden: yes
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
    group_label: "Client Dimensions"
    label: "Campaign Name"
    sql: 'US Pull-Through' ;;
  }

  dimension: sdt_market {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql: 'United States' ;;
  }

  dimension: sdt_layer {
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql:
      case
        when ${adgroup} = 'Competitive Conquesting_Audience' then 'Retargeting'
        when ${adgroup} = 'Disneyland_Audience' then 'Retargeting'
        when ${adgroup} = 'Los Angeles_Audience' then 'Retargeting'
        when ${adgroup} = 'Pull-Through Audience' then 'Retargeting'
        end;;
  }

  dimension: sdt_placement {
    type: string
    label: "Placement Name"
    group_label: "Client Dimensions"
    sql:
      case
        when ${adgroup} = 'Competitive Conquesting_Audience' then 'Social Retargeting - Competitive Conquesting'
        when ${adgroup} = 'Disneyland_Audience' then 'Social Retargeting - Disneyland'
        when ${adgroup} = 'Los Angeles_Audience' then 'Social Retargeting - Los Angeles'
        when ${adgroup} = 'Pull-Through Audience' then 'Social Retargeting - PT Base'
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
    label: "AdRoll Ad Group"
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

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_cost {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${media_cost} ;;
    value_format_name: usd
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    sql: 1.0*${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: ga_sessions {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${sdt_ga_onsite.id};;
    sql: ${sdt_ga_onsite.sessions} ;;
  }

  measure: cost_per_session {
    group_label: "GA Reporting"
    type: number
    label: "CPS"
    sql: ${total_cost}/nullif(${ga_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: ga_total_session_duration {
    group_label: "GA Reporting"
    hidden: yes
    type: sum_distinct
    sql_distinct_key: ${sdt_ga_onsite.id};;
    label: "Total Session Duration"
    sql: ${sdt_ga_onsite.sessionduration} ;;
  }

  measure: ga_avg_session_duration {
    type: number
    label: "Avg. TOS"
    group_label: "GA Reporting"
    sql: (${ga_total_session_duration}/nullif(${ga_sessions}, 0))::float/86400 ;;
    value_format: "m:ss"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
