view: sdt_yt_ga_view {
  sql_table_name: public.sdt_yt_ga_view ;;

###### Primary Key #######

  dimension: comp_key {
    type: string
    primary_key: yes
    hidden: yes
    group_label: "Trueview IDs"
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
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: advertising_channel {
    type: string
    hidden: yes
    label: "Channel"
    group_label: "TrueView Dimensions"
    sql: 'Video'
      ;;
  }

  dimension: publisher {
    type: string
    hidden: yes
    sql: 'YouTube' ;;
  }

  dimension: sdt_market {
    type: string
    label: "Market"
    group_label: "Client Dimensions"
    sql:
      case
        when ${account} = 'SDTA CAN TrueView' then 'Canada'
        when ${account} = 'SDTA UK TrueView' then 'United Kingdom'
        when ${account} = 'SDTA Content TrueView LA' then 'United States'
        when ${account} = 'SDTA Content TrueView PHX' then 'United States'
        when ${account} = 'SDTA Content TrueView US' then 'United States'
        when ${account} = 'SDTA Digital Video TrueView' then 'United States'
        when ${account} ilike 'SDTA Family Content%' then 'United States'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_region {
    type: string
    label: "Region"
    group_label: "Client Dimensions"
    sql:
      case

        when ${account} = 'SDTA Content TrueView US' then 'National'
        when ${account} = 'SDTA Content TrueView PHX' then 'Phoenix'
        when ${account} = 'SDTA Content TrueView LA' then 'Los Angeles'

        when ${account} = 'SDTA CAN TrueView' then 'National'
        when ${account} = 'SDTA UK TrueView' then 'National'
        when ${account} ilike 'SDTA Family Content%' then 'National'
        when ${account} = 'SDTA Digital Video TrueView' then 'National'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_campaign {
    type: string
    label: "Campaign"
    group_label: "Client Dimensions"
    sql:
      case
        when ${account} = 'SDTA Digital Video TrueView' then 'Brand Digital Video'
        when ${account} ilike 'SDTA Content Trueview%' then 'Always On Content'
        when ${account} = 'SDTA UK TrueView' then 'United Kingdom Digital'
       when ${account} = 'SDTA CAN TrueView' then 'Canada Digital'
      WHEN ${campaign} ILIKE 'SDT_FY20_FamilyContent%' then 'Family Content'
       ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_layer {
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign} ilike '%SDTA - UK - Content%' then 'Storytelling'
        when ${campaign} ilike '%SDTA - UK - Brand%' then 'Amplify Reach'
        when ${campaign} ilike '%SDTA - CAN - Content%' then 'Storytelling'
        when ${campaign} ilike '%SDTA - CAN - Brand%' then 'Amplify Reach'

        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Macro%' then 'Macro Video'
        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Micro%' then 'Micro Video'

        when ${campaign} ilike 'SDT_FY20_FamilyContent_Macro_TrueView%' then 'Macro Video'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_placement {
    type: string
    label: "Campaign Placement"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign} ilike 'SDTA - UK - Brand - Retargeting - FY20%' then 'Awareness - Retargeting'
        when ${campaign} ilike 'SDTA - UK - Brand - FY20%' then 'Awareness - Variety Seeker'

        when ${campaign} ilike 'SDTA - CAN - Brand - Retargeting - FY20%' then 'Brand Skippable Pre-Roll Video - Retargeting'
        when ${campaign} ilike 'SDTA - CAN - Brand - FY20%' then 'Brand Skippable Pre-Roll Video - Variety Seeker'

        when ${campaign} ilike 'SDTA - CAN - Content - Retargeting - FY20%' then 'Content Skippable Pre-Roll Video - Retargeting'
        when ${campaign} ilike 'SDTA - CAN - Content - FY20%' then 'Content Skippable Pre-Roll Video - Variety Seeker'

        when ${ad_group} ilike 'SDTA - Content - VS - Combined Audience' then 'Content - Variety Seeker'
        when ${ad_group} ilike 'SDTA - Content - Retargeting - Content Video Viewers%' then 'Content - Retargeting Content'
        when ${ad_group} ilike 'SDTA - Content - Retargeting - Brand Video Viewers%' then 'Content - Retargeting Brand'

        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Macro_TrueView_Outdoor%' then 'YouTube TrueView - Macro Outdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_TrueView_NonOutdoor%' then 'YouTube TrueView - Macro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_TrueView_NonOutdoor%' then 'YouTube TrueView - Macro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_TrueView_Attractions%' then 'YouTube TrueView - Macro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_TrueView_Neighborhood%' then 'YouTube TrueView - Macro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_TrueView_Culinary%' then 'YouTube TrueView - Macro NonOutdoor'

        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_TrueView_Outdoor%' then 'YouTube TrueView - Micro Outdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_TrueView_NonOutdoor%' then 'YouTube TrueView - Micro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_TrueView_NonOutdoor%' then 'YouTube TrueView - Micro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_TrueView_Attractions%' then 'YouTube TrueView - Micro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_TrueView_Neighborhood%' then 'YouTube TrueView - Micro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_TrueView_Culinary%' then 'YouTube TrueView - Micro NonOutdoor'

        when ${campaign} ilike 'SDT_FY20_FamilyContent_Macro_TrueView%' then 'Skippable Pre-Roll Video'


        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_pillar {
    type: string
    label: "Pillar"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Macro_TrueView_Outdoor%' then 'Outdoor'
        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Macro_TrueView_NonOutdoor%' then 'Non-Outdoor'
        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Macro_TrueView_Attractions%' then 'Attractions'
        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Macro_TrueView_Neighborhood%' then 'Neighborhood'
        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Macro_TrueView_Culinary%' then 'Culinary'

        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_TrueView_Outdoor%' then 'Outdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_TrueView_Attractions%' then 'Attractions'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_TrueView_Neighborhood%' then 'Neighborhood'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_TrueView_Culinary%' then 'Culinary'


        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_audience {
    type: string
    label: "Audience"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign_id} = '1656164085' then 'Brand'
        when ${campaign_id} = '1656164088' then 'Family'
        when ${campaign} ilike 'SDTA - Digital Video - Retargeting' then 'Retargeting'

        when ${campaign} ilike '%SDTA - CAN - Content - Retargeting %' then 'Retargeting'
        when ${campaign} ilike '%SDTA - UK - Content - Retargeting%' then 'Retargeting'
        when ${campaign} ilike '%SDTA - UK - Brand - Retargeting%' then 'Retargeting'
        when ${campaign} ilike '%SDTA - CAN - Brand - Retargeting%' then 'Retargeting'

        when ${campaign} ilike '%SDTA - UK - Content - FY20%' then 'Variety Seeker'
        when ${campaign} ilike '%SDTA - UK - Brand - FY20%' then 'Variety Seeker'
        when ${campaign} ilike '%SDTA - CAN - Content - FY20%' then 'Variety Seeker'
        when ${campaign} ilike '%SDTA - CAN - Brand - FY20%' then 'Variety Seeker'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: creative_name {
    type: string
    label: "Creative Name"
    group_label: "Client Dimensions"
    sql:
      case
        when ${ad_group_id} = '64714221278' then 'Surfer Couple (:30)'
        when ${ad_group_id} = '64714221078' then 'Coffee Cup Coastal (:30)'
        when ${ad_group_id} = '64714221118' then 'Torrey Pines (:30)'
        when ${ad_group_id} = '64714221318' then 'Mister As (:30)'
        when ${ad_group_id} = '76924755746' then 'Smiles - Destination (:30)'

        when ${campaign_id} = '1656164085' then 'Happy Today (:30) - Brand'
        when ${campaign_id} = '1656164088' then 'Happy Today (:30) - Family'

        when ${campaign} ilike '%SDTA - UK - Brand - FY20%' then 'Happy Today (:30)'
        when ${campaign} ilike '%SDTA - UK - Brand - Retargeting - FY20%' then 'Smiles - Destination (:40)'

        when ${campaign} ilike 'SDTA - CAN - Brand - FY20' then 'Find Your Smile in San Diego (:30)'
        when ${campaign} ilike 'SDTA - CAN - Brand - Retargeting - FY20' then 'Smiles - Destination (:40)'

        when ${campaign} ilike 'SDT_FY20_FamilyContent_Macro_TrueView_Legoland' then 'Lego Movie World (:60)'

        when ${campaign} ilike 'SDT_FY20_FamilyContent_Macro_TrueView_Legoland' then 'Lego Movie World (:60)'
        when ${campaign} ilike 'SDT_FY20_FamilyContent_Macro_TrueView_SanDiegoZoo' then 'Caravan Safari (:60)'
        when ${campaign} ilike 'SDT_FY20_FamilyContent_Macro_TrueView_Seaworld' then 'SeaWorld (:60)'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_partner {
    type: string
    group_label: "Client Dimensions"
    label: "SDT Partner (Fam. Content)"
    sql:
    case
      when ${account} ilike '%Family Content Seaworld' then 'SeaWorld'
      when ${account} ilike '%Family Content San Diego Zoo' then 'San Diego Zoo'
      when ${account} ilike '%Family Content San Diego Tourism' then 'San Diego Tourism'
      when ${account} ilike '%Family Content Legoland' then 'LegoLand'

      ELSE null
      END;;
  }

###### All dimensions go below #######

  dimension: account {
    type: string
    group_label: "Trueview Dimensions"
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    group_label: "Trueview Dimensions"
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: string
    group_label: "Trueview IDs"
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: campaign {
    type: string
    group_label: "Trueview Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "Trueview IDs"
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
    type: time
    label: ""
    group_label: "Date Periods"
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

  dimension: views {
    type: number
    hidden: yes
    sql: ${TABLE}.views ;;
  }

  dimension: views_to_q100 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_q100 ;;
  }

  dimension: views_to_q25 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_q25 ;;
  }

  dimension: views_to_q50 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_q50 ;;
  }

  dimension: views_to_q75 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_q75 ;;
  }

  dimension: wheel_interactions {
    type: number
    hidden: yes
    sql: ${TABLE}.wheel_interactions ;;
  }

###### All Measures go Below #######

  measure: total_impressions {
    type: sum_distinct
    group_label: "Delivery Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "Delivery Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type:  sum_distinct
    group_label: "Delivery Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql:${cost}/1000000.00  ;;
    value_format_name: usd
  }

  measure: total_conversions {
    type: sum_distinct
    group_label: "Conversion Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql: ${conversions} ;;
  }

  measure: click_through_rate  {
    label: "CTR"
    group_label: "Delivery Metrics"
    type: number
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    label: "CPC"
    group_label: "Delivery Metrics"
    type: number
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand  {
    label: "CPM"
    group_label: "Delivery Metrics"
    type: number
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_conversion_rate  {
    label: "CVR"
    group_label: "Conversion Reporting"
    type: number
    sql: ${total_conversions}/nullif(${total_clicks}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_conversion {
    label: "CPA"
    group_label: "Conversion Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_conversions} ,0);;
    value_format_name: usd
  }

  measure: total_views {
    type: sum_distinct
    label: "Video Views"
    group_label: "Delivery Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${views} ;;
  }

  measure: cost_per_view {
    label: "CPV"
    group_label: "Delivery Metrics"
    type: number
    sql: ${total_cost}/nullif(${total_views}, 0) ;;
    value_format_name: usd
  }

  measure: total_views_to_q25 {
    type: sum_distinct
    group_label: "Quartile Reporting"
    label: "Views To 25%"
    value_format_name: decimal_0
    hidden: no
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_to_q25} ;;
  }

  measure: total_views_to_q50 {
    type: sum_distinct
    group_label: "Quartile Reporting"
    label: "Views To 50%"
    value_format_name: decimal_0
    hidden: no
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_to_q50} ;;
  }

  measure: total_views_to_q75 {
    type: sum_distinct
    group_label: "Quartile Reporting"
    label: "Views To 75%"
    value_format_name: decimal_0
    hidden: no
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_to_q75} ;;
  }

  measure: total_video_completes {
    type: sum_distinct
    value_format_name: decimal_0
    label: "Video Completes"
    group_label: "Delivery Metrics"
    hidden: no
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_to_q100} ;;
  }

  measure: view_at_q25_rate  {
    label: "% Played to 25%"
    group_label: "Quartile Reporting"
    type: number
    sql: ${total_views_to_q25}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: view_at_q50_rate  {
    label: "% Played to 50%"
    group_label: "Quartile Reporting"
    type: number
    sql: ${total_views_to_q50}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: view_at_q75_rate  {
    label: "% Played to 75%"
    group_label: "Quartile Reporting"
    type: number
    sql: ${total_views_to_q75}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: view_rate  {
    label: "View Rate"
    group_label: "Delivery Metrics"
    type: number
    sql: ${total_views}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: completion_rate  {
    label: "Completion Rate"
    group_label: "Delivery Metrics"
    type: number
    sql: ${total_video_completes}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

####### Google Analytics Measures #######

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
    sql: ${sessions} ;;
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
}