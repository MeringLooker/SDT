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
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_id {
    type: string
    hidden: yes
    sql: ${TABLE}."ad id" ;;
  }

  dimension: advertiser {
    type: string
    sql: ${TABLE}.advertiser ;;
  }

  dimension: booked_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}."booked clicks" ;;
  }

  dimension: booked_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."booked impressions" ;;
  }

  dimension: booked_viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."booked viewable impressions" ;;
  }

  dimension: campaign {
    type: string
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

  dimension: comp_key {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key ;;
  }

  dimension: creative {
    type: string
    sql: ${TABLE}.creative ;;
  }

  dimension: creative_id {
    type: string
    hidden: yes
    sql: ${TABLE}."creative id" ;;
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
    sql: ${TABLE}.placement ;;
  }

  dimension: placement_id {
    type: number
    hidden: yes
    sql: ${TABLE}."placement id" ;;
  }

  dimension: placement_strategy {
    type: string
    sql: ${TABLE}."placement strategy" ;;
  }

  dimension: planned_media_cost {
    type: number
    hidden: yes
    sql: ${TABLE}."planned media cost" ;;
  }

  dimension: platform_type {
    type: string
    sql: ${TABLE}."platform type" ;;
  }

  dimension: site_dcm {
    type: string
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
