view: sdt_trueview_view {
  sql_table_name: public.sdt_trueview_view ;;
  drill_fields: [id]

##### ID for Table ####

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: quartiles_join_id {
    type: string
    hidden: yes
    sql: ${ad_group_id}||'_'||${day_date} ;;
  }

  dimension: trueview_join_id {
    type: string
    hidden: yes
    sql: ${sdt_trueview_quartiles.trueview_join} ;;
  }

####### Dimensions Added to this table via LookML #######

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
        when ${customer_id} = '4881077717' then 'Canada'
        when ${customer_id} = '7208478809' then 'United Kingdom'
        when ${customer_id} = '9373763201' then 'United States'
        when ${customer_id} = '2993077445' then 'United States'
        when ${customer_id} = '7618451325' then 'United States'
        when ${customer_id} = '2366121513' then 'United States'
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

        when ${customer_id} = '2993077445' then 'National'
        when ${customer_id} = '7618451325' then 'Phoenix'
        when ${customer_id} = '2366121513' then 'Los Angeles'

        when ${campaign_id} = '1656164091' then 'National'
        when ${campaign_id} = '1656164088' then 'National'
        when ${campaign_id} = '1656164085' then 'National'

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
        when ${customer_id} = '9373763201' then 'Brand Digital Video'
        when ${customer_id} = '2993077445' then 'Always On Content'
        when ${customer_id} = '7618451325' then 'Always On Content'
        when ${customer_id} = '2366121513' then 'Always On Content'
        when ${customer_id} = '7208478809' then 'United Kingdom Digital'
        when ${customer_id} = '4881077717' then 'Canada Digital'
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
        when ${ad_group_id} = '84098397302' then 'Awareness - Variety Seeker'
        when ${ad_group_id} = '84098397302' then 'Awareness - Retargeting'

        when ${ad_group_id} = '88436086482' then 'Content - Variety Seeker'
        when ${ad_group_id} = '88436086682' then 'Content - Retargeting Content'
        when ${ad_group_id} = '88436086522' then 'Content - Retargeting Brand '

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
        when ${ad_group_id} = '64714221278' then 'Surfer Sunsets (:30)'
        when ${ad_group_id} = '64714221078' then 'Coffee Cup Coastal (:30)'
        when ${ad_group_id} = '64714221118' then 'Gliderport (:30)'
        when ${ad_group_id} = '64714221318' then 'Mister As (:30)'
        when ${ad_group_id} = '76924755746' then 'Destination (:30)'

        when ${campaign_id} = '1656164085' then 'Find Your Smile in San Diego (:30)'
        when ${campaign_id} = '1656164088' then 'Share a Smile in San Diego (:30)'

        when ${campaign} ilike '%SDTA - UK - Brand - FY20%' then 'Find Your Smile in San Diego (:30)'

        ELSE 'Uncategorized'
        end
        ;;
  }


