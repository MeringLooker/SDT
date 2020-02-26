view: sdt_fy20_ta_uk_content_hub {
  sql_table_name: public.sdt_fy20_ta_uk_content_hub ;;

### Primary Key ###

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  ##### Added to This Table via LookML #####

  dimension: sdt_pillar {
    type: string
    group_label: "Client Dimensions"
    label: "Pillar"
    sql:
      case
        when ${content_hub} ilike '%Attractions%' then 'Attractions'
        when ${content_hub} ilike '%Culinary%' then 'Culinary'
        when ${content_hub} ilike '%Culture%' then 'Culture'
        when ${content_hub} ilike '%Entertainment%' then 'Entertainment'
        when ${content_hub} ilike '%Outdoors%' then 'Outdoor'
        else 'Uncategorized'
        end;;
  }

  dimension: sdt_campaign {
    type: string
    group_label: "Client Dimensions"
    label: "Campaign Name"
    sql: 'UK TripAdvisor Program' ;;
  }

  dimension: publisher {
    type: string
    group_label: "Client Dimensions"
    label: "Publisher"
    sql: 'TripAdvisor' ;;
  }

  dimension: sdt_market {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql: 'United Kingdom' ;;
  }

### Dimensions native to this table ###

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

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: content_hub {
    type: string
    sql: ${TABLE}.content_hub ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: image_gallery_click_thrus {
    type: number
    hidden: yes
    sql: ${TABLE}.image_gallery_click_thrus ;;
  }

  dimension: image_gallery_interactions {
    type: number
    hidden: yes
    sql: ${TABLE}.image_gallery_interactions ;;
  }

  dimension: page_views {
    type: number
    hidden: yes
    sql: ${TABLE}.page_views ;;
  }

  dimension: time_on_page {
    type: number
    hidden: yes
    sql: ${TABLE}.total_time_on_page ;;
  }

  dimension: unique_users {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_users ;;
  }

  dimension: unique_video_completions {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_video_completions ;;
  }

  dimension: unique_video_plays {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_video_plays ;;
  }

  dimension: video_completions {
    type: number
    hidden: yes
    sql: ${TABLE}.video_completions ;;
  }

  dimension: video_plays {
    type: number
    hidden: yes
    sql: ${TABLE}.video_plays ;;
  }

  #### All Measures go below ####

  measure: total_pageviews {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${page_views} ;;
  }

  measure: total_unique_users {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${unique_users} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${clicks} ;;
  }

  measure: total_views {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${video_plays} ;;
  }

  measure: total_completes {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${video_completions} ;;
  }

  measure: total_image_interactions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${image_gallery_interactions} ;;
  }

  measure: total_dwell_time {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${id} ;;
    sql: ${time_on_page} ;;
  }

  measure: view_rate {
    type: number
    label: "View Rate"
    sql: 1.0*${total_views}/nullif(${total_pageviews}, 0) ;;
    value_format_name: percent_2
  }

  measure: interaction_rate {
    type: number
    label: "Interaction Rate"
    sql: 1.0*${total_image_interactions}/nullif(${total_pageviews}, 0) ;;
    value_format_name: percent_2
  }

  measure: avg_dwell_time {
    type: number
    label: "Avg. Dwell Time"
    sql: (${total_dwell_time}/nullif(${total_pageviews}, 0))::float/86400 ;;
    value_format: "m:ss"
  }

  measure: pages_per_user {
    type: number
    label: "Pageviews/User"
    sql: ${total_pageviews}/nullif(${total_unique_users}, 0) ;;
    value_format_name: decimal_2
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
