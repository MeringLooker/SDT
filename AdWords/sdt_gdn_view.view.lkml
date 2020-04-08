view: sdt_gdn_view {
  sql_table_name: public.sdt_gdn_view ;;

###### Primary Key #######

  dimension: comp_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.comp_key ;;
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
    label: "Channel"
    group_label: "AdWords Dimensions"
    sql: 'Display'
      ;;
  }

  dimension: ad_size {
    type: string
    label: "Ad Size"
    group_label: "AdWords Dimensions"
    sql:
      case
        when ${campaign} = 'SDTA - Balboa - Cultural VS - GDN Responsive' then 'Responsive Display'
        when ${campaign} = 'SDTA - Balboa - Retargeting - GDN Responsive' then 'Responsive Display'
        when ${campaign} = 'SDT_FY20_PullThrough_National' then 'Responsive Display'
        else null
        end
      ;;
  }

  dimension: publisher {
    type: string
    label: "Publisher"
    group_label: "AdWords Dimensions"
    sql: 'Google Display'
      ;;
  }

  dimension: sdt_market {
    type: string
    label: "Market"
    group_label: "Client Dimensions"
    sql:
      case
        when ${account} = 'SDTA UK GDN' then 'United Kingdom'
        when ${account} = 'SDTA CAN GDN' then 'Canada'
        when ${account} = 'SDTA Pull-Through GDN' then 'United States'
        when ${account} = 'SDTA Content GDN US' then 'United States'
        when ${account} = 'SDTA Content GDN PHX' then 'United States'
        when ${account} = 'SDTA Content GDN LA' then 'United States'
        when ${account} = 'SDTA Balboa Park GDN' then 'United States'

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
        when ${account} = 'SDTA Content GDN US' then 'National'
        when ${account} = 'SDTA Content GDN PHX' then 'Phoenix'
        when ${account} = 'SDTA Content GDN LA' then 'Los Angeles'

        when ${campaign_id} = '1382958131' then 'National'
        when ${campaign_id} = '1382958149' then 'National'
        when ${campaign_id} = '1382958143' then 'National'
        when ${campaign_id} = '1382957999' then 'National'
        when ${campaign_id} = '1382958137' then 'National'
        when ${campaign_id} = '1382958140' then 'National'
        when ${campaign_id} = '1382958128' then 'National'
        when ${campaign_id} = '1382958125' then 'National'
        when ${campaign_id} = '1382958134' then 'National'
        when ${campaign_id} = '1382958122' then 'National'
        when ${campaign_id} = '1382958146' then 'National'
        when ${campaign_id} = '1382957996' then 'National'

        when ${campaign_id} = '1628518746' then 'National'
        when ${campaign_id} = '1627895647' then 'National'
        when ${campaign_id} = '1627895698' then 'National'
        when ${campaign_id} = '1628246777' then 'National'
        when ${campaign_id} = '1628248697' then 'National'
        when ${campaign_id} = '1628498397' then 'National'

        when ${campaign_id} = '1876499432' then 'National'
        when ${campaign_id} = '1876499438' then 'National'
        when ${campaign_id} = '1876499435' then 'National'
        when ${campaign_id} = '1876499441' then 'National'
        when ${campaign_id} = '1876499447' then 'National'
        when ${campaign_id} = '1876499444' then 'National'
        when ${campaign_id} = '1653845174' then 'National'
        when ${campaign_id} = '1655248509' then 'National'
        when ${campaign} = 'SDT_FY20_PullThrough_National' then 'National'

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
        when ${account} = 'SDTA UK GDN' then 'United Kingdom Digital'
        when ${account} = 'SDTA CAN GDN' then 'Canada Digital'
        when ${campaign} = 'SDT_FY20_PullThrough_National' then 'US Pull-Through'
        when ${account} = 'SDTA Content GDN US' then 'Always On Content'
        when ${account} = 'SDTA Content GDN PHX' then 'Always On Content'
        when ${account} = 'SDTA Content GDN LA' then 'Always On Content'

        when ${campaign_id} = '1628518746' then 'US Pull-Through'
        when ${campaign_id} = '1627895647' then 'US Pull-Through'
        when ${campaign_id} = '1627895698' then 'US Pull-Through'
        when ${campaign_id} = '1628246777' then 'US Pull-Through'
        when ${campaign_id} = '1628248697' then 'US Pull-Through'
        when ${campaign_id} = '1628498397' then 'US Pull-Through'

        when ${campaign_id} = '1876499432' then 'US Pull-Through'
        when ${campaign_id} = '1876499438' then 'US Pull-Through'
        when ${campaign_id} = '1876499435' then 'US Pull-Through'
        when ${campaign_id} = '1876499441' then 'US Pull-Through'
        when ${campaign_id} = '1876499447' then 'US Pull-Through'
        when ${campaign_id} = '1876499444' then 'US Pull-Through'
        when ${campaign_id} = '1653845174' then 'US Pull-Through'
        when ${campaign_id} = '1655248509' then 'US Pull-Through'

        when ${campaign_id} = '1382958131' then 'Always On Content'
        when ${campaign_id} = '1382958149' then 'Always On Content'
        when ${campaign_id} = '1382958143' then 'Always On Content'
        when ${campaign_id} = '1382957999' then 'Always On Content'
        when ${campaign_id} = '1382958137' then 'Always On Content'
        when ${campaign_id} = '1382958140' then 'Always On Content'
        when ${campaign_id} = '1382958128' then 'Always On Content'
        when ${campaign_id} = '1382958125' then 'Always On Content'
        when ${campaign_id} = '1382958134' then 'Always On Content'
        when ${campaign_id} = '1382958122' then 'Always On Content'
        when ${campaign_id} = '1382958146' then 'Always On Content'
        when ${campaign_id} = '1382957996' then 'Always On Content'

        when ${account} = 'SDTA Balboa Park GDN' then 'Balboa Park Digital'

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
        when ${campaign} ilike 'SDTA - UK - Brand - Awareness - FY20%' then 'Amplify Reach'
        when ${campaign_id} = '1655713166' then 'Amplify Reach'
        when ${campaign_id} = '1661582078' then 'Amplify Reach'
        when ${campaign} = 'SDTA - CAN - Conversion - Responsive - FY20' then 'Amplify Reach'
        when ${campaign} = 'SDTA - CAN - Awareness - Static - FY20' then 'Amplify Reach'

        when ${campaign} = 'SDT_FY20_PullThrough_National' then 'Pull-Through Base'

        when ${campaign} ilike '%Consider - Targeting - PT - GDN' then 'Pull-Through Base'
        when ${campaign} ilike '%Active Eval - Retargeting - PT - GDN' then 'Pull-Through Base'


        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Nano%' then 'Nano Traffic'
        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Macro%' then 'Macro Traffic'
        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Micro%' then 'Micro Traffic'

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
        when ${ad_group_id} = '89533583427' then 'Static Display - Variety Seeker'
        when ${ad_group_id} = '92121636452' then 'Static Display - Variety Seeker'
        when ${ad_group_id} = '92121636852' then 'Static Display - Variety Seeker'
        when ${ad_group_id} = '92121636612' then 'Static Display - Variety Seeker'
        when ${ad_group_id} = '89533583467' then 'Static Display - Variety Seeker'
        when ${ad_group_id} = '92121636892' then 'Static Display - Variety Seeker'

        when ${ad_group_id} = '92121637092' then 'Static Display - Lookalike'
        when ${ad_group_id} = '89533583667' then 'Static Display - Lookalike'
        when ${ad_group_id} = '92121636692' then 'Static Display - Lookalike'

        when ${ad_group_id} = '92121636932' then 'Static Display - Competitive Destinations'
        when ${ad_group_id} = '89533583507' then 'Static Display - Competitive Destinations'
        when ${ad_group_id} = '92121636652' then 'Static Display - Competitive Destinations'


        when ${campaign} = 'SDTA - CAN - Conversion - Responsive - FY20' then 'Responsive Display'
        when ${campaign} = 'SDTA - CAN - Awareness - Static - FY20' then 'Static Display'

        when ${campaign} = 'SDTA - UK - Traffic - GDN Responsive - FY19' then 'Responsive Display'
        when ${campaign} = 'SDTA - UK - Impressions - GDN Display - FY19' then 'Static Display'

        when ${campaign} = 'SDT_FY20_PullThrough_National' then 'Responsive Display'

        when ${campaign} = 'SDTA - Balboa - Cultural VS - GDN Responsive' then 'Responsive Display - Cultural Variety Seeker'
        when ${campaign} = 'SDTA - Balboa - Retargeting - GDN Responsive' then 'Responsive Display - Website Retargeting'

        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Nano_GDN%' then 'Responsive Display - Retargeting'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Outdoor%' then 'Responsive Display - Micro Outdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Neighborhood%' then 'Responsive Display - Micro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Culinary%' then 'Responsive Display - Micro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Attractions%' then 'Responsive Display - Micro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_Outdoor%' then 'Responsive Display - Macro Outdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_NonOutdoor%' then 'Responsive Display - Macro NonOutdoor'

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
        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Nano_GDN%' then 'N/A'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Outdoor%' then 'Outdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Neighborhood%' then 'Neighborhood'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Culinary%' then 'Culinary'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Attractions%' then 'Attractions'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_Outdoor%' then 'Outdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_NonOutdoor_Neighborhood%' then 'Neighborhood'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_NonOutdoor_Culinary%' then 'Culinary'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_NonOutdoor_Attractions%' then 'Attractions'

        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_NonOutdoor%' then 'Non-Outdoor'

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
        when ${campaign} ilike '%SDTA - Static - Competitive%' then 'Competitive Destinations'
        when ${campaign} ilike '%SDTA - Static - LAL%' then 'Lookalike'
        when ${campaign} ilike '%SDTA - Static - VS Custom Intent%' then 'Variety Seeker'

        when ${ad_group_id} = '82341756398' then 'In-Market Travel'
        when ${ad_group_id} = '82341756638' then 'In-Market Travel'
        when ${ad_group_id} = '82341756718' then 'Lookalike'
        when ${ad_group_id} = '82341756478' then 'Lookalike'
        when ${ad_group_id} = '82341756678' then 'Variety Seeker'
        when ${ad_group_id} = '82341756438' then 'Variety Seeker'

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
        when ${campaign} ilike 'Surfer Couple - OMN%' then 'Surfer Couple'
        when ${campaign} ilike 'Surfer - Consider%' then 'Surfer Couple'
        when ${campaign} ilike 'Surfer - Active Eval%' then 'Surfer Couple'
        when ${campaign} ilike 'Running to Beach%' then 'Running to Beach'
        when ${campaign} ilike 'Mom Daughter%' then 'Mom Daughter'
        when ${campaign} ilike 'Girls on Van%' then 'Girls on Van'
        when ${campaign} ilike 'Beach Soccer%' then 'Beach Soccer'
        when ${campaign} ilike 'Beach Family%' then 'Beach Family'
        when ${campaign} ilike 'Beach People%' then 'Beach People'

        ELSE 'Uncategorized'
        end
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
    type: number
    group_label: "AdWords IDs"
    sql: ${TABLE}."ad group id" ;;
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
    type: time
    group_label: "Date Periods"
    label: ""
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

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: total_conv_value {
    type: number
    hidden: yes
    sql: ${TABLE}.total_conv_vale ;;
  }

  dimension: sessions {
    type: number
    hidden: yes
    sql: ${TABLE}.sessions ;;
  }

  dimension: sessionduration {
    type: number
    hidden: yes
    sql: ${TABLE}.sessionduration ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: pageviews {
    type: number
    hidden: yes
    sql: ${TABLE}.pageviews ;;
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

  ###### All Measures go Below #######

  measure: total_impressions {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type:  sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql:${cost}/1000000.00  ;;
    value_format_name: usd
  }

  measure: total_conversions {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${comp_key} ;;
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
    sql_distinct_key: ${comp_key} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${comp_key} ;;
    sql: ${completes} ;;
  }

###### All Measures go Below ###### Joined to User Info instead of onsite because that's where device currently resides

  measure: total_sessions {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${comp_key} ;;
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    group_label: "GA Reporting"
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
    group_label: "GA Reporting"
    label: "Avg. TOS"
    type: number
    sql:  (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400  ;;
    value_format: "m:ss"
  }

  measure: total_pageviews {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Pageviews"
    sql_distinct_key: ${comp_key} ;;
    sql: ${sessions} ;;
  }

  measure: pages_per_session {
    group_label: "GA Reporting"
    type: number
    label: "Pages/Session"
    sql: ${total_pageviews}/nullif(${total_sessions}, 0) ;;
    value_format_name: decimal_2
  }

  measure: total_bounces {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Bounces"
    sql_distinct_key: ${comp_key} ;;
    sql: ${bounces} ;;
  }

  measure: total_bounce_rate  {
    label: "Bounce Rate"
    group_label: "GA Reporting"
    type: number
    sql: ${total_bounces}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: count {
    hidden: yes
    type: count
  }
}
