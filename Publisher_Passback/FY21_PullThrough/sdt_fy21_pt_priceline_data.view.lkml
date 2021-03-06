view: sdt_fy21_pt_priceline_data {
  sql_table_name: public.sdt_fy21_pt_priceline_data ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
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
    sql: ${TABLE}.line_item ;;
  }

  dimension: line_item_id {
    type: number
    hidden: yes
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: sdt_market {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql: 'United States' ;;
  }

  dimension: sdt_layer {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql: 'Intent' ;;
  }

  dimension: publisher {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql: 'Priceline' ;;
  }

  dimension: sdt_placement {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql: 'Priceline Search Results Native Display' ;;
  }

  dimension: sdt_campaign {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql: 'US Pull-Through' ;;
  }

  dimension: sdt_region {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql:
      case
        when ${line_item_id} = '5516448165' then 'California'
        when ${line_item_id} = '5630382927' then 'California'

        when ${line_item_id} = '5517785516' then 'Arizona'
        when ${line_item_id} = '5631918701' then 'Arizona'

        when ${line_item_id} = '5589534437' then 'National'
        when ${line_item_id} = '5630393277' then 'National'

        when ${line_item_id} = '5517761036' then 'Western Region'
        when ${line_item_id} = '5630388159' then 'Western Region'
    else 'Uncategorized'
    end;;
  }

  dimension: creative_name {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql:
      case
        when ${line_item_id} = '5516448165' then 'HICYB_217x114'
        when ${line_item_id} = '5630382927' then 'WeekYay_217x114'

        when ${line_item_id} = '5517785516' then 'HICYB_217x114'
        when ${line_item_id} = '5631918701' then 'WeekYay_217x114'

        when ${line_item_id} = '5589534437' then 'HICYB_217x114'
        when ${line_item_id} = '5630393277' then 'WeekYay_217x114'

        when ${line_item_id} = '5517761036' then 'HICYB_217x114'
        when ${line_item_id} = '5630388159' then 'WeekYay_217x114'
    else 'Uncategorized'
    end;;
  }

  dimension: ad_size {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql: '217x114' ;;
  }

######### All measures go below ########

  measure: total_impressions {
    type: sum
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum
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
    type: sum
    label: "Media Spend"
    sql: ${cost} ;;
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
    type: sum
    hidden: yes
    label: "Video Views"
    sql: 0 ;;
  }

  measure: total_completes {
    type: sum
    hidden: yes
    label: "Video Completes"
    sql: 0 ;;
  }

  ### GA Measures ###

  measure: total_sessions {
    group_label: "Google Analytics Metrics"
    type: sum
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
    type: sum
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
    type: sum
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
    type: sum
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
    type: sum
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
    type: sum
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
    type: sum
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
    type: sum
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
    type: sum
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
    type: sum
    label: "Discover SD Boards"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_plan_your_vacation {
    group_label: "Google Analytics Events"
    type: sum
    label: "Plan Your Vacation"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_spin_wheel_button {
    group_label: "Google Analytics Events"
    type: sum
    label: "Wheel Spins"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_wheel_drag {
    group_label: "Google Analytics Events"
    type: sum
    label: "Wheel Drags"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_wheel_click {
    group_label: "Google Analytics Events"
    type: sum
    label: "Wheel Clicks"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_visitor_planning_guide {
    group_label: "Google Analytics Events"
    type: sum
    label: "Visitor Planning Guide"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_staying_in_touch {
    group_label: "Google Analytics Events"
    type: sum
    label: "Staying In Touch"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_hotel_search {
    group_label: "Google Analytics Events"
    type: sum
    label: "Hotel Searches"
    hidden: yes
    sql: 0 ;;
  }

  measure: total_purchases {
    group_label: "Google Analytics Events"
    type: sum
    label: "Purchases"
    hidden: yes
    sql: 0 ;;
  }


}
