view: sdt_dcm_view {
  sql_table_name: public.sdt_dcm_view ;;

######## Primary Key ########

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

######## GA Join ID ########

  dimension: comp_key {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key ;;
  }

##### Dimensions added to this table via LookML ######

  dimension: fiscal_year {
    type: string
    group_label: "Client Dimensions"
    label: "Fiscal Year"
    sql:
      CASE
        WHEN ${date_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 18/18'
        WHEN ${date_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${date_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: ad_size {
    type: string
    group_label: "DCM Dimensions"
    label: "Ad Size"
    sql:
      CASE
        when ${creative} ILIKE '%728x90%' then '728x90'
        when ${creative} ILIKE '%300x250%' then '300x250'
        when ${creative} ILIKE '%300x600%' then '300x600'
        when ${creative} ILIKE '%320x50%' then '320x50'
        when ${creative} ILIKE '%160x600%' then '160x600'
        when ${creative} ILIKE '%970x250%' then '970x250'
        when ${creative} ILIKE '%300x50%' then '300x50'
      ELSE 'Uncategorized'
      END;;
  }

  dimension: publisher {
    type: string
    group_label: "Client Dimensions"
    label: "Publisher"
    sql:
      CASE
        when ${site_dcm} ILIKE 'bellmedia%' then 'Bell Media'
        when ${site_dcm} ILIKE 'CBS%' then 'CBS'
        when ${site_dcm} ILIKE 'Expedia%' then 'Expedia'
        when ${site_dcm} ILIKE 'globaltv%' then 'GlobalTV'
        when ${site_dcm} ILIKE 'Hulu%' then 'Hulu'
        when ${site_dcm} ILIKE 'Nativo%' then 'Nativo'
        when ${site_dcm} ILIKE 'NBC Sports%' then 'NBC Sports'
        when ${site_dcm} ILIKE 'TripAdvisor%' then 'Trip Advisor'

        when ${site_dcm} ILIKE 'Turner Sports%' then 'Turner Sports'
        when ${site_dcm} ILIKE 'Meredith%' then 'Meredith'

        when ${site_dcm} ILIKE 'Lastminute%' then 'Lastminute'
        when ${site_dcm} ILIKE 'Triplelift%' then 'TripleLift'

        when ${site_dcm} ILIKE 'Adroll%' then 'AdRoll'
        when ${site_dcm} ILIKE 'Adara%' then 'Adara'
        when ${site_dcm} ILIKE 'Kayak%' then 'Kayak'

        when ${site_dcm} ILIKE 'travelocity.ca/ca%' then 'Travelocity'

        when ${site_dcm} ILIKE 'TravelandLeisure' then 'Travel + Leisure'

        ELSE ${site_dcm}

      END;;
  }

  dimension: sdt_layer {
    type: string
    group_label: "Client Dimensions"
    label: "Campaign Layer"
    sql:
      CASE
        when ${placement} ILIKE '%Anaheim/Disneyland%' then 'Disneyland'
        when ${placement} ILIKE '%Conquesting%' then 'Competitive Conquest'
        when ${placement} ILIKE 'Adara\\_Los Angeles\\_%' then 'Los Angeles'
        when ${placement} ILIKE 'Adara\\_PT\\_Display Prospecting%' then 'PullThrough Base'
        when ${placement} ILIKE 'Adara\\_PT\\_AV Display Prospecting%' then 'PullThrough Base'
        when ${placement} ILIKE 'AdRoll\\_Retargeting%' then 'Retargeting'
        when ${placement} ILIKE '%Competitive Conquesting%' then 'Competitive Conquest'
        when ${placement} ILIKE '%Disneyland/Anaheim%' then 'Disneyland'
        when ${placement} ILIKE 'Expedia\\_Los Angeles\\_%' then 'Los Angeles'
        when ${placement} ILIKE 'Expedia\\_OTA Base\\_%' then 'OTA Base'
        when ${placement} ILIKE 'Kayak\\_Los Angeles\\_%' then 'Los Angeles'
        when ${placement} ILIKE 'Expedia\\_Los Angeles\\_%' then 'Los Angeles'
        when ${placement} ILIKE 'Sojern\\_PT\\_Display Prospecting%' then 'PullThrough Base'
        when ${placement} ILIKE 'Sojern\\_PT\\_AV Display Prospecting%' then 'PullThrough Base'
        when ${placement} ILIKE 'Priceline\\_OTA Base\\_%' then 'OTA Base'
        ELSE 'Uncategorized'
      END;;
  }


  dimension: sdt_campaign {
    type: string
    group_label: "Client Dimensions"
    label: "Campaign Name"
    sql:
      CASE
        when ${campaign} ILIKE '%Balboa Park%' then 'Balboa Park'
        when ${campaign} ILIKE '%Family Content%' then 'Family Content'
        when ${campaign} ILIKE '%SD For The Holidays%' then 'SD For The Holidays'



        when ${campaign} = 'SDT: FY19 TripAdvisor Program- CAN' then 'CAN TripAdvisor Program'
        when ${campaign} = 'SDT: 004676_01 FY20 TripAdvisor CAN Campaign' then 'CAN TripAdvisor Program'
        when ${campaign} = 'SDT: 004676_01 FY20 TripAdvisor US Campaign' then 'US TripAdvisor Program'
        when ${campaign} = 'SDT FY19 TripAdvisor Program- US' then 'US TripAdvisor Program'
        when ${campaign} = 'SDT: 004676_01 FY20 TripAdvisor UK Campaign' then 'UK TripAdvisor Program'
        when ${campaign} = 'SDT FY19 TripAdvisor Program- UK' then 'UK TripAdvisor Program'

        when ${campaign} ILIKE '%Brand Digital Video%' then 'Brand Digital Video'
        when ${campaign} ILIKE '%Canada Digital%' then 'Canada Digital'
        when ${campaign} ILIKE '%Fall Promo%' then 'Fall Promo'
        when ${campaign} ILIKE '%Canada Campaign%' then 'Canada Digital'
        when ${campaign} ILIKE '%Germany Campaign%' then 'Germany Digital'
        when ${campaign} ILIKE '%UK Digital Campaign%' then 'United Kingdom Digital'
        when ${campaign} ILIKE '%UK Digital' then 'United Kingdom Digital'
        when ${campaign} ILIKE '%Content%' then 'Always On Content'
        when ${campaign} ILIKE '%Content' then 'Always On Content'
        when ${campaign} ILIKE '%Sports%' then 'Sports Digital Video'
        when ${campaign} ILIKE '%Travel & Tourism Week' then 'Travel & Tourism Week'
        when ${campaign} ILIKE '%NatGeo%' then 'Nat Geo Digital'
        when ${campaign} ILIKE '%Mexico Campaign' then 'Mexico Digital'
        when ${campaign} ILIKE '%Mexico Campaign' then 'Mexico Digital'
        when ${campaign} ILIKE '%Kids Free%' then 'Kids Free'
        when ${campaign} ILIKE '%ABC VOD%' then 'ABC VOD'
        when ${campaign} ILIKE '%Digital Video' then 'Brand Digital Video'

        when ${campaign} = 'SDT: 004762_01 FY20 UK Pull-Through Campaign' then 'UK Pull-Through'
        when ${campaign} = 'SDT: 004762_01 FY20 Pull-Through Campaign' then 'US Pull-Through'
        when ${campaign} = 'SDT: 004762_01 FY20 CAN Pull-Through Campaign' then 'CAN Pull-Through'
        when ${campaign} = 'SDT: 004027_01 FY19 Foundational Pull-Through' then 'US Pull-Through'
        when ${campaign} = '003220_01 FY18 Foundational Travel Intender Pull-Through Digital' then 'US Pull-Through'


      ELSE ${campaign}
      END;;
  }

  dimension: sdt_market {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql:
      CASE
        when ${sdt_campaign} = 'United Kingdom Digital' then 'United Kingdom'
        when ${sdt_campaign} = 'Canada Digital' then 'Canada'
        when ${sdt_campaign} = 'Mexico Digital' then 'Mexico'
        when ${sdt_campaign} = 'Germany Digital' then 'Germany'
        when ${campaign_id} = '22103210' then 'United Kingdom'
        when ${campaign_id} = '23302406' then 'Canada'
        when ${campaign_id} = '22169957' then 'Canada'
        when ${campaign_id} = '23350539' then 'Canada'


        when ${campaign} = 'SDT: 004676_01 FY20 TripAdvisor US Campaign' then 'United States'
        when ${campaign} = 'SDT FY19 TripAdvisor Program- US' then 'United States'
        when ${campaign} = 'SDT: 004676_01 FY20 TripAdvisor UK Campaign' then 'United Kingdom'


          ELSE null
      END;;
  }

######### All Dimensions Native to Source Table Below #########

  dimension: __report {
    hidden: yes
    type: number
    sql: ${TABLE}.__report ;;
  }

  dimension_group: __senttime {
    hidden: yes
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
    sql: ${TABLE}.__senttime ;;
  }

  dimension_group: __updatetime {
    hidden: yes
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
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: active_view__measurable_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}."active view: % measurable impressions"  ;;
  }

  dimension: active_view__viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: % viewable impressions"  ;;
  }

  dimension: active_view_eligible_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: eligible impressions"  ;;
  }

  dimension: active_view_measurable_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}."active view: measurable impressions" ;;
  }

  dimension: active_view_viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: viewable impressions" ;;
  }

  dimension: ad {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_id {
    type: string
    hidden: yes
    sql: ${TABLE}."ad id" ;;
  }

  dimension: advertiser {
    type: string
    hidden: yes
    sql: ${TABLE}.advertiser ;;
  }

  dimension: booked_clicks {
    hidden: yes
    group_label: "Booked Metrics"
    label: "Booked Clicks"
    type: number
    sql: ${TABLE}."booked clicks" ;;
  }

  dimension: booked_impressions {
    type: number
    hidden: yes
    group_label: "Booked Metrics"
    label: "Booked Impressions"
    sql: ${TABLE}."booked impressions" ;;
  }

  dimension: booked_viewable_impressions {
    type: number
    hidden: yes
    group_label: "Booked Metrics"
    label: "Booked Viewable Impressions"
    sql: ${TABLE}."booked viewable impressions" ;;
  }

  dimension: campaign {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    hidden: yes
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: clickthrough_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}."click-through conversions" ;;
  }

  dimension: clickthrough_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}."click-through revenue" ;;
  }

  dimension: creative {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.creative ;;
  }

  dimension: creative_id {
    type: string
    hidden: yes
    sql: ${TABLE}."creative id" ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: media_cost {
    type: number
    hidden: yes
    sql: ${TABLE}."media cost" ;;
  }

  dimension: placement {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.placement ;;
  }

  dimension: placement_id {
    type: number
    hidden: yes
    sql: ${TABLE}."placement id" ;;
  }

  dimension: advertising_channel {
    type: string
    group_label: "DCM Dimensions"
    label: "Channel"
    sql: ${TABLE}."placement strategy" ;;
  }

  dimension: planned_media_cost {
    type: number
    hidden: yes
    group_label: "Booked Metrics"
    label: "Booked Media Cost"
    value_format_name: usd
    sql: ${TABLE}."planned media cost" ;;
  }

  dimension: platform_type {
    type: string
    hidden: yes
    sql: ${TABLE}."platform type" ;;
  }

  dimension: site_dcm {
    type: string
    label: "Site"
    group_label: "DCM Dimensions"
    sql: ${TABLE}."site (dcm)" ;;
  }

  dimension: total_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}."total conversions" ;;
  }

  dimension: total_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}."total revenue" ;;
  }

  dimension: viewthrough_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}."view-through conversions" ;;
  }

  dimension: viewthrough_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}."view-through revenue" ;;
  }

