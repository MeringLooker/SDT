view: sdt_fy21_pullthrough_expedia {
  sql_table_name: public.sdt_fy21_pullthrough_expedia ;;

  ## Primary ID ##

  dimension: expedia_join_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.expedia_join_id ;;
  }

  dimension: bookings_join_id {
    hidden: yes
    type: string
    sql: ${line_item}||'_'||${date_month} ;;
  }

  dimension: expedia_line_creative_name {
    hidden: yes
    type: string
    sql: ${line_item}||'_'||${expedia_creative} ;;
  }

  ## Dimensions Added to this table via LookML ##

  dimension: publisher {
    type: string
    group_label: "Client Dimensions"
    sql: 'Expedia' ;;
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
          when ${line_item} ilike '001:%' then 'Western Region'
          when ${line_item} ilike '002:%' then 'Western Region'
          when ${line_item} ilike '003:%' then 'Western Region'
          when ${line_item} ilike '004:%' then 'Western Region'
          when ${line_item} ilike '005:%' then 'Western Region'
          when ${line_item} ilike '007:%' then 'Western Region'
          when ${line_item} ilike '008:%' then 'Western Region'
          when ${line_item} ilike '009:%' then 'Western Region'
          when ${line_item} ilike '010:%' then 'Western Region'
          when ${line_item} ilike '011:%' then 'California'
          when ${line_item} ilike '012:%' then 'California'
          when ${line_item} ilike '013:%' then 'California'
          when ${line_item} ilike '014:%' then 'California'
          when ${line_item} ilike '019:%' then 'Arizona'
          when ${line_item} ilike '020:%' then 'Arizona'
          when ${line_item} ilike '021:%' then 'Arizona'
          when ${line_item} ilike '022:%' then 'Arizona'
          else 'Uncategorized'
          end;;
  }

  dimension: ad_size {
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
          when ${mering_creative} ILIKE '%728x90%' then '728x90'
          when ${mering_creative} ILIKE '%300x250%' then '300x250'
          when ${mering_creative} ILIKE '%300x600%' then '300x600'
          when ${mering_creative} ILIKE '%160x600%' then '160x600'
          when ${mering_creative} ILIKE '%970x250%' then '970x250'
          when ${mering_creative} ilike '%\\_320x50' then '320x50'
          when ${mering_creative} ilike '%\\_468x60' then '468x60'
          when ${mering_creative} ilike '%\\_300x50' then '300x50'
          when ${mering_creative} ilike '%\\_970x90' then '970x90'
          when ${mering_creative} ilike '%\\_1320x742' then '1320x742'
          when ${mering_creative} ilike '%\\_474x250' then '474x250'
          when ${mering_creative} ilike '%\\_532x299' then '532x299'
          when ${mering_creative} ilike '%\\_680x320' then '680x320'
          when ${mering_creative} ilike '%_680x320' then '680x320'
          when ${mering_creative} ilike '%\\_562x240' then '562x240'

        ELSE 'Uncategorized'
        END;;
  }

  ## Dimensions Native to table ##

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

  dimension: creative_id {
    type: string
    hidden: yes
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

  dimension: expedia_creative {
    type: string
    label: "Expedia Creative"
    group_label: "Expedia Dimensions"
    sql: ${TABLE}.expedia_creative ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: line_item {
    type: string
    label: "Expedia Line Item"
    group_label: "Expedia Dimensions"
    sql: ${TABLE}.line_item ;;
  }

  dimension: line_item_id {
    type: string
    hidden: yes
    sql: ${TABLE}.line_item_id ;;
  }

  dimension: mering_creative {
    type: string
    label: "Creative Name"
    group_label: "Client Dimensions"
    sql: ${TABLE}.mering_creative ;;
  }

  dimension: mering_placement {
    type: string
    label: "Placement Name"
    group_label: "Client Dimensions"
    sql: ${TABLE}.mering_placement ;;
  }

######### All measures go below ########

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${expedia_join_id} ;;
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${expedia_join_id} ;;
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
    sql_distinct_key: ${expedia_join_id} ;;
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
