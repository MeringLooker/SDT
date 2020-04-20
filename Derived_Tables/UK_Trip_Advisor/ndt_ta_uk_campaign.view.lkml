view: ndt_ta_uk_campaign {
derived_table: {
  sql:
        select * from ${ndt_ta_uk_audext_video.SQL_TABLE_NAME}
        union
        select * from ${ndt_ta_uk_audext_social.SQL_TABLE_NAME}
        union
        select * from ${ndt_ta_uk_homepage_hero.SQL_TABLE_NAME}
        union
        select * from ${ndt_ta_uk_destination_sponsorship.SQL_TABLE_NAME}
        union
        select * from ${ndt_ta_uk_hub_traffic_drivers.SQL_TABLE_NAME}
        union
        select * from ${ndt_ta_uk_outstream_video_banners.SQL_TABLE_NAME}
        union
        select * from ${ndt_ta_uk_video_banners.SQL_TABLE_NAME}
            ;;
  sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*1)/(60*60*24)) ;;
  distribution_style: all
}

#### Primary Key Added #####

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${layer}||'_'||${placement}||'_'||${pillar}||'_'||${ad_size}||'_'||${impressions}||'_'||${clicks}||'_'||${cost}||'_'||${views}||'_'||${completes}||'_'||${date} ;;
  }


### All dimensions go below ###

  dimension: layer {
    type: string
    drill_fields: [placement,date,week,month]
    sql: ${TABLE}.layer ;;
  }

  dimension: placement {
    type: string
    drill_fields: [ad_size,pillar,date,week,month]
    sql: ${TABLE}.placement ;;
  }

  dimension: pillar {
    type: string
    drill_fields: [placement,date,week,month]
    sql: ${TABLE}.pillar ;;
  }

  dimension: ad_size {
    type: string
    drill_fields: [date,week,month]
    sql: ${TABLE}.ad_size ;;
  }


  dimension: fiscal_year {
    type:  string
    group_label: "Date Periods"
    sql:
      CASE
      WHEN ${date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
      WHEN ${date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
      ELSE 'Uncategorized'
      END
    ;;
  }

  dimension: date {
    type: date
    group_label: "Date Periods"
    sql: ${TABLE}.date ;;
  }

  dimension: week {
    type: date_week
    group_label: "Date Periods"
    sql: ${TABLE}.week ;;
  }

  dimension: month {
    type: date_month
    group_label: "Date Periods"
    sql: ${TABLE}.month ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.total_clicks ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql:  ${TABLE}.total_cost ;;
    value_format_name: usd
  }

  dimension: views {
    type: number
    hidden: yes
    sql: ${TABLE}.total_views ;;
  }

  dimension: completes {
    type: number
    hidden: yes
    sql: ${TABLE}.total_completes ;;
  }


### All measures go below ###

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
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
    sql_distinct_key: ${primary_key} ;;
    value_format_name: usd
    sql: ${cost} ;;
  }

  measure: total_views {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${completes} ;;
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
  }

  measure: view_rate {
    type: number
    label: "View Rate"
    sql: 1.0*${total_views}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: completion_rate {
    type: number
    label: "Completion Rate"
    sql: 1.0*${total_completes}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_view {
    type: number
    label: "CPV"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_views}, 0) ;;
  }

  measure: cost_per_complete {
    type: number
    label: "CPcV"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_completes}, 0) ;;
  }

  measure: count {
    type: count
  }
}