####### Dimensions go below #######

  dimension: account {
    type: string
    hidden: yes
    group_label: "TrueView Dimensions"
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: number
    group_label: "TrueView IDs"
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: ad_type {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}."ad type" ;;
  }

  dimension: campaign {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "TrueView IDs"
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: city {
    type: string
    hidden: yes
    group_label: "Geo Reports"
    sql: ${TABLE}.city ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: client_name {
    type: string
    label: "Account Name"
    group_label: "TrueView Dimensions"
    sql: ${TABLE}."client name" ;;
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

  dimension: countryterritory {
    type: number
    hidden: yes
    group_label: "Geo Reports"
    sql: ${TABLE}."country/territory" ;;
  }

  dimension: customer_id {
    type: number
    label: "Account ID"
    group_label: "TrueView IDs"
    sql: ${TABLE}."customer id" ;;
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

  dimension: device {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}.device ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: interactions {
    type: number
    hidden: yes
    sql: ${TABLE}.interactions ;;
  }

  dimension: metro_area {
    type: string
    hidden: yes
    group_label: "Geo Reports"
    sql: ${TABLE}."metro area" ;;
  }

  dimension: network {
    type: string
    hidden: yes
    group_label: "TrueView Dimensions"
    sql: ${TABLE}.network ;;
  }

  dimension: region {
    type: string
    hidden: yes
    group_label: "Geo Reports"
    sql: ${TABLE}.region ;;
  }

  dimension: reportname {
    type: string
    hidden: yes
    sql: ${TABLE}.reportname ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: ${TABLE}.views ;;
  }

  dimension: sessions {
    type: number
    hidden: yes
    sql: '0' ;;
  }

  dimension: session_duration {
    type: number
    hidden: yes
    sql: '0' ;;
  }


###### All measures go below ######

  measure: total_cost {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: (${cost}/1000000.00) ;;
    value_format_name: usd
  }

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${id} ;;
    sql: ${clicks} ;;
  }

  measure: total_views {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${id} ;;
    sql: ${views} ;;
  }

  measure: view_rate {
    type: number
    sql: 1.0*${total_views}/nullif(${total_impressions}, 0);;
    value_format_name: percent_0
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    sql: ${total_cost}/nullif(${total_impressions}/1000,0) ;;
    value_format: "$0.00"
  }

  measure: cost_per_view {
    type: number
    label: "CPV"
    sql: ${total_cost}/nullif(${total_views},0) ;;
    value_format: "$0.000"
  }

  measure: total_sessions {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${id} ;;
    sql: ${sessions} ;;
  }

  measure: total_session_duration {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${id} ;;
    sql: ${session_duration} ;;
  }

  ##### Joining Quartiles reporting #####

  dimension: total_views_to_25q {
    type: number
    hidden: yes
    sql: ${sdt_trueview_quartiles.video_played_to_25}*${impressions} ;;
    value_format_name: decimal_0
  }

  measure: sum_views_to_25q {
    type: sum_distinct
    label: "Views to 25%"
    group_label: "Video Quartiles"
    sql_distinct_key: ${id} ;;
    sql: ${total_views_to_25q} ;;
    value_format_name: decimal_0
  }

  measure: views_to_25q {
    type: number
    label: "% Played to 25%"
    group_label: "Video Quartiles"
    sql: 1*${sum_views_to_25q}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  dimension: total_views_to_50q {
    type: number
    hidden: yes
    sql: ${sdt_trueview_quartiles.video_played_to_50}*${impressions} ;;
    value_format_name: decimal_0
  }

  measure: sum_views_to_50q {
    type: sum_distinct
    label: "Views to 50%"
    group_label: "Video Quartiles"
    sql_distinct_key: ${id} ;;
    sql: ${total_views_to_50q} ;;
    value_format_name: decimal_0
  }

  measure: views_to_50q {
    type: number
    label: "% Played to 50%"
    group_label: "Video Quartiles"
    sql: 1*${sum_views_to_50q}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  dimension: total_views_to_75q {
    type: number
    hidden: yes
    sql: ${sdt_trueview_quartiles.video_played_to_75}*${impressions} ;;
    value_format_name: decimal_0
  }

  measure: sum_views_to_75q {
    type: sum_distinct
    label: "Views to 75%"
    group_label: "Video Quartiles"
    sql_distinct_key: ${id} ;;
    sql: ${total_views_to_75q} ;;
    value_format_name: decimal_0
  }

  measure: views_to_75q {
    type: number
    label: "% Played to 75%"
    group_label: "Video Quartiles"
    sql: 1*${sum_views_to_75q}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  dimension: total_views_to_100q {
    type: number
    hidden: yes
    sql: ${sdt_trueview_quartiles.video_played_to_100}*${impressions} ;;
    value_format_name: decimal_0
  }

  measure: sum_views_to_100q {
    type: sum_distinct
    label: "Views to 100%"
    group_label: "Video Quartiles"
    sql_distinct_key: ${id} ;;
    sql: ${total_views_to_100q} ;;
    value_format_name: decimal_0
  }

  measure: views_to_100q {
    type: number
    label: "% Played to 100%"
    group_label: "Video Quartiles"
    sql: 1*${sum_views_to_100q}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }



  measure: count {
    type: count
    hidden: yes
    drill_fields: [id, client_name, reportname]
  }
}
