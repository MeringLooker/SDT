view: sdt_snap_ga_view {
  sql_table_name: public.sdt_snap_ga_view ;;

#### Primary Key ####

  dimension: comp_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.ga_join_id ;;
  }

  #### Dimensions Added to Table via LookML ####

  dimension: publisher {
    type: string
    group_label: "SnapChat Dimensions"
    sql: 'Snapchat' ;;
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
    sql:
      CASE
        WHEN ${campaign_name} ILIKE 'FY21_SDT_SpringAwareness%' then 'Spring Awareness'
        ELSE 'Uncategorized'
        END
    ;;
  }

  dimension: sdt_layer {
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql: 'Uncategorized' ;;
  }

  dimension: sdt_region {
    type: string
    label: "Region"
    group_label: "Client Dimensions"
    sql:
    CASE
    WHEN ${campaign_name} ILIKE 'FY21_SDT_SpringAwareness_%_%_Arizona' then 'Arizona'
    WHEN ${campaign_name} ILIKE 'FY21_SDT_SpringAwareness_%_%_California' then 'California'
    ELSE 'Uncategorized'
    END
    ;;
  }

  dimension: sdt_placement {
    type: string
    label: "Campaign Placement"
    group_label: "Client Dimensions"
    sql:
      CASE
      WHEN ${campaign_name} ILIKE 'FY21_SDT_SpringAwareness_Engagement_StoryAd%' then 'Snap Story'
      WHEN ${campaign_name} ILIKE 'FY21_SDT_SpringAwareness_Awareness_SnapAd%' then 'Snap Ad'
      ELSE 'Uncategorized'
      END
    ;;
  }

  dimension: creative_name {
    type: string
    label: "Creative Name"
    group_label: "Client Dimensions"
    sql:
      CASE
        when ${ad_name} ilike 'FY21_SDT_SpringAwareness_Awareness_SnapAd_%_HICYB_Video' then 'Happiness Is Calling You Back (:15)'
        when ${ad_name} ilike 'FY21_SDT_SpringAwareness_Awareness_SnapAd_%_HICYB_Animated' then 'HICYB: Animated Slideshow'
        when ${ad_name} ilike 'FY21_SDT_SpringAwareness_Engagement_StoryAd%' then 'HICYB Snap Story'
      ELSE 'Uncategorized'
      END
    ;;
  }

  dimension: ad_size {
    type: string
    label: "Ad Size"
    group_label: "Client Dimensions"
    sql:
      CASE
      WHEN ${campaign_name} ILIKE 'FY21_SDT_SpringAwareness_Engagement_StoryAd%' then 'Snap Story'
      WHEN ${campaign_name} ILIKE 'FY21_SDT_SpringAwareness_Awareness_SnapAd%' then 'Snap Ad'
      ELSE 'Uncategorized'
      END
    ;;
  }

  #### Dimensions go below ####

  dimension: 15_second_video_views {
    type: number
    hidden: yes
    sql: ${TABLE}."15_second_video_views" ;;
  }

  dimension: 2_second_video_views {
    type: number
    hidden: yes
    sql: ${TABLE}."2_second_video_views" ;;
  }

  dimension: ad_id {
    type: string
    group_label: "SnapChat IDs"
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    group_label: "SnapChat Dimensions"
    sql: ${TABLE}.ad_name ;;
  }

  dimension: ad_set_id {
    type: string
    group_label: "SnapChat IDs"
    sql: ${TABLE}.ad_set_id ;;
  }

  dimension: ad_set_name {
    type: string
    group_label: "SnapChat Dimensions"
    sql: ${TABLE}.ad_set_name ;;
  }

  dimension: ad_type {
    type: string
    group_label: "SnapChat Dimensions"
    sql: ${TABLE}.ad_type ;;
  }

  dimension: attachment_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.attachment_impressions ;;
  }

  dimension: attachment_video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.attachment_video_views ;;
  }

  dimension: attachment_views_at_100 {
    type: number
    hidden: yes
    sql: ${TABLE}.attachment_views_at_100 ;;
  }

  dimension: attachment_views_at_25 {
    type: number
    hidden: yes
    sql: ${TABLE}.attachment_views_at_25 ;;
  }

  dimension: attachment_views_at_50 {
    type: number
    hidden: yes
    sql: ${TABLE}.attachment_views_at_50 ;;
  }

  dimension: attachment_views_at_75 {
    type: number
    hidden: yes
    sql: ${TABLE}.attachment_views_at_75 ;;
  }

  dimension: average_screen_time {
    type: number
    hidden: yes
    sql: ${TABLE}.average_screen_time ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: campaign_id {
    type: string
    group_label: "SnapChat IDs"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    group_label: "SnapChat Dimensions"
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: creative_id {
    type: string
    group_label: "SnapChat IDs"
    sql: ${TABLE}.creative_id ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: discover_sd {
    type: number
    hidden: yes
    sql: ${TABLE}.discover_sd ;;
  }

  dimension: ga_video_starts {
    type: number
    hidden: yes
    sql: ${TABLE}.ga_video_starts ;;
  }

  dimension: hotel_search {
    type: number
    hidden: yes
    sql: ${TABLE}.hotel_search ;;
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

  dimension: paid_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.paid_impressions ;;
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

  dimension: saves {
    type: number
    hidden: yes
    sql: ${TABLE}.saves ;;
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

  dimension: shares {
    type: number
    hidden: yes
    sql: ${TABLE}.shares ;;
  }

  dimension: spend {
    type: number
    hidden: yes
    sql: ${TABLE}.spend ;;
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

  dimension: story_completes {
    type: number
    hidden: yes
    sql: ${TABLE}.story_completes ;;
  }

  dimension: story_opens {
    type: number
    hidden: yes
    sql: ${TABLE}.story_opens ;;
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

  dimension: total_swipe_ups {
    type: number
    hidden: yes
    sql: ${TABLE}.total_swipe_ups ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

  dimension: views_at_100 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_100 ;;
  }

  dimension: views_at_25 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_25 ;;
  }

  dimension: views_at_50 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_50 ;;
  }

  dimension: views_at_75 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_75 ;;
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

## All Measures Go Below ##

  measure: total_impressions {
    type: sum_distinct
    group_label: "Delivery Metrics"
    label: "Impressions (Paid)"
    sql_distinct_key: ${comp_key} ;;
    sql: ${paid_impressions}  ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "Delivery Metrics"
    label: "Swipe Ups"
    sql_distinct_key: ${comp_key} ;;
    sql: ${total_swipe_ups} ;;
  }

  measure: swipe_up_rate {
    type: number
    label: "Swipe Up %"
    group_label: "Delivery Metrics"
    sql: 1.0*(${total_clicks})/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure: total_cost {
    type: sum_distinct
    group_label: "Delivery Metrics"
    label: "Media Spend"
    sql_distinct_key: ${comp_key} ;;
    sql: ${spend} ;;
    value_format_name: usd
  }

  measure: total_story_opens {
    group_label: "Story Metrics"
    type: sum_distinct
    label: "Story Opens"
    sql_distinct_key: ${comp_key} ;;
    sql: ${story_opens} ;;
  }

  measure: total_story_completes {
    group_label: "Story Metrics"
    type: sum_distinct
    label: "Story Completes"
    sql_distinct_key: ${comp_key} ;;
    sql: ${story_completes} ;;
  }

  measure: story_open_rate {
    group_label: "Story Metrics"
    type: number
    label: "Story Open %"
    value_format_name: percent_2
    sql:
      case
        when ${ad_type} = 'Story Ad' then (${total_story_opens}/nullif(${total_impressions}, 0))
        else null
        end
        ;;
  }

  measure: story_completion_rate {
    group_label: "Story Metrics"
    type: number
    label: "Story VCR"
    value_format_name: percent_2
    sql:
      case
        when ${ad_type} = 'Story Ad' then (${total_story_completes}/nullif(${total_story_opens}, 0))
        else null
        end
        ;;
  }

  measure: cost_per_story_open {
    group_label: "Story Metrics"
    type: number
    label: "Cost per Open"
    value_format_name: usd
    sql:
      case
        when ${ad_type} = 'Story Ad' then ${total_cost}/nullif(${total_story_opens}, 0)
        else null
        end
      ;;
  }

  measure: total_shares {
    type: sum_distinct
    label: "Total Shares"
    group_label: "Delivery Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${shares} ;;
  }

  measure: total_saves {
    type: sum_distinct
    label: "Total Saves"
    group_label: "Delivery Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${saves} ;;
  }

  measure: total_views_at_25 {
    type: sum_distinct
    label: "Views to 25%"
    group_label: "Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_at_25} ;;
  }

  measure: 2_sec_video_views {
    type: sum_distinct
    label: ":02 Video Views"
    group_label: "Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${2_second_video_views} ;;
  }

  measure: 15_sec_video_views {
    type: sum_distinct
    label: ":15 Video Views"
    group_label: "Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${15_second_video_views} ;;
  }

  measure: total_views_at_50 {
    type: sum_distinct
    label: "Views to 50%"
    group_label: "Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_at_50} ;;
  }

  measure: total_views_at_75 {
    type: sum_distinct
    label: "Views to 75%"
    group_label: "Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_at_75} ;;
  }

  measure: total_views_at_100 {
    type: sum_distinct
    label: "Views to 100%"
    group_label: "Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_at_100} ;;
  }

  measure: total_views_at_100_v2 {
    type: sum_distinct
    hidden: yes
    label: "Views to 100%"
    group_label: "Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_at_100} ;;
  }

  measure: campaign_views {
    type: sum_distinct
    hidden: yes
    label: "Views to 100% - FY20"
    group_label: "Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql:
      case
        when ${ad_size} = 'Snap Story' then 0
        else ${views_at_100}
        end
        ;;
  }

  measure: campaign_completes {
    type: sum_distinct
    hidden: yes
    label: "Views to 100% - FY20"
    group_label: "Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql:
      case
        when ${ad_size} = 'Snap Story' then 0
        else ${views_at_100}
        end
        ;;
  }

  measure: completion_rate {
    type: number
    label: "Completion Rate"
    group_label: "Video Metrics"
    sql: 1.0*(${total_views_at_100})/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure: percent_to_25 {
    type: number
    label: "% Viewed to 25%"
    group_label: "Video Metrics"
    sql: 1.0*(${total_views_at_25})/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure:  percent_to_50 {
    type: number
    label: "% Viewed to 50%"
    group_label: "Video Metrics"
    sql: 1.0*(${total_views_at_50})/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure:  percent_to_75 {
    type: number
    label: "% Viewed to 75%"
    group_label: "Video Metrics"
    sql: 1.0*(${total_views_at_75})/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure: total_attachment_impressions {
    type: sum_distinct
    group_label: "Attachment Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${attachment_impressions} ;;
  }

  measure: total_attachment_video_views {
    type: sum_distinct
    group_label: "Attachment Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${attachment_video_views} ;;
  }

  measure: total_attachment_views_to_25 {
    type: sum_distinct
    group_label: "Attachment Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${attachment_views_at_25} ;;
  }

  measure: total_attachment_views_to_50 {
    type: sum_distinct
    group_label: "Attachment Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${attachment_views_at_50} ;;
  }

  measure: total_attachment_views_to_75 {
    type: sum_distinct
    group_label: "Attachment Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${attachment_views_at_75} ;;
  }

  measure: total_attachment_views_to_100 {
    type: sum_distinct
    group_label: "Attachment Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${attachment_views_at_100} ;;
  }

###### All Measures go Below ######

  measure: total_sessions {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${comp_key} ;;
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
    sql_distinct_key: ${comp_key};;
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
    sql_distinct_key: ${comp_key} ;;
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
    sql_distinct_key: ${comp_key} ;;
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
    sql_distinct_key: ${comp_key} ;;
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
    sql_distinct_key: ${comp_key} ;;
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
    sql_distinct_key: ${comp_key} ;;
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
    sql_distinct_key: ${comp_key} ;;
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
    sql_distinct_key: ${comp_key} ;;
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
    sql_distinct_key: ${comp_key} ;;
    sql: ${discover_sd} ;;
  }

  measure: total_plan_your_vacation {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Plan Your Vacation"
    sql_distinct_key: ${comp_key} ;;
    sql: ${plan_your_vacation} ;;
  }

  measure: total_spin_wheel_button {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Wheel Spins"
    sql_distinct_key: ${comp_key} ;;
    sql: ${spin_wheel_button} ;;
  }

  measure: total_wheel_drag {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Wheel Drags"
    sql_distinct_key: ${comp_key} ;;
    sql: ${wheel_drag} ;;
  }

  measure: total_wheel_click {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Wheel Clicks"
    sql_distinct_key: ${comp_key} ;;
    sql: ${wheel_click} ;;
  }

  measure: total_visitor_planning_guide {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Visitor Planning Guide"
    sql_distinct_key: ${comp_key} ;;
    sql: ${visitor_planning_guide} ;;
  }

  measure: total_staying_in_touch {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Staying In Touch"
    sql_distinct_key: ${comp_key} ;;
    sql: ${staying_in_touch} ;;
  }

  measure: total_hotel_search {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Hotel Searches"
    sql_distinct_key: ${comp_key} ;;
    sql: ${hotel_search} ;;
  }

  measure: total_purchases {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Purchases"
    sql_distinct_key: ${comp_key} ;;
    sql: ${purchases} ;;
  }

}