######### All measures go below ########

  measure: total_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Clicks"
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    group_label: "3rd Party Measures"
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_active_view_measureable_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Active View Measureable Impressions"
    sql: ${active_view_measurable_impressions} ;;
  }

  measure: total_active_view_viewable_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Active View Viewable Impressions"
    sql: ${active_view_viewable_impressions} ;;
  }

  measure: total_viewability {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewability"
    sql: ${total_active_view_viewable_impressions}/nullif(${total_active_view_measureable_impressions}, 0) ;;
    value_format_name: percent_0
  }

  measure: total_media_cost {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Media Spend"
    sql: ${media_cost} ;;
    value_format_name: usd
  }

  measure: cost_per_click {
    group_label: "3rd Party Measures"
    type: number
    label: "CPC"
    sql: ${total_media_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: viewable_click_through_rate {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewable CTR"
    sql: ${total_clicks}/nullif(${total_active_view_viewable_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: viewable_cpm {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewable CPM"
    sql: 1.0*${total_media_cost}/nullif(${total_active_view_viewable_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    group_label: "3rd Party Measures"
    type: number
    label: "CPM"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  ####### Joined GA Measures #########

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
    sql: ${total_media_cost}/nullif(${ga_sessions}, 0) ;;
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
    drill_fields: [id]
  }
}
