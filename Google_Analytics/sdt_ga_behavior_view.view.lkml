view: sdt_ga_behavior_view {
  sql_table_name: public.sdt_ga_behavior_view ;;

## Primary Key ##

  dimension: behavior_join_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.behavior_join_id ;;
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

  ### Dimensions Native to the table go below ###

  dimension: acq_join_id {
    type: string
    hidden: yes
    sql: ${TABLE}.acq_join_id ;;
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

  dimension: entrances {
    type: number
    hidden: yes
    sql: ${TABLE}.entrances ;;
  }

  dimension: exits {
    type: number
    hidden: yes
    sql: ${TABLE}.exits ;;
  }

  dimension: ga_ads_lookup_id {
    type: string
    hidden: yes
    sql: ${TABLE}.ga_ads_lookup_id ;;
  }

  dimension: keyword {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.keyword ;;
  }

  dimension: medium {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.medium ;;
  }

  dimension: pagepath {
    type: string
    label: "Page URL"
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.pagepath ;;
    link: {
      label: "sandiego.org"
      url:"https://{{ sdt_ga_behavior_view.pagepath._value }}"
      icon_url: "https://www.sandiego.org/media/logo.png"
    }
  }

  dimension: pagetitle {
    type: string
    label: "Page Title"
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.pagetitle ;;
    link: {
      label: "sandiego.org"
      url:"https://{{ sdt_ga_behavior_view.pagepath._value }}"
      icon_url: "https://www.sandiego.org/media/logo.png"
    }
  }

  dimension: pageviews {
    type: number
    hidden: yes
    sql: ${TABLE}.pageviews ;;
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

  dimension: timeonpage {
    type: number
    hidden: yes
    sql: ${TABLE}.timeonpage ;;
  }

  ### All Measures go Below ###

  measure: total_pageviews {
    type: sum_distinct
    sql_distinct_key: ${behavior_join_id} ;;
    group_label: "Page Metrics"
    sql: ${pageviews} ;;
    label: "Pageviews"
  }

  measure: total_time_on_page {
    type: sum_distinct
    sql_distinct_key: ${behavior_join_id} ;;
    hidden: yes
    sql: ${timeonpage} ;;
    group_label: "Page Metrics"
  }

  measure: avg_time_on_page {
    label: "Avg. TOP"
    type: number
    sql: (${total_time_on_page}/nullif(${total_pageviews},0))::float/86400 ;;
    value_format: "m:ss"
    group_label: "Page Metrics"
  }

  measure: total_exits {
    type: sum_distinct
    sql_distinct_key: ${behavior_join_id} ;;
    group_label: "Page Metrics"
    sql: ${exits} ;;
    label: "Exits"
  }

  measure: exit_rate {
    label: "Exit Rate"
    group_label: "Page Metrics"
    type: number
    sql: 1.0*${total_exits}/nullif(${total_pageviews}, 0);;
    value_format_name: percent_0
  }

  measure: total_entrances {
    type: sum_distinct
    sql_distinct_key: ${behavior_join_id} ;;
    group_label: "Page Metrics"
    sql: ${entrances} ;;
    label: "Entrances"
  }


}
