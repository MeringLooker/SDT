view: sdt_fb_view {
  sql_table_name: public.sdt_fb_view ;;
  drill_fields: [id]

###### Primary Key #######

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: thruplay_join_id {
    hidden: yes
    type: string
    sql: ${ad_id}||'_'||${date_start_date} ;;
  }

##### Dimensions added to this table via LookML #####

  dimension: publisher {
    type: string
    hidden: yes
    sql: 'Facebook' ;;
  }

#   dimension: ad_type {
#     type: string
#     group_label: "Facebook Dimensions"
#     sql:
#      CASE
#        when ${ad_name} ilike '%SingleImage%' then 'Single Image'
#        when ${ad_name} ilike '%Carousel%' then 'Carousel'
#        when ${ad_name} ilike '%Video%' then 'Video'
#        when ${ad_name} ilike '%Stories%' then 'Story'
#        when ${ad_name} ilike '%Canvas%' then 'Canvas'
#        ELSE 'Uncategorized'
#       END;;
#     drill_fields: [ad_name]
#   }

  dimension: fiscal_year {
    label: "Fiscal Year"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${date_start_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
        WHEN ${date_start_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
        WHEN ${date_start_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${date_start_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${date_start_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
    drill_fields: [campaign_name]
  }

  dimension: sdt_market {
    label: "Market"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE

        WHEN ${campaign_name} ILIKE '%_CAN\\_%' then 'Canada'
        WHEN ${campaign_name} ILIKE '%_MEX\\_%' then 'Mexico'
        WHEN ${campaign_name} ILIKE '%_UK\\_%' then 'United Kingdom'
        WHEN ${campaign_name} ILIKE '%_GER\\_%' then 'Germany'
        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National' then 'United States'
        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National_Adara' then 'United States'
        when ${campaign_name} ilike 'FY19_DigitalVideo%' then 'United States'
        when ${campaign_name} ilike 'FY20_DigitalVideo%' then 'United States'
        WHEN ${campaign_name} ILIKE 'SDT_FY20_FallPromo%' then 'United States'
        WHEN ${campaign_name} ILIKE 'SDT_FY20_AlwaysOnContent%' then 'United States'
        WHEN ${campaign_name} ILIKE 'FY19_Content%' then 'United States'
        WHEN ${campaign_name} ILIKE '1718_Content%' then 'United States'
        WHEN ${campaign_name} ILIKE 'FY19_AAY%' then 'United States'


        else 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_region {
    label: "Region"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        when ${campaign_name} ilike '%PHX%' then 'Phoenix'

        when ${campaign_name} ilike '%_Phoenix\\_%' then 'Phoenix'
        when ${campaign_name} ilike '%_National\\_%' then 'National'
        when ${campaign_name} ilike '%_National%' then 'National'
        when ${campaign_name} ilike '%_LosAngeles\\_%' then 'Los Angeles'
        when ${campaign_name} ilike '%_SanFrancisco\\_%' then 'San Francisco'
        when ${campaign_name} ilike '%_NewYork\\_%' then 'New York'

        when ${campaign_name} ilike 'FY19_DigitalVideo%' then 'National'
        when ${campaign_name} ilike 'FY20_DigitalVideo%' then 'National'

        when ${campaign_name} ilike '%_Traffic\\_LA\\_%' then 'Los Angeles'
        when ${campaign_name} ilike '%_Video\\_LA\\_%' then 'Los Angeles'
        when ${adset_name} ilike '%_Stage3\\_Video\\_LA\\_%' then 'Los Angeles'


        when ${campaign_name} ilike 'PHX\\_%' then 'Phoenix'
        when ${campaign_name} ilike 'National\\_%' then 'National'
        when ${campaign_name} ilike 'LA\\_%' then 'Los Angeles'
        when ${campaign_name} ilike 'Regional\\_%' then 'Regional'

        else 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_campaign {
    label: "Campaign"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${campaign_name} ILIKE '%AlwaysOnContent%' then 'Always On Content'
        WHEN ${campaign_name} ILIKE 'FY19_Content_Stage%' then 'Always On Content'
        WHEN ${campaign_name} ILIKE 'FY19_Content_Family%' then 'Family Content'
        WHEN ${campaign_name} ILIKE 'SDTA Kids Free%' then 'Kids Free'
        WHEN ${campaign_name} ILIKE '1718_Content%' then 'Always On Content'
        WHEN ${campaign_name} ILIKE '1718_BrandCampaign_\\CAN%' then 'Canada Digital'
        WHEN ${campaign_name} ILIKE '1718_BrandCampaign_\\GER%' then 'Germany Digital'
        WHEN ${campaign_name} ILIKE '1718_BrandCampaign_\\SWZ%' then 'Switzerland Digital'
        WHEN ${campaign_name} ILIKE '1718_BrandCampaign_\\UK%' then 'United Kingdom Digital'

        WHEN ${campaign_name} ILIKE 'SDT_FY20_FallPromo%' then 'Fall Promos'
        WHEN ${campaign_name} ILIKE '%_DigitalVideo\\_%' then 'Brand Digital Video'
        WHEN ${campaign_name} ILIKE '%AAY%' then 'Awesome All Year'
        WHEN ${campaign_name} ILIKE 'FY19_Holiday_%%' then 'SD For The Holidays'
        WHEN ${campaign_name} ILIKE 'SDT_FY20_PullThrough_%' then 'US Pull-Through'
        WHEN ${campaign_name} ILIKE 'SDT_FY20_CAN\\_%' then 'Canada Digital'
        WHEN ${campaign_name} ILIKE 'FY19_CAN\\_%' then 'Canada Digital'
        WHEN ${campaign_name} ILIKE 'FY19_MEX_%' then 'Mexico Digital'
        WHEN ${campaign_name} ILIKE 'SDT_FY20_UK_%' then 'United Kingdom Digital'
        WHEN ${campaign_name} ILIKE 'FY19_UK_%' then 'United Kingdom Digital'
        WHEN ${campaign_name} ILIKE 'FY19_GER_%' then 'Germany Digital'

        else 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_layer {
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National' then 'Pull-Through Base'
        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National_Adara' then 'Pull-Through Base'

        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_Conversions%' then 'Macro Traffic'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Conversions%' then 'Micro Traffic'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_VideoViews%' then 'Macro Video'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_VideoViews%' then 'Micro Video'

        when ${campaign_name} ilike '%Macro_Traffic%' then 'Macro Traffic'
        when ${campaign_name} ilike '%Micro_Traffic%' then 'Micro Traffic'
        when ${campaign_name} ilike '%PullThrough_Traffic%' then 'Micro Traffic'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_VideoViews%' then 'Macro Video'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_VideoViews%' then 'Micro Video'

        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Nano_Conversions%' then 'Nano Traffic'

        when ${campaign_name} ilike 'SDT_FY20_UK_Views_Content%' then 'Storytelling'
        when ${campaign_name} ilike 'SDT_FY20_UK_Conversions_Content%' then 'Storytelling'
        when ${campaign_name} ilike 'SDT_FY20_CAN_Views_Content%' then 'Storytelling'
        when ${campaign_name} ilike 'SDT_FY20_CAN_Conversions_Content%' then 'Storytelling'
        when ${campaign_name} = 'FY19_CAN_Clicks' then 'Storytelling'
        when ${campaign_name} = 'FY19_CAN_Views' then 'Storytelling'
        when ${campaign_name} = 'FY19_CAN_Views_Flight2b' then 'Storytelling'
        when ${campaign_name} = 'FY19_CAN_Clicks_Flight2b' then 'Storytelling'

        when ${campaign_name} ilike 'SDT_FY20_CAN_Views_Brand%' then 'Amplify Reach'
        when ${campaign_name} ilike 'SDT_FY20_UK_Views_Brand%' then 'Amplify Reach'
        when ${campaign_name} = 'FY19_UK_BrandVideo' then 'Amplify Reach'

        else 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_audience {
    label: "Audience"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National' then 'Brand Audience'
        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National_Adara' then 'Adara Audience'

        when ${campaign_name} ilike 'FY20_DigitalVideo_Views_Retargeting%' then 'Retargeting'
        when ${campaign_name} ilike 'FY19_DigitalVideo_Views_Retargeting%' then 'Retargeting'
        when ${campaign_name} ilike 'FY20_DigitalVideo_Views_Brand%' then 'Brand'
        when ${campaign_name} ilike 'FY20_DigitalVideo_Views_Family%' then 'Family'
        when ${adset_name} = 'FY19_DigitalVideo_Views_Brand' then 'Brand'
        when ${adset_name} = 'FY19_DigitalVideo_Views_Family' then 'Family'

        else 'Uncategorized'
        end
        ;;
  }

  dimension: creative_name {
    label: "Creative Name"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        when ${ad_name} ilike '%\\_SingleImage\\_DadDaughter' then 'Dad & Daughter'
        when ${ad_name} ilike '%\\_SingleImage\\_PoolParty' then 'Pool Party'
        when ${ad_name} ilike '%\\_SingleImage\\_FamilyBeach' then 'Beach Family'
        when ${ad_name} ilike '%\\_SingleImage\\_Dinner' then 'Dinner'
        when ${ad_name} ilike '%\\_SingleImage\\_FriendsBeach' then 'Beach Friends'
        when ${ad_name} ilike '%\\_SingleImage\\_RollerGirls' then 'Roller Girls'

        when ${ad_id} = '6145540612895' then 'Find Your Smile in San Diego (:15)'
        when ${ad_id} = '6145465999895' then 'Find Your Smile in San Diego (:15)'
        when ${ad_id} = '6145468600295' then 'Mister As (:15)'
        when ${ad_id} = '6145472201095' then 'Surfer Couple (:15)'
        when ${ad_id} = '6145471718695' then 'Torrey Pines (:15)'
        when ${ad_id} = '6145471963495' then 'Coffee Cup Coastal (:15)'
        when ${ad_id} = '6145468172895' then 'Share a Smile in San Diego (:15)'
        when ${ad_id} = '6125364617895' then 'Torrey Pines (:15)'
        when ${ad_id} = '6125364617295' then 'Surfer Couple (:15)'
        when ${ad_id} = '6125364619295' then 'Coffee Cup Coastal (:15)'
        when ${ad_id} = '6125364811695' then 'Mister As (:15)'
        when ${ad_id} = '6124965692695' then 'Share a Smile in San Diego (:15)'
        when ${ad_id} = '6161410795695' then 'Share a Smile in San Diego (:15)'
        when ${ad_id} = '6124964015495' then 'Find Your Smile in San Diego (:15)'
        when ${ad_id} = '6161411294495' then 'Find Your Smile in San Diego (:15)'
        when ${ad_id} = '6162106088495' then 'Find Your Smile in San Diego (:15)'
        when ${ad_id} = '6161411295095' then 'Mister As (:15)'
        when ${ad_id} = '6161411295295' then 'Surfer Couple (:15)'
        when ${ad_id} = '6161411294695' then 'Torrey Pines (:15)'
        when ${ad_id} = '6161411294095' then 'Coffee Cup Coastal (:15)'

        else 'Uncategorized'
        end
        ;;
  }

##### All Dimensions go below #####

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

  dimension: account_id {
    type: number
    hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    hidden: yes
    sql: ${TABLE}.account_name ;;
  }

  dimension: ad_id {
    type: number
    group_label: "Facebook IDs"
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.ad_name ;;
  }

  dimension: adset_id {
    type: number
    group_label: "Facebook IDs"
    sql: ${TABLE}.adset_id ;;
  }

  dimension: adset_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.adset_name ;;
  }

  dimension: buying_type {
    type: string
    hidden: yes
    sql: ${TABLE}.buying_type ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "Facebook IDs"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: comp_key {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key ;;
  }

  dimension: comp_key_backup {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key_backup ;;
  }

  dimension: cost_per_inline_post_engagement {
    type: number
    hidden: yes
    sql: ${TABLE}.cost_per_inline_post_engagement ;;
  }

  dimension: cost_per_unique_click {
    type: number
    hidden: yes
    sql: ${TABLE}.cost_per_unique_click ;;
  }

  dimension: country {
    type: string
    hidden: yes
    map_layer_name: countries
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.country ;;
  }

  dimension: cpm {
    type: number
    hidden: yes
    sql: ${TABLE}.cpm ;;
  }

  dimension: cpp {
    type: number
    hidden: yes
    sql: ${TABLE}.cpp ;;
  }

  dimension: ctr {
    type: number
    hidden: yes
    sql: ${TABLE}.ctr ;;
  }

  dimension_group: date_start {
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
    sql: ${TABLE}.date_start ;;
  }

  dimension_group: date_stop {
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
    sql: ${TABLE}.date_stop ;;
  }

  dimension: frequency {
    type: number
    hidden: yes
    sql: ${TABLE}.frequency ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: inline_link_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.inline_link_clicks ;;
  }

  dimension: inline_post_engagement {
    type: number
    hidden: yes
    sql: ${TABLE}.inline_post_engagement ;;
  }

  dimension: objective {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.objective ;;
  }

  dimension: reach {
    type: number
    hidden: yes
    sql: ${TABLE}.reach ;;
  }

  dimension: spend {
    type: number
    hidden: yes
    sql: ${TABLE}.spend ;;
  }

  dimension: unique_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_clicks ;;
  }

  dimension: unique_ctr {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_ctr ;;
  }

#### All Measures go below ####

  measure: total_impressions {
    type: sum
    label: "Impressions"
    group_label: "Facebook Reporting"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum
    label: "Clicks"
    group_label: "Facebook Reporting"
    sql: ${inline_link_clicks} ;;
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    group_label: "Facebook Reporting"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_spend {
    type: sum
    label: "Media Spend"
    group_label: "Facebook Reporting"
    sql: ${spend};;
    value_format_name: usd
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    group_label: "Facebook Reporting"
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    group_label: "Facebook Reporting"
    sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

#### Joined FB Action Measures #####

  measure: video_views {
    type: sum_distinct
    sql_distinct_key: ${facebookads__mc_visit_san_diego_actions.id};;
    label: ":03 Video Views"
    group_label: "Video Reporting"
    sql:
      CASE
      WHEN ${facebookads__mc_visit_san_diego_actions.action_type} = 'video_view' THEN ${facebookads__mc_visit_san_diego_actions.value}
      else null
      END;;
  }

  measure: video_completes {
    type: sum_distinct
    label: "Views to 100%"
    group_label: "Video Quartiles"
    sql_distinct_key: ${facebookads__mc_visit_san_diego_video_p100_watched_actions.id};;
    sql: ${facebookads__mc_visit_san_diego_video_p100_watched_actions.value} ;;
  }

  measure: video_completion_rate {
    type: number
    label: "Vid. Completion Rate"
    group_label: "Video Quartiles"
    sql: 1.0*${video_completes}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

#### Joined FB Action Measures #####

  measure: view_rate {
    type: number
    group_label: "Video Reporting"
    label: ":03 View Rate"
    sql: 1.0*(${video_views}/nullif(${total_impressions}, 0) ;;
  }

  measure: view_to_25_percent {
    type: sum_distinct
    group_label: "Video Quartiles"
    label: "Views to 25%"
    sql_distinct_key: ${facebookads__mc_visit_san_diego_video_p25_watched_actions.id};;
    sql: ${facebookads__mc_visit_san_diego_video_p25_watched_actions.value} ;;
  }

  measure: view_to_50_percent {
    type: sum_distinct
    group_label: "Video Quartiles"
    label: "Views to 50%"
    sql_distinct_key: ${facebookads__mc_visit_san_diego_video_p50_watched_actions.id};;
    sql: ${facebookads__mc_visit_san_diego_video_p50_watched_actions.value} ;;
  }

  measure: view_to_75_percent {
    type: sum_distinct
    group_label: "Video Quartiles"
    label: "Views to 75%"
    sql_distinct_key: ${facebookads__mc_visit_san_diego_video_p75_watched_actions.id};;
    sql: ${facebookads__mc_visit_san_diego_video_p75_watched_actions.value} ;;
  }

  measure: cost_per_03sec_view {
    type: number
    group_label: "Video Reporting"
    label: "CPV :03"
    sql: ${video_views}/nullif(${total_spend}, 0);;
    value_format_name: usd
  }

  measure: cost_per_100p_view {
    type: number
    group_label: "Video Quartiles"
    label: "Cost/Completed View"
    sql: ${video_completes}/nullif(${total_spend}, 0);;
    value_format_name: usd
  }

  #### Joined FB ThruPlays #####

  measure: total_thruplays {
    type: sum_distinct
    sql_distinct_key: ${sdt_fb_thruplays.id};;
    label: "ThruPlays"
    description: "This metrics is currently only available beyond July 1, 2019."
    group_label: "Video Reporting"
    sql: ${sdt_fb_thruplays.thruplays} ;;
  }

  measure: thruplay_rate {
    type: number
    group_label: "Video Reporting"
    label: "ThruPlay Rate"
    sql: 1.0*(${total_thruplays}/nullif(${total_impressions}, 0) ;;
  }

  measure: cost_per_thruplay {
    type: number
    group_label: "Video Reporting"
    label: "Cost/ThruPlay"
    sql: ${total_thruplays}/nullif(${total_spend}, 0);;
    value_format_name: usd
  }


  ####### Joined GA Measures #######

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
    sql: ${total_spend}/nullif(${ga_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: ga_total_session_duration {
    hidden: yes
    group_label: "GA Reporting"
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

  measure: ga_total_users {
    group_label: "GA Reporting"
    label: "Users"
    type: sum_distinct
    sql_distinct_key: ${sdt_ga_onsite.id};;
    sql: ${sdt_ga_onsite.users} ;;
  }

  measure: ga_new_users {
    group_label: "GA Reporting"
    label: "New Users"
    type: sum_distinct
    sql_distinct_key: ${sdt_ga_onsite.id};;
    sql: ${sdt_ga_onsite.newusers} ;;
  }

  measure: percent_new_users {
    group_label: "GA Reporting"
    label: "% New Users"
    type: number
    sql: ${ga_new_users}/nullif(${ga_total_users}, 0) ;;
    value_format_name: percent_0
  }

  measure: ga_total_pageviews {
    group_label: "GA Reporting"
    label: "Pageviews"
    type: sum_distinct
    sql_distinct_key: ${sdt_ga_onsite.id};;
    sql: ${sdt_ga_onsite.pageviews} ;;
  }

  measure: pages_per_session {
    group_label: "GA Reporting"
    label: "Pgs/Session"
    type: number
    sql: ${ga_total_pageviews}/nullif(${ga_sessions}, 0) ;;
    value_format: "#.0"
  }

  measure: count {
    type: count
    drill_fields: [id, campaign_name, ad_name, account_name, adset_name]
  }
}
