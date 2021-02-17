view: sdt_fy21_pt_2h_ta {
  sql_table_name: public.sdt_fy21_pt_2h_ta ;;

  ## Primary ID ##

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

## Dimensions Added to this table via LookML ##

  dimension: publisher {
    type: string
    group_label: "Client Dimensions"
    sql: 'Trip Advisor' ;;
  }

  dimension: sdt_market {
    type: string
    label: "Market"
    group_label: "Client Dimensions"
    sql: 'United States' ;;
  }

  dimension: sdt_campaign {
    type: string
    label: "Campaign"
    group_label: "Client Dimensions"
    sql: 'US Pull-Through' ;;
  }

  dimension: sdt_layer {
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql: 'Intent' ;;
  }

  dimension: sdt_region {
    type: string
    label: "Region"
    group_label: "Client Dimensions"
    sql:
        case
          when ${line_item_id} = '5606660387' then 'Arizona'
          when ${line_item_id} = '5606337358' then 'California'
          when ${line_item_id} = '5606661083' then 'Western Region'

          else 'Uncategorized'
          end;;
  }

  dimension: ad_size {
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
          when ${line_item_id} = '5606660387' then '1200x627'
          when ${line_item_id} = '5606337358' then '1200x627'
          when ${line_item_id} = '5606661083' then '1200x627'


        ELSE 'Uncategorized'
        END;;
  }

    dimension: sdt_placement {
    type: string
    label: "Placement"
    group_label: "Client Dimensions"
    sql:
      CASE
          when ${line_item_id} = '5606660387' then 'TripAdvisor Native Boost'
          when ${line_item_id} = '5606337358' then 'TripAdvisor Native Boost'
          when ${line_item_id} = '5606661083' then 'TripAdvisor Native Boost'

        ELSE 'Uncategorized'
        END;;
  }

  dimension: sdt_creative {
    type: string
    label: "Creative Nmae"
    group_label: "Client Dimensions"
    sql:
      CASE
          when ${line_item_id} = '5606660387' then 'HICYB_1200x627'
          when ${line_item_id} = '5606337358' then 'HICYB_1200x627'
          when ${line_item_id} = '5606661083' then 'HICYB_1200x627'
        ELSE 'Uncategorized'
        END;;
  }

  ## Dimensions Native to table ##

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: creative {
    type: string
    group_label: "Trip Advisor Dimensions"
    sql: ${TABLE}.creative ;;
  }

  dimension: creative_id {
    type: number
    group_label: "Trip Advisor Dimensions"
    sql: ${TABLE}.creative_id ;;
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

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: line_item {
    type: string
    group_label: "Trip Advisor Dimensions"
    sql: ${TABLE}.line_item ;;
  }

  dimension: line_item_id {
    type: number
    group_label: "Trip Advisor Dimensions"
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: order {
    type: string
    hidden: yes
    sql: ${TABLE}."order" ;;
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: spend {
    type: number
    hidden: yes
    sql: ${TABLE}.spend ;;
  }

######### All measures go below ########

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Clicks"
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
    label: "Media Spend"
    sql: ${spend} ;;
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

  measure: total_views {
    type: sum_distinct
    hidden: yes
    label: "Video Views"
    sql: 0 ;;
  }

  measure: total_completes {
    type: sum_distinct
    hidden: yes
    label: "Video Completes"
    sql: 0 ;;
  }

  ### GA Measures ###

  measure: total_sessions {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Sessions"
    hidden: yes
    sql: 0 ;;
  }

  measure: cost_per_session {
    group_label: "Google Analytics Metrics"
    type: number
    label: "CPS"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_session_duration {
    type: sum_distinct
    label: "Total Session Duration"
    hidden: yes
    sql: 0 ;;
  }

  measure: avg_time_on_site {
    group_label: "Google Analytics Metrics"
    label: "Avg. TOS"
    type: number
    hidden: yes
    sql: 0 ;;
  }

  measure: total_pageviews {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Pageviews"
    hidden: yes
    sql: 0 ;;
  }

  measure: pages_per_session {
    group_label: "Google Analytics Metrics"
    type: number
    label: "Pages/Session"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_bounces {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Bounces"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_bounce_rate  {
    label: "Bounce Rate"
    group_label: "Google Analytics Metrics"
    type: number
    hidden: yes
    sql: 0 ;;
  }

  ## SDT Google Analytics Goals ##

  measure: total_wheel_interactions {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Wheel Interactions"
    hidden: yes
    sql: 0 ;;
  }

  measure: wheel_interaction_rate  {
    label: "Wheel Interaction Rate"
    group_label: "Google Analytics Goals"
    type: number
    hidden: yes
    sql: 0 ;;
  }

  measure: total_ga_video_starts {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Video Starts"
    hidden: yes
    sql: 0 ;;
  }

  measure: ga_video_start_rate  {
    label: "Video Start Rate"
    group_label: "Google Analytics Goals"
    type: number
    hidden: yes
    sql: 0 ;;
  }

  measure: total_newsletter_signups {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Newsletter Sign-Ups"
    hidden: yes
    sql: 0 ;;
  }

  measure: newsletter_signups_rate  {
    label: "Newsletter Sign-Up Rate"
    group_label: "Google Analytics Goals"
    type: number
    hidden: yes
    sql: 0 ;;
  }

  measure: total_tos_above_30s {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Avg. TOS >30s"
    hidden: yes
    sql: 0 ;;
  }

  measure: tos_above_30s_rate  {
    label: "Avg. TOS >30s Rate"
    group_label: "Google Analytics Goals"
    type: number
    hidden: yes
    sql: 0 ;;
  }

  measure: total_tos_above_120s {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Avg. TOS >120s"
    hidden: yes
    sql: 0 ;;
  }

  measure: tos_above_120s_rate  {
    label: "Avg. TOS >120s Rate"
    group_label: "Google Analytics Goals"
    type: number
    hidden: yes
    sql: ${total_tos_above_120s}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  ## SDT Google Analytics Events ##

  measure: total_discover_sd {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Discover SD Boards"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_plan_your_vacation {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Plan Your Vacation"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_spin_wheel_button {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Wheel Spins"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_wheel_drag {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Wheel Drags"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_wheel_click {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Wheel Clicks"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_visitor_planning_guide {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Visitor Planning Guide"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_staying_in_touch {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Staying In Touch"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_hotel_search {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Hotel Searches"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_purchases {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Purchases"
    hidden: yes
    sql: 0 ;;
  }
}
