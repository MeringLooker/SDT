view: sdt_dcm_view {
  sql_table_name: public.sdt_dcm_view ;;
  drill_fields: [id]


######## Dimensions go below ########

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
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
      ELSE ${site_dcm}
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
        when ${campaign} ILIKE '%SD For The Holidays%' then 'Holiday Program'
        when ${campaign} ILIKE '%TripAdvisor%' then 'TripAdvisor Program'
        when ${campaign} ILIKE '%Pull-Through%' then 'Pull-Through'
        when ${campaign} ILIKE '%Brand Digital Video%' then 'Brand Digital Video'
        when ${campaign} ILIKE '%Canada Digital%' then 'Canada Digital'
        when ${campaign} ILIKE '%Fall Promo%' then 'Fall Promo'
        when ${campaign} ILIKE '%Canada Campaign%' then 'Canada Digital'
        when ${campaign} ILIKE '%Germany Campaign%' then 'Germany Digital'
        when ${campaign} ILIKE '%UK Digital Campaign%' then 'UK Digital'
        when ${campaign} ILIKE '%UK Digital' then 'UK Digital'
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
      ELSE ${campaign}
      END;;
  }

  dimension: market {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql:
      CASE
        when ${sdt_campaign} = 'UK Digital' then 'United Kingdom'
        when ${sdt_campaign} = 'Canada Digital' then 'Canada'
        when ${sdt_campaign} = 'Mexico Digital' then 'Mexico'
        when ${sdt_campaign} = 'Germany Digital' then 'Germany'
        when ${campaign_id} = '22103210' then 'United Kingdom'
        when ${campaign_id} = '23302406' then 'Canada'
        when ${campaign_id} = '22169957' then 'Canada'
        when ${campaign_id} = '23350539' then 'Canada'
          ELSE 'United States'
      END;;
  }

######### All Dimensions Native to Source Table Below #########

  dimension: __id {
    hidden: yes
    type: string
    sql: ${TABLE}.__id ;;
  }

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
    sql: ${TABLE}."active view: % measurable impressions"
      ;;
  }

  dimension: active_view__viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: % viewable impressions"
      ;;
  }

  dimension: active_view_eligible_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: eligible impressions"
      ;;
  }

  dimension: active_view_measurable_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}."active view: measurable impressions"
      ;;
  }

  dimension: active_view_viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: viewable impressions"
      ;;
  }

  dimension: ad {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_id {
    type: string
#     hidden: yes
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
#     hidden: yes
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

  dimension: comp_key {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key ;;
  }

  dimension: creative {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.creative ;;
  }

  dimension: creative_id {
    type: string
#     hidden: yes
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
#     hidden: yes
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
    type: sum
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    group_label: "3rd Party Measures"
    type: sum
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
    type: sum
    label: "Active View Measureable Impressions"
    sql: ${active_view_measurable_impressions}   ;;
  }

  measure: total_active_view_viewable_impressions {
    group_label: "3rd Party Measures"
    type: sum
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
    type: sum
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

######## Joined measures from GA #######

  measure: ga_sessions {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${sdt_mc_ga_view.id};;
    sql: ${sdt_mc_ga_view.sessions};;
  }

  measure: cost_per_session {
    group_label: "GA Reporting"
    type: number
    label: "CPS"
    sql: ${total_media_cost}/nullif(${sdt_mc_ga_view.sessions}, 0) ;;
    value_format_name: usd
  }

  measure: ga_total_session_duration {
    hidden: yes
    type: sum
    label: "Total Session Duration"
    sql_distinct_key: ${sdt_mc_ga_view.id};;
    sql: ${sdt_mc_ga_view.sessionduration};;
  }

  measure: avg_time_on_site {
    label: "Avg. TOS - Unformatted"
    hidden: yes
    type: number
    sql: ${sdt_mc_ga_view.total_session_duration}/nullif(${sdt_mc_ga_view.total_sessions}, 0);;
    value_format: "0.##"
  }

  measure: formatted_tos {
    group_label: "GA Reporting"
    label: "Avg. TOS"
    type: number
    sql:  ${avg_time_on_site}::float/86400 ;;
    value_format: "m:ss"
  }

  measure: total_users {
    group_label: "GA Reporting"
    label: "Users"
    type: sum
    sql: ${sdt_mc_ga_view.users} ;;
  }

  measure: new_users {
    group_label: "GA Reporting"
    label: "New Users"
    type: sum
    sql: ${sdt_mc_ga_view.newusers} ;;
  }

  measure: percent_new_users {
    group_label: "GA Reporting"
    label: "% New Users"
    type: number
    sql: ${sdt_mc_ga_view.new_users}/nullif(${sdt_mc_ga_view.total_users}, 0) ;;
    value_format_name: percent_0
  }

  measure: total_pageviews {
    group_label: "GA Reporting"
    label: "Pageviews"
    type: sum
    sql: ${sdt_mc_ga_view.pageviews} ;;
  }

  measure: pages_per_session {
    group_label: "GA Reporting"
    label: "Pgs/Session"
    type: number
    sql: ${sdt_mc_ga_view.pageviews}/nullif(${sdt_mc_ga_view.total_sessions}, 0) ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}

##### Drill Fields go here #####
