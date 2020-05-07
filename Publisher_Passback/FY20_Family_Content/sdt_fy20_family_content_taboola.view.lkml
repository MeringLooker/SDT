view: sdt_fy20_family_content_taboola {
  sql_table_name: public.sdt_fy20_family_content_taboola ;;
  drill_fields: [id]

#### Primary Key ####

  dimension: passback_join_ad {
    type: string
    hidden: yes
    sql: ${ad_id}||'_'||${date_date} ;;
  }

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

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

  dimension: ad_id {
    type: number
    sql: ${TABLE}.ad_id ;;
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

###### All Measures go below ######

  measure: total_impressions {
    label: "Total Impressions"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    label: "Total Clicks"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    label: "CTR"
    type: number
    value_format_name: percent_2
    sql: ${clicks}/nullif(${impressions}, 0) ;;
  }

  measure: total_media_cost {
    label: "Total Media Cost"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: total_video_views {
    label: "Total Video Views"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${video_views} ;;
  }

  measure: total_video_completes {
    label: "Total Video Completes"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${video_completions} ;;
  }

  measure: video_impressions {
    hidden: yes
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql:
      case
        when ${video_views} > 0 then ${impressions}
        else null
        end;;
  }

  measure: video_cost {
    hidden: yes
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql:
      case
      when ${video_views} > 0 then ${cost}
      else null
    end;;
  }

  measure: view_rate {
    label: "View Rate"
    type: number
    value_format_name: percent_0
    sql: ${total_video_views}/nullif(${video_impressions}, 0) ;;
  }

  measure: completion_rate {
    label: "Completion Rate"
    type: number
    value_format_name: percent_0
    sql: ${total_video_completes}/nullif(${video_impressions}, 0) ;;
  }

  measure: cost_per_view {
    label: "Cost per View"
    type: number
    value_format_name: usd
    sql: ${video_cost}/nullif(${total_video_completes}, 0) ;;
  }

  measure: cost_per_thousand {
    label: "CPM"
    type: number
    value_format_name: usd
    sql: ${total_media_cost}/nullif(${total_impressions}/1000, 0) ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
