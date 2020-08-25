view: sdt_sem_ga_view {
  sql_table_name: public.sdt_sem_ga_view ;;

###### Primary Key #######

  dimension: ga_join_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.ga_join_id ;;
  }

###### Dimensions added to this table via LookML #######

  dimension: fiscal_year {
    label: "Fiscal Year"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${day_date} BETWEEN '2013-07-01' AND '2014-06-30' THEN 'FY 13/14'
        WHEN ${day_date} BETWEEN '2014-07-01' AND '2015-06-30' THEN 'FY 14/15'
        WHEN ${day_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
        WHEN ${day_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
        WHEN ${day_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${day_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${day_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        WHEN ${day_date} BETWEEN '2020-07-01' AND '2021-06-30' THEN 'FY 20/21'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: sdt_market {
    label: "Market"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${account} = 'SDTA CAN SEM' then 'Canada'
        WHEN ${account} = 'SDTA UK SEM' then 'United Kingdom'
        WHEN ${account} = 'SDTA US SEM' then 'United States'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: sdt_campaign {
    label: "Campaign"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${account} = 'SDTA CAN SEM' then 'Canada Digital'
        WHEN ${account} = 'SDTA UK SEM' then 'United Kingdom Digital'
        WHEN ${account} = 'SDTA US SEM' then 'United States SEM'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: sdt_layer {
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql:
      case
        WHEN ${account} = 'SDTA CAN SEM' then 'Impact'
        WHEN ${account} = 'SDTA UK SEM' then 'Impact'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_placement {
    label: "Campaign Placement"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign} ilike 'SDTA - Canada - Attractions%' then 'Search - Attractions'
        WHEN ${campaign} ilike 'SDTA - Canada - Brand%' then 'Search - Brand'
        WHEN ${campaign} ilike 'SDTA - Canada - RLSA%' then 'Search - RLSA'
        WHEN ${campaign} ilike 'SDTA - UK - Brand%' then 'Search - Brand'
        WHEN ${campaign} ilike 'SDTA - UK - Attractions%' then 'Search - Attractions'
        WHEN ${campaign} ilike 'SDTA - UK - California%' then 'Search - California'
        WHEN ${campaign} ilike '%SDTA - UK - Generic%' then 'Search - Generic'
        WHEN ${campaign} ilike '%SDTA - Canada - Generic%' then 'Search - Generic'
        WHEN ${campaign} ilike 'SDTA - Canada - California%' then 'Search - California'

        WHEN ${campaign} = 'United States' then 'Search - United States'
        WHEN ${campaign} = 'U.S.' then 'Search - United States'
        WHEN ${campaign} = 'Retargeting' then 'Search - Retargeting'
        WHEN ${campaign} = 'Inspiration' then 'Search - Inspiration'
        WHEN ${campaign} = 'Competitive' then 'Search - Competitive'
        WHEN ${campaign} = 'California' then 'Search - California'
        WHEN ${campaign} = 'Brand' then 'Search - Brand'

        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: creative_name {
    type: string
    group_label: "Client Dimensions"
    sql: 'Text Ad'
      ;;
  }

  dimension: advertising_channel {
    type: string
    label: "Channel"
    group_label: "AdWords Dimensions"
    sql: 'Search'
      ;;
  }

  dimension: publisher {
    type: string
    label: "Publisher"
    group_label: "AdWords Dimensions"
    sql: 'Google Search'
      ;;
  }

###### All dimensions go below #######

  dimension: account {
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: string
    group_label: "AdWords IDs"
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: campaign {
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "AdWords IDs"
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }

  dimension_group: day {
    label: ""
    group_label: "Date Periods"
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
    sql: ${TABLE}.day ;;
  }

  dimension: ga_video_starts {
    type: number
    hidden: yes
    sql: ${TABLE}.ga_video_starts ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: newsletter_sign_up {
    type: number
    hidden: yes
    sql: ${TABLE}.newsletter_sign_up ;;
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

  dimension: tos_above_120s {
    type: number
    hidden: yes
    sql: ${TABLE}.tos_above_120s ;;
  }

  dimension: tos_above_30s {
    type: number
    hidden: yes
    sql: ${TABLE}.tos_above_30s ;;
  }

  dimension: total_conv_value {
    type: number
    hidden: yes
    sql: ${TABLE}.total_conv_value ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

  dimension: wheel_interactions {
    type: number
    hidden: yes
    sql: ${TABLE}.wheel_interactions ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: 0 ;;
  }

  dimension: completes {
    type: number
    hidden: yes
    sql: 0 ;;
  }

  ## Dimensions for GA Events ##

  dimension: discover_sd {
    type: number
    hidden: yes
    sql: ${TABLE}.discover_sd ;;
  }

  dimension: plan_your_vacation {
    type: number
    hidden: yes
    sql: ${TABLE}.plan_your_vacation ;;
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

  dimension: visitor_planning_guide {
    type: number
    hidden: yes
    sql: ${TABLE}.visitor_planning_guide ;;
  }

  dimension: staying_in_touch {
    type: number
    hidden: yes
    sql: ${TABLE}.staying_in_touch ;;
  }

  dimension: hotel_search {
    type: number
    hidden: yes
    sql: ${TABLE}.hotel_search ;;
  }

  dimension: purchases {
    type: number
    hidden: yes
    sql: ${TABLE}.purchases ;;
  }

  ###### All Measures go Below #######

  measure: total_impressions {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type:  sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql:${cost}/1000000.00  ;;
    value_format_name: usd
  }

  measure: total_conversions {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${conversions} ;;
  }

  measure: click_through_rate  {
    label: "CTR"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    label: "CPC"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand  {
    label: "CPM"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_conversion_rate  {
    label: "CVR"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_conversions}/nullif(${total_clicks}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_conversion {
    label: "CPA"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_conversions} ,0);;
    value_format_name: usd
  }

  measure: total_views {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${completes} ;;
  }

###### All Measures go Below ######

  measure: total_sessions {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    group_label: "Google Analytics Metrics"
    type: number
    label: "CPS"
    sql: ${total_cost}/nullif(${total_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: total_session_duration {
    hidden: yes
    type: sum_distinct
    label: "Total Session Duration"
    sql_distinct_key: ${ga_join_id};;
    sql: ${sessionduration};;
  }

  measure: avg_time_on_site {
    group_label: "Google Analytics Metrics"
    label: "Avg. TOS"
    type: number
    sql:  (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400  ;;
    value_format: "m:ss"
  }

  measure: total_pageviews {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Pageviews"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${pageviews} ;;
  }

  measure: pages_per_session {
    group_label: "Google Analytics Metrics"
    type: number
    label: "Pages/Session"
    sql: ${total_pageviews}/nullif(${total_sessions}, 0) ;;
    value_format_name: decimal_2
  }

  measure: total_bounces {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Bounces"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${bounces} ;;
  }

  measure: total_bounce_rate  {
    label: "Bounce Rate"
    group_label: "Google Analytics Metrics"
    type: number
    sql: ${total_bounces}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  ## SDT Google Analytics Goals ##

  measure: total_wheel_interactions {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Wheel Interactions"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${wheel_interactions} ;;
  }

  measure: wheel_interaction_rate  {
    label: "Wheel Interaction Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_wheel_interactions}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_ga_video_starts {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Video Starts"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${ga_video_starts} ;;
  }

  measure: ga_video_start_rate  {
    label: "Video Start Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_ga_video_starts}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_newsletter_signups {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Newsletter Sign-Ups"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${newsletter_sign_up} ;;
  }

  measure: newsletter_signups_rate  {
    label: "Newsletter Sign-Up Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_newsletter_signups}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_tos_above_30s {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Avg. TOS >30s"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${tos_above_30s} ;;
  }

  measure: tos_above_30s_rate  {
    label: "Avg. TOS >30s Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_tos_above_30s}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_tos_above_120s {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Avg. TOS >120s"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${tos_above_30s} ;;
  }

  measure: tos_above_120s_rate  {
    label: "Avg. TOS >120s Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_tos_above_120s}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  ## SDT Google Analytics Events ##

  measure: total_discover_sd {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Discover SD Boards"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${discover_sd} ;;
  }

  measure: total_plan_your_vacation {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Plan Your Vacation"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${plan_your_vacation} ;;
  }

  measure: total_spin_wheel_button {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Wheel Spins"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${spin_wheel_button} ;;
  }

  measure: total_wheel_drag {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Wheel Drags"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${wheel_drag} ;;
  }

  measure: total_wheel_click {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Wheel Clicks"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${wheel_click} ;;
  }

  measure: total_visitor_planning_guide {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Visitor Planning Guide"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${visitor_planning_guide} ;;
  }

  measure: total_staying_in_touch {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Staying In Touch"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${staying_in_touch} ;;
  }

  measure: total_hotel_search {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Hotel Searches"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${hotel_search} ;;
  }

  measure: total_purchases {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Purchases"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${purchases} ;;
  }
}
