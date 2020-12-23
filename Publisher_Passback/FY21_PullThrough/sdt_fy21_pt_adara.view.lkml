view: sdt_fy21_pt_adara {
  sql_table_name: public.sdt_fy21_pt_adara ;;
  drill_fields: [id]

  ## Passback Key ##

  dimension: adara_join {
    type: string
    hidden: yes
    sql: ${ad_id}||'_'||${creative_id} ;;
  }

  dimension: primary_key {
    type: string
    hidden: yes
    sql: ${ad_id}||'_'||${creative_id}||'_'||${date_date} ;;
  }

  ## Joined from DCM Explore ##

  dimension: ad_name {
    type: string
    group_label: "DCM Dimensions"
    label: "Ad Name"
    sql: ${sdt_dcm_ga_view.ad};;
  }

  dimension: placement_name {
    type: string
    group_label: "DCM Dimensions"
    label: "Placement Name"
    sql: ${sdt_dcm_ga_view.placement};;
  }

  dimension: creative {
    type: string
    group_label: "DCM Dimensions"
    label: "Creative Name"
    sql: ${sdt_dcm_ga_view.creative};;
  }

  dimension: creative_name {
    type: string
    group_label: "Client Dimensions"
    label: "Creative Name"
    sql: ${sdt_dcm_ga_view.creative_name};;
  }

  dimension: ad_size {
    type: string
    group_label: "DCM Dimensions"
    label: "Ad Size"
    sql: ${sdt_dcm_ga_view.ad_size};;
  }

  dimension: publisher {
    type: string
    group_label: "DCM Dimensions"
    label: "Publisher"
    sql: ${sdt_dcm_ga_view.publisher};;
  }

  dimension: sdt_layer {
    type: string
    group_label: "Client Dimensions"
    label: "Campaign Layer"
    sql: ${sdt_dcm_ga_view.sdt_layer};;
  }

  dimension: sdt_campaign {
    type: string
    group_label: "Client Dimensions"
    label: "Campaign Name"
    sql: ${sdt_dcm_ga_view.sdt_campaign};;
  }

  dimension: sdt_market {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql: ${sdt_dcm_ga_view.sdt_market};;
  }

  dimension: sdt_region {
    type: string
    group_label: "Client Dimensions"
    label: "Region"
    sql: ${sdt_dcm_ga_view.sdt_region};;
  }

  dimension: sdt_placement {
    type: string
    group_label: "Client Dimensions"
    label: "Placement Name"
    sql: ${sdt_dcm_ga_view.sdt_placement};;
  }


  ## Native to File ##

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
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

  dimension: __state {
    hidden: yes
    type: string
    sql: ${TABLE}.__state ;;
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

  dimension: ad_id {
    group_label: "DCM Dimensions"
    label: "Ad ID"
    type: number
    sql: ${TABLE}.ad_id ;;
  }

  dimension: clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost {
    hidden: yes
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: creative_id {
    group_label: "DCM Dimensions"
    label: "Creative ID"
    type: number
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

  dimension: impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: sessions {
    hidden: yes
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: session_duration {
    hidden: yes
    type: number
    sql: ${TABLE}.session_duration ;;
  }

  dimension: video_completions {
    hidden: yes
    type: number
    sql: ${TABLE}.video_completions ;;
  }

  dimension: video_views {
    hidden: yes
    type: number
    sql: ${TABLE}.video_views ;;
  }

  #### Mesures go below ####

  measure: total_impressions {
    group_label: "Publisher Reporting"
    label: "Total Impressions"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    group_label: "Publisher Reporting"
    label: "Total Clicks"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    group_label: "Publisher Reporting"
    label: "CTR"
    type: number
    value_format_name: percent_2
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
  }

  measure: total_media_cost {
    group_label: "Publisher Reporting"
    label: "Total Media Cost"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: total_video_views {
    group_label: "Publisher Reporting"
    label: "Total Video Views"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${video_views} ;;
  }

  measure: total_video_completes {
    group_label: "Publisher Reporting"
    label: "Total Video Completes"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${video_completions} ;;
  }

  measure: view_rate {
    group_label: "Publisher Reporting"
    label: "View Rate"
    type: number
    value_format_name: percent_0
    sql: ${total_video_views}/nullif(${total_impressions}, 0) ;;
  }

  measure: completion_rate {
    group_label: "Publisher Reporting"
    label: "Completion Rate"
    type: number
    value_format_name: percent_0
    sql: ${total_video_completes}/nullif(${total_impressions}, 0) ;;
  }

  measure: cost_per_view {
    group_label: "Publisher Reporting"
    label: "Cost per View"
    type: number
    value_format_name: usd
    sql: ${total_media_cost}/nullif(${total_video_completes}, 0) ;;
  }

  measure: cost_per_thousand {
    group_label: "Publisher Reporting"
    label: "CPM"
    type: number
    value_format_name: usd
    sql: ${total_media_cost}/nullif(${total_impressions}/1000, 0) ;;
  }

  measure: total_sessions {
    group_label: "Google Analytics Reporting"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${primary_key} ;;
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    group_label: "Google Analytics Reporting"
    type: number
    label: "CPS"
    sql: ${total_media_cost}/nullif(${total_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: total_session_duration {
    group_label: "Google Analytics Reporting"
    hidden: yes
    type: sum_distinct
    label: "Total Session Duration"
    sql_distinct_key: ${primary_key};;
    sql: ${session_duration};;
  }

  measure: avg_time_on_site {
    group_label: "Google Analytics Reporting"
    label: "Avg. TOS"
    type: number
    sql:  (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400  ;;
    value_format: "m:ss"
  }
}
