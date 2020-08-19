view: sdt_ga_events_view {
  sql_table_name: public.sdt_ga_events_view ;;

## Primary Key ##

  dimension: events_join_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.events_join_id ;;
  }

  ## Dimensions joined from Ad Sources Derived Tables Lookup ##

  dimension: publisher {
    type: string
    group_label: "Paid Traffic Info"
    sql: ${sdt_ga_campaigns_lookup.publisher};;
  }

  dimension: campaign {
    type: string
    group_label: "Paid Traffic Info"
    sql: ${sdt_ga_campaigns_lookup.campaign};;
  }

#
#   ## Dimensions added to this Table ##
#
#   dimension: traffic_type {
#     type: string
#     hidden: no
#     group_label: "Google Analytics Dimensions"
#     description: "This is determined by the medium of traffic. Includes campaign, cpc and ppc traffic."
#     sql:
#       case
#         when ${sourcemedium} ilike '%campaign%' then 'Paid'
#         when ${sourcemedium} ilike '%cpc%' then 'Paid'
#         when ${sourcemedium} ilike '%ppc%' then 'Paid'
#
#         else 'Not Paid'
#         end
#         ;;
#   }
#
#   dimension: is_paid_traffic {
#     type: yesno
#     group_label: "Paid Traffic Info"
#     description: "This is determined by the medium of traffic. Includes campaign, cpc and ppc traffic."
#     sql: ${traffic_type} = 'Paid' ;;
#   }

  ## Dimensions Native to this Table ##

  dimension: acq_join_id {
    type: string
    hidden: yes
    sql: ${TABLE}.acq_join_id ;;
  }

  dimension: adwords_join_id {
    type: string
    hidden: yes
    sql: ${TABLE}.adwords_join_id ;;
  }

  dimension: adwordsadgroupid {
    type: string
    hidden: yes
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension_group: date {
    label: ""
    group_label: "Date Periods"
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      day_of_month,
      month_name,
      month_num,
      week_of_year,
      day_of_year,
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: devicecategory {
    type: string
    group_label: "Google Analytics Dimensions"
    label: "Device Category"
    sql: ${TABLE}.devicecategory ;;
  }

  dimension: discover_sd {
    type: number
    hidden: yes
    sql: ${TABLE}.discover_sd ;;
  }

  dimension: eventaction {
    type: string
    group_label: "Google Analytics Dimensions"
    label: "Event Action"
    sql: ${TABLE}.eventaction ;;
  }

  dimension: eventcategory {
    type: string
    group_label: "Google Analytics Dimensions"
    label: "Event Category"
    sql: ${TABLE}.eventcategory ;;
  }

  dimension: events {
    type: number
    hidden: yes
    sql: ${TABLE}.events ;;
  }

  dimension: hotel_search {
    type: number
    hidden: yes
    sql: ${TABLE}.hotel_search ;;
  }

  dimension: keyword {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.keyword ;;
  }

  dimension: keyword_join_id {
    type: string
    hidden: yes
    sql: ${TABLE}.keyword_join_id ;;
  }

  dimension: medium {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.medium ;;
  }

  dimension: plan_your_adventure {
    type: number
    hidden: yes
    sql: ${TABLE}.plan_your_adventure ;;
  }

  dimension: plan_your_vacation {
    type: number
    hidden: yes
    sql: ${TABLE}.plan_your_vacation ;;
  }

  dimension: purchases {
    type: number
    hidden: yes
    sql: ${TABLE}.purchases ;;
  }

  dimension: source {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.source ;;
  }

  dimension: sourcemedium {
    type: string
    group_label: "Google Analytics Dimensions"
    label: "Source / Medium"
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: staying_in_touch {
    type: number
    hidden: yes
    sql: ${TABLE}.staying_in_touch ;;
  }

  dimension: unique_events {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_events ;;
  }

  dimension: visitor_planning_guide {
    type: number
    hidden: yes
    sql: ${TABLE}.visitor_planning_guide ;;
  }

  dimension: spin_wheel_button {
    type: number
    hidden: yes
    sql: ${TABLE}.spin_wheel_button ;;
  }

  dimension: wheel_drag {
    type: number
    hidden: yes
    sql: ${TABLE}.wheel_drag ;;
  }

  dimension: wheel_click {
    type: number
    hidden: yes
    sql: ${TABLE}.wheel_click ;;
  }

  ### All Measures go Below ###

  measure: total_events {
    label: "Events"
    type: sum_distinct
    sql: ${events} ;;
    sql_distinct_key: ${events_join_id} ;;
  }

  measure: total_unique_events {
    label: "Unique Events"
    type: sum_distinct
    sql: ${unique_events} ;;
    sql_distinct_key: ${events_join_id} ;;
  }

  ## Google Analytics Events that represent value for San Diego Tourism ##

  measure: total_plan_your_adventure {
    group_label: "Client Events"
    type: sum_distinct
    label: "Plan Your Adventure"
    sql_distinct_key: ${events_join_id} ;;
    sql: ${plan_your_adventure} ;;
  }

  measure: total_discover_sd {
    group_label: "Client Events"
    type: sum_distinct
    label: "Discover SD Boards"
    sql_distinct_key: ${events_join_id} ;;
    sql: ${discover_sd} ;;
  }

  measure: total_wheel_drag {
    group_label: "Client Events"
    type: sum_distinct
    label: "Wheel Drags"
    sql_distinct_key: ${events_join_id} ;;
    sql: ${wheel_drag} ;;
  }

  measure: total_wheel_click {
    group_label: "Client Events"
    type: sum_distinct
    label: "Wheel Clicks"
    sql_distinct_key: ${events_join_id} ;;
    sql: ${wheel_click} ;;
  }

  measure: total_spin_wheel_button {
    group_label: "Client Events"
    type: sum_distinct
    label: "Wheel Spins"
    sql_distinct_key: ${events_join_id} ;;
    sql: ${spin_wheel_button} ;;
  }

  measure: total_plan_your_vacation {
    group_label: "Client Events"
    type: sum_distinct
    label: "Plan Your Vacation"
    sql_distinct_key: ${events_join_id} ;;
    sql: ${plan_your_vacation} ;;
  }

  measure: total_visitor_planning_guide {
    group_label: "Client Events"
    type: sum_distinct
    label: "Visitor Planning Guide"
    sql_distinct_key: ${events_join_id} ;;
    sql: ${visitor_planning_guide} ;;
  }

  measure: total_staying_in_touch {
    group_label: "Client Events"
    type: sum_distinct
    label: "Staying in Touch"
    sql_distinct_key: ${events_join_id} ;;
    sql: ${staying_in_touch} ;;
  }

  measure: total_hotel_search {
    group_label: "Client Events"
    type: sum_distinct
    label: "Hotel Searches"
    sql_distinct_key: ${events_join_id} ;;
    sql: ${hotel_search} ;;
  }

  measure: total_purchases {
    group_label: "Client Events"
    type: sum_distinct
    label: "Purchases"
    sql_distinct_key: ${events_join_id} ;;
    sql: ${purchases} ;;
    }

}
