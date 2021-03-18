view: sdt_helm_ga_view {
  sql_table_name: public.sdt_helm_ga_view ;;

  ## Primary Key ##

  dimension: ga_join_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.ga_join_id ;;
  }

  ## Dimensions Added To Table ##

  dimension: ad_size {
    type: string
    group_label: "DCM Dimensions"
    label: "Ad Size"
    sql:
        CASE
          when ${line_item} ilike 'fy21_SDTA_SpringAwareness%' then 'Video'
          when ${creative} ilike '%1200x1200%' then '1200x1200'
        ELSE 'Uncategorized'
        END;;
  }

  dimension: publisher {
    type: string
    group_label: "Client Dimensions"
    label: "Publisher"
    sql: 'The Helm' ;;
  }

  dimension: sdt_layer {
    type: string
    group_label: "Client Dimensions"
    label: "Campaign Layer"
    sql:
        CASE
          when ${line_item} ilike 'fy21_SDTA_ContentProgram_Native_Prospecting_%+TripleLift%' then 'First Touch Display'
          when ${line_item} ilike 'fy21_SDTA_ContentProgram_Native_Prospecting_%+Kargo%' then 'First Touch Display'
          when ${line_item} ilike 'fy21_SDTA_ContentProgram_Native_Remarketing_%+TripleLift%' then 'Topical Retargeting'
          when ${line_item} ilike 'fy21_SDTA_ContentProgram_Native_Remarketing_%+Kargo%' then 'Topical Retargeting'

          ELSE 'Uncategorized'
          end ;;
  }

  dimension: sdt_campaign {
    type: string
    group_label: "Client Dimensions"
    label: "Campaign Name"
    sql:
        CASE
          when ${line_item} ilike 'fy21_SDTA_SpringAwareness%' then 'Spring Awareness'
          when ${line_item} ilike 'fy21_SDTA_ContentProgram%' then 'Always On Content'
        ELSE ${line_item}
        END;;
  }

  dimension: sdt_market {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql: 'United States' ;;
  }

  dimension: sdt_region {
    type: string
    group_label: "Client Dimensions"
    label: "Region"
    sql:
        case
          when ${line_item} ilike '%California%' then 'California'
          when ${line_item} ilike '%Arizona%' then 'Arizona'
          when ${line_item} ilike '%LosAngeles%' then 'Los Angeles'
            ELSE 'Uncategorized'
        END;;
  }

  dimension: sdt_placement {
    type: string
    group_label: "Client Dimensions"
    label: "Placement Name"
    sql:
        case
        when ${line_item} ilike 'fy21_SDTA_SpringAwareness_OTT+SFV_Prospecting%' then 'OTT :30 Video: SFV'
        when ${line_item} ilike 'fy21_SDTA_SpringAwareness_OTT+LFV_Prospecting%' then 'OTT :30 Video: LFV'
        when ${line_item} ilike 'fy21_SDTA_SpringAwareness_OLV_Prospecting%' then 'OLV :30 Video'

        when ${line_item} ilike 'fy21_SDTA_ContentProgram_Native_Prospecting_%+TripleLift%' then 'TripleLift Prospecting Display'
        when ${line_item} ilike 'fy21_SDTA_ContentProgram_Native_Prospecting_%+Kargo%' then 'Kargo Prospecting Display'
        when ${line_item} ilike 'fy21_SDTA_ContentProgram_Native_Remarketing_%+TripleLift%' then 'TripleLift Remarketing Display'
        when ${line_item} ilike 'fy21_SDTA_ContentProgram_Native_Remarketing_%+Kargo%' then 'Kargo Remarketing Display'
        else 'Uncategorized'
      end;;
  }

  dimension: sdt_pillar {
    type: string
    group_label: "Client Dimensions"
    label: "Pillar"
    sql: 'N/A' ;;
  }

  dimension: creative_name {
    type: string
    group_label: "Client Dimensions"
    label: "Creative Name"
    sql:
        case
          when ${line_item} ilike 'fy21_SDTA_SpringAwareness_OTT+SFV_Prospecting%' then 'Happiness is Calling You Back (:30)'
          when ${line_item} ilike 'fy21_SDTA_SpringAwareness_OTT+LFV_Prospecting%' then 'Happiness is Calling You Back (:30)'
          when ${line_item} ilike 'fy21_SDTA_SpringAwareness_OLV_Prospecting%' then 'Happiness is Calling You Back (:30)'

          when ${creative} ilike '%SafeTraveler_1200x1200%' then 'WC: Safe Traveler Content'
          when ${creative} ilike '%PlanNow_1200x1200%' then 'WC: Plan Now'
          when ${creative} ilike '%BookNow_1200x1200%' then 'WC: Book Now'
          when ${creative} ilike '%Outdoor_1200x1200%' then 'WC: Outdoor Dining'
          when ${creative} ilike '%Sunny7_SDDiningMarkets_1200x1200%' then 'S7: Local Markets'
          when ${creative} ilike '%Sunny7_ScenicHwy101_1200x1200%' then 'S7: 7 Things to Do Along Scenic CA Highway 101'
          when ${creative} ilike '%Sunny7_AwesomeSDViewpoints_1200x1200%' then 'S7: Awesome San Diego Viewpoints'
          when ${creative} ilike '%SDTidePools_1200x1200%' then 'WC: SD Tide Pools: Exploring Life at the Edge of the Sea'
          when ${creative} ilike '%CoastalHikes_1200x1200%' then 'S7: 7 Star Coastal Hikes'
          when ${creative} ilike '%BestKidBeaches_1200x1200%' then 'WC: The Best Beaches According to Kids'
          when ${creative} ilike '%BayshoreBikeway_1200x1200%' then 'WC: Bayshore Bikeway'
          when ${creative} ilike '%7NaturalWonders_1200x1200%' then 'S7: Natural Wonders'
          when ${creative} ilike '%GuidetoSDBeaches_1200x1200%' then 'WC: Guide to San Diego Beaches'
            ELSE 'Uncategorized'
        END;;
  }

  ## Dimensions Native To Table ##

  dimension: book_now_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.book_now_conversions ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: clicks_to_third_party {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks_to_third_party ;;
  }

  dimension: completes {
    type: number
    hidden: yes
    sql: ${TABLE}.completes ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }

  dimension: creative {
    type: string
    group_label: "Helm Dimensions"
    sql: ${TABLE}.creative ;;
  }

  dimension: creative_id {
    type: number
    group_label: "Helm IDs"
    sql: ${TABLE}.creative_id ;;
  }

  dimension_group: date {
    group_label: "Date Periods"
    label: ""
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: discover_sd {
    type: number
    hidden: yes
    sql: ${TABLE}.discover_sd ;;
  }

  dimension: engaged_users {
    type: number
    hidden: yes
    sql: ${TABLE}.engaged_users ;;
  }

  dimension: ga_video_starts {
    type: number
    hidden: yes
    sql: ${TABLE}.ga_video_starts ;;
  }

  dimension: hotel_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.hotel_clicks ;;
  }

  dimension: hotel_search {
    type: number
    hidden: yes
    sql: ${TABLE}.hotel_search ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: line_item {
    type: string
    group_label: "Helm Dimensions"
    sql: ${TABLE}.line_item ;;
  }

  dimension: line_item_id {
    group_label: "Helm IDs"
    type: number
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: more_info_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.more_info_clicks ;;
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

  dimension: prospecting_landing_pages {
    type: number
    hidden: yes
    sql: ${TABLE}.prospecting_landing_pages ;;
  }

  dimension: purchases {
    type: number
    hidden: yes
    sql: ${TABLE}.purchases ;;
  }

  dimension: remarketing_landing_pages {
    type: number
    hidden: yes
    sql: ${TABLE}.remarketing_landing_pages ;;
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

  dimension: site_visits {
    type: number
    hidden: yes
    sql: ${TABLE}.site_visits ;;
  }

  dimension: spin_wheel_button {
    type: number
    hidden: yes
    sql: ${TABLE}.spin_wheel_button ;;
  }

  dimension: staying_in_touch {
    type: number
    hidden: yes
    sql: ${TABLE}.staying_in_touch ;;
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

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

  dimension: video_errors {
    type: number
    hidden: yes
    sql: ${TABLE}.video_errors ;;
  }

  dimension: video_skips {
    type: number
    hidden: yes
    sql: ${TABLE}.video_skips ;;
  }

  dimension: video_starts {
    type: number
    hidden: yes
    sql: ${TABLE}.video_starts ;;
  }

  dimension: videos_served {
    type: number
    hidden: yes
    sql: ${TABLE}.videos_served ;;
  }

  dimension: view_deal_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.view_deal_clicks ;;
  }

  dimension: views_to_25 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_25 ;;
  }

  dimension: views_to_50 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_50 ;;
  }

  dimension: views_to_75 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_75 ;;
  }

  dimension: visitor_planning_guide {
    type: number
    hidden: yes
    sql: ${TABLE}.visitor_planning_guide ;;
  }

  dimension: wheel_click {
    type: number
    hidden: yes
    sql: ${TABLE}.wheel_click ;;
  }

  dimension: wheel_drag {
    type: number
    hidden: yes
    sql: ${TABLE}.wheel_drag ;;
  }

  dimension: wheel_interactions {
    type: number
    hidden: yes
    sql: ${TABLE}.wheel_interactions ;;
  }

  ## Measures Below ##

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Impressions"
    group_label: "Delivery Metrics"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Clicks"
    group_label: "Delivery Metrics"
    sql: ${clicks} ;;
  }

  measure: total_ctr {
    group_label: "Delivery Metrics"
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_cost {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Spend"
    group_label: "Delivery Metrics"
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: total_cpc {
    group_label: "Delivery Metrics"
    type: number
    label: "CPC"
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: total_cpm {
    group_label: "Delivery Metrics"
    type: number
    label: "CPM"
    sql: 1.0*${total_cost}/nullif(${impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_views_to_25 {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Views to 25%"
    group_label: "Video Quartiles"
    sql: ${views_to_25} ;;
  }

  measure: total_views_to_50 {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Views to 50%"
    group_label: "Video Quartiles"
    sql: ${views_to_50} ;;
  }

  measure: total_views_to_75 {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Views to 75%"
    group_label: "Video Quartiles"
    sql: ${views_to_75} ;;
  }

  measure: total_video_starts {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Video Starts"
    group_label: "Video Delivery"
    sql: ${video_starts} ;;
  }

  measure: total_completes {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Video Completes"
    group_label: "Video Delivery"
    sql: ${completes} ;;
  }

  measure: total_book_now_conversions {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Book Now Conversions"
    group_label: "Conversions"
    sql: ${book_now_conversions} ;;
  }

  measure: total_clicks_to_third_party {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Clicks to 3rd Party"
    group_label: "Conversions"
    sql: ${clicks_to_third_party} ;;
  }

  measure: total_engaged_users {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Engaged Users"
    group_label: "Conversions"
    sql: ${engaged_users} ;;
  }

  measure: total_hotel_clicks {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Hotel Clicks"
    group_label: "Conversions"
    sql: ${hotel_clicks} ;;
  }

  measure: total_more_info_clicks {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "More Info Clicks"
    group_label: "Conversions"
    sql: ${more_info_clicks} ;;
  }

  measure: total_prospecting_landing_pages {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Prospecting Landing Page Views"
    group_label: "Conversions"
    sql: ${prospecting_landing_pages} ;;
  }
  measure: total_remarketing_landing_pages {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Remarketing Landing Page Views"
    group_label: "Conversions"
    sql: ${remarketing_landing_pages} ;;
  }
  measure: total_site_visits {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Site Visits"
    group_label: "Conversions"
    sql: ${site_visits} ;;
  }
  measure: total_view_deal_clicks {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "View Deal Clicks"
    group_label: "Conversions"
    sql: ${view_deal_clicks} ;;
  }

  measure: total_video_errors {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Video Errors"
    group_label: "Video Delivery"
    sql: ${video_errors} ;;
  }

  measure: total_video_serves {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Video Serves"
    group_label: "Video Delivery"
    sql: ${videos_served} ;;
  }

  measure: total_video_skips {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Video Skips"
    group_label: "Video Delivery"
    sql: ${video_skips} ;;
  }

  ### GA Measures ###

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
