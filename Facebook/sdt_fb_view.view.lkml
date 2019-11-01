view: sdt_fb_view {
  sql_table_name: public.sdt_fb_view ;;
  drill_fields: [id]

###### Primary Key #######

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: __senttime {
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
    hidden: yes
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}.ad_name ;;
  }

  dimension: ad_type {
    type: string
    group_label: "Facebook Dimensions"
    sql:
     CASE
       when ${ad_name} ilike '%SingleImage%' then 'Single Image'
       when ${ad_name} ilike '%Carousel%' then 'Carousel'
       when ${ad_name} ilike '%Video%' then 'Video'
       when ${ad_name} ilike '%Stories%' then 'Story'
       when ${ad_name} ilike '%Canvas%' then 'Canvas'
       ELSE 'Uncategorized'
      END;;
    drill_fields: [ad_name]
  }

  dimension: adset_id {
    type: number
    hidden: yes
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
    hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: fiscal_year {
    label: "Fiscal"
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


  dimension: sdt_campaign {
    label: "Campaign"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${campaign_name} ILIKE '%AlwaysOnContent%' or '%_Content_%' then 'Content Program'
        WHEN ${campaign_name} ILIKE '%FallPromo%' then 'Fall Promos'
        WHEN ${campaign_name} ILIKE '%_DigitalVideo_%' then 'Digital Video'
        WHEN ${campaign_name} ILIKE '%AAY%' then 'Awesome All Year'
        WHEN ${campaign_name} ILIKE '%_Holiday_%%' then 'SD For The Holidays'
        WHEN ${campaign_name} ILIKE '%_PullThrough_%' then 'PullThrough'
        WHEN ${campaign_name} ILIKE '%_CAN_%' then 'Canada Digital'
        WHEN ${campaign_name} ILIKE '%_MEX_%' then 'Mexico Digital'
        WHEN ${campaign_name} ILIKE '%_UK_%' then 'United Kingdom Digital'
        WHEN ${campaign_name} ILIKE '%_GER_%' then 'Germany Digital'
        ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: comp_key {
    type: string
    sql: ${TABLE}.comp_key ;;
  }

  dimension: comp_key_backup {
    type: string
    sql: ${TABLE}.comp_key_backup ;;
  }

  dimension: cost_per_inline_post_engagement {
    type: number
    sql: ${TABLE}.cost_per_inline_post_engagement ;;
  }

  dimension: cost_per_unique_click {
    type: number
    sql: ${TABLE}.cost_per_unique_click ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: cpm {
    type: number
    sql: ${TABLE}.cpm ;;
  }

  dimension: cpp {
    type: number
    sql: ${TABLE}.cpp ;;
  }

  dimension: ctr {
    type: number
    sql: ${TABLE}.ctr ;;
  }

  dimension_group: date_start {
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
    sql: ${TABLE}.date_start ;;
  }

  dimension_group: date_stop {
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
    sql: ${TABLE}.date_stop ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.frequency ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: inline_link_clicks {
    type: number
    sql: ${TABLE}.inline_link_clicks ;;
  }

  dimension: inline_post_engagement {
    type: number
    sql: ${TABLE}.inline_post_engagement ;;
  }

  dimension: objective {
    type: string
    sql: ${TABLE}.objective ;;
  }

  dimension: reach {
    type: number
    sql: ${TABLE}.reach ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
  }

  dimension: unique_clicks {
    type: number
    sql: ${TABLE}.unique_clicks ;;
  }

  dimension: unique_ctr {
    type: number
    sql: ${TABLE}.unique_ctr ;;
  }

#### All Measures go below ####


  measure: total_impressions {
    type: sum
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum
    label: "Clicks"
    sql: ${inline_link_clicks} ;;
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_spend {
    type: sum
    label: "Media Spend"
    sql: ${spend};;
    value_format_name: usd
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

#### Joined FB Action Measures #####

  measure: video_views {
    type: sum_distinct
    sql_distinct_key: ${sdt_fb_view.id};;
    label: ":03 Video Views"
    sql:
      CASE
      WHEN ${facebookads__mc_visit_san_diego_actions.action_type} = 'video_view' THEN ${facebookads__mc_visit_san_diego_actions.value}
      END;;
  }

  measure: video_completes {
    type: sum_distinct
    label: "Views to 100%"
    sql_distinct_key: ${sdt_fb_view.id};;
    sql: ${facebookads__mc_visit_san_diego_video_p100_watched_actions.value} ;;
  }

  measure: video_completion_rate {
    type: number
    label: "Vid. Completion Rate"
    sql: 1.0*${video_completes}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  ####### Joined GA Measures #######

  measure: ga_sessions {
    type: sum_distinct
    label: "Sessions"
    group_label: "GA Reporting"
    sql_distinct_key: ${sdt_mc_ga_view.id};;
    sql: ${sdt_mc_ga_view.sessions};;
  }

  measure: cost_per_session {
    type: number
    label: "CPS"
    group_label: "GA Reporting"
    sql: ${total_spend}/nullif(${ga_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: click_to_session {
    type: number
    label: "CTS"
    group_label: "GA Reporting"
    description: "Percent of clicks that result in a session."
    sql: 1.0*${ga_sessions}/nullif(${total_clicks}, 0) ;;
    value_format_name: percent_0
  }

  measure: ga_total_session_duration {
    hidden: yes
    type: sum
    group_label: "GA Reporting"
    label: "Total Session Duration"
    sql_distinct_key: ${sdt_mc_ga_view.id};;
    sql: ${sdt_mc_ga_view.sessionduration};;
  }

  measure: avg_time_on_site {
    label: "Avg. TOS"
    group_label: "GA Reporting"
    type: number
    sql: (${sdt_mc_ga_view.total_session_duration}/nullif(${sdt_mc_ga_view.total_sessions}, 0))::float/86400 ;;
    value_format: "m:ss"
  }

  measure: ga_total_users {
    type: sum
    group_label: "GA Reporting"
    label: "Users"
    sql_distinct_key: ${sdt_mc_ga_view.id};;
    sql: ${sdt_mc_ga_view.users};;
  }

  measure: ga_new_users {
    type: sum
    group_label: "GA Reporting"
    label: "New Users"
    sql_distinct_key: ${sdt_mc_ga_view.id};;
    sql: ${sdt_mc_ga_view.newusers};;
  }

  measure: percent_new_users {
    group_label: "GA Reporting"
    label: "% New Users"
    type: number
    sql: 1.0*${ga_new_users}/nullif(${ga_total_users}, 0) ;;
    value_format_name: percent_0
  }

  measure: ga_total_pageviews {
    group_label: "GA Reporting"
    label: "Pageviews"
    type: sum
    sql: ${sdt_mc_ga_view.pageviews} ;;
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
