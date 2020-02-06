view: sdt_fy20_content_inpowered {
  sql_table_name: public.sdt_fy20_content_inpowered ;;
  drill_fields: [id]

### Primary Key ###

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: passback_join { ## ad ID + date ALWAYS ##
    type: string
    hidden: yes
    sql: ${placement_id}||'_'||${date_date} ;;
  }

######## Dimensions from DCM that join to this table #######

  dimension: placement {
    type: string
    sql: ${sdt_dcm_view.placement} ;;
  }

  dimension: publisher {
    type: string
    sql: ${sdt_dcm_view.publisher} ;;
  }

  dimension: creative_name {
    type: string
    sql: ${sdt_dcm_view.ad} ;;
  }

######## Dimensions native to passback file #######

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

  dimension: article_views {
    type: number
    hidden: yes
    sql: ${TABLE}.article_views ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
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
    sql: ${TABLE}.media_cost ;;
  }

  dimension: placement_id {
    type: number
    sql: ${TABLE}.placement_id ;;
  }

  dimension: time_spent_with_article {
    type: number
    hidden: yes
    sql: ${TABLE}.total_time_spent_with_article ;;
  }

  dimension: video_completes {
    type: number
    hidden: yes
    sql: ${TABLE}.video_completes ;;
  }

  dimension: video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.video_views ;;
  }

  ### Measures below ###

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
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
    sql: ${media_cost} ;;
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

  measure: total_video_views {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${video_views} ;;
  }

  measure: total_video_completes {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${video_completes} ;;
  }

  measure: view_rate {
    type: number
    label: "CTR"
    sql: 1.0*${total_video_views}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_article_views {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${article_views} ;;
  }

  measure: total_time_spent_with_article {
    hidden: yes
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${time_spent_with_article} ;;
  }

  measure: avg_total_time_spent_with_article {
    type: number
    label: "Avg. Time w/ Article"
    sql: (${total_time_spent_with_article}/nullif(${total_article_views}, 0))::float/86400 ;;
    value_format: "m:ss"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
