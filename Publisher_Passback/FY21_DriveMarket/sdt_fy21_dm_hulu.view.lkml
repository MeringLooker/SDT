view: sdt_fy21_dm_hulu {
  sql_table_name: public.sdt_fy21_dm_hulu ;;
  drill_fields: [id]

  ## Primary Key ##

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

##### Dimensions added to this table via LookML ######

  dimension: ad_name {
    type: string
    group_label: "Client Dimensions"
    label: "Ad Name"
    sql: ${sdt_dcm_ga_view.ad};;
  }

  dimension: ad_size {
    type: string
    group_label: "Client Dimensions"
    label: "Ad Size"
    sql: ${sdt_dcm_ga_view.ad_size};;
  }

  dimension: publisher {
    type: string
    group_label: "Client Dimensions"
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

  dimension: sdt_audience {
    type: string
    group_label: "Client Dimensions"
    label: "Audience"
    sql: ${sdt_dcm_ga_view.sdt_audience};;
  }

  dimension: sdt_placement {
    type: string
    group_label: "Client Dimensions"
    label: "Placement Name"
    sql: ${sdt_dcm_ga_view.sdt_placement};;
  }

  dimension: sdt_pillar {
    type: string
    group_label: "Client Dimensions"
    label: "Pillar"
    sql:${sdt_dcm_ga_view.sdt_pillar};;
  }

  dimension: creative_name {
    type: string
    group_label: "Client Dimensions"
    label: "Creative Name"
    sql: ${sdt_dcm_ga_view.creative_name};;
  }

  dimension: sdt_partner {
    type: string
    group_label: "Client Dimensions"
    label: "SDT Partner (Fam. Content)"
    sql: ${sdt_dcm_ga_view.sdt_partner};;
  }


######### All Dimensions Native to Source Table Below #########

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

  dimension: __state {
    type: string
    hidden: yes
    sql: ${TABLE}.__state ;;
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

  dimension: ad_id {
    type: number
    sql: ${TABLE}.ad_id ;;
  }

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

  dimension: video_completions {
    type: number
    hidden: yes
    sql: ${TABLE}.video_completions ;;
  }

  dimension: video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.video_views ;;
  }

######### All measures go below ########

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
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
    sql_distinct_key: ${id} ;;
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
    label: "Video Views"
    sql: ${video_views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    label: "Video Completes"
    sql: ${video_completions} ;;
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


}
