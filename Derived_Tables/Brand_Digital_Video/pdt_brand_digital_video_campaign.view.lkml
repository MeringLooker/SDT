view: pdt_brand_digital_video_campaign {
  derived_table: {
    sql:
        select * from ${pdt_brand_digital_video_fb.SQL_TABLE_NAME}
        union
        select * from ${pdt_brand_digital_video_yt.SQL_TABLE_NAME}
        union
        select * from ${pdt_brand_digital_video_cbs.SQL_TABLE_NAME}
        union
        select * from ${pdt_brand_digital_video_hulu.SQL_TABLE_NAME}
        union
        select * from ${pdt_brand_digital_video_nbc.SQL_TABLE_NAME}
        union
        select * from ${pdt_brand_digital_video_amobee.SQL_TABLE_NAME}
        union
        select * from ${pdt_brand_digital_video_abc.SQL_TABLE_NAME}

        ;;
    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*1)/(60*60*24)) ;;
    distribution_style: all
  }


#### Primary Key Added ####

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${campaign}||'_'||${publisher}||'_'||${market}||'_'||${region}||'_'||${audience}||'_'||${creative_name}||'_'||${date} ;;
  }

### All dimensions go below ###

  dimension: publisher {
    type: string
    drill_fields: [region,audience,creative_name,date,week,month]
    sql: ${TABLE}.publisher ;;
  }

  dimension: campaign {
    type: string
    hidden: yes
    sql: ${TABLE}.campaign ;;
  }

  dimension: market {
    type: string
    hidden: yes
    sql: ${TABLE}.market ;;
  }

  dimension: region {
    type: string
    drill_fields: [publisher,audience,creative_name,date,week,month]
    sql: ${TABLE}.region ;;
  }

  dimension: audience {
    type: string
    drill_fields: [region,publisher,creative_name,date,week,month]
    sql: ${TABLE}.audience ;;
  }

  dimension: creative_name {
    type: string
    drill_fields: [publisher,region,audience,date,week,month]
    sql: ${TABLE}.creative_name ;;
  }

  dimension: fiscal_year {
    type:  string
    group_label: "Date Periods"
    sql:
      CASE
      WHEN ${date} BETWEEN '2013-07-01' AND '2014-06-30' THEN 'FY 13/14'
      WHEN ${date} BETWEEN '2014-07-01' AND '2015-06-30' THEN 'FY 14/15'
      WHEN ${date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
      WHEN ${date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
      WHEN ${date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
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

  dimension: quarter {
    type: date_quarter
    group_label: "Date Periods"
    sql: ${TABLE}.quarter ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.total_impressions ;;
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
    value_format_name: decimal_0
  }

  dimension: cost {
    type: number
    hidden: yes
    sql:  ${TABLE}.total_cost ;;
    value_format_name: usd
  }

### All measures go below ###

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_views {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    value_format_name: decimal_0
    sql_distinct_key: ${primary_key} ;;
    sql: ${completes} ;;
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

  measure: completion_rate_2 {
    type: number
    label: "Completion Rate (exc Banners)"
    sql:
      case
        when ${creative_name} = 'Companion Banner' then null
        else 1.0*${total_completes}/nullif(${total_impressions}, 0)
        end;;
    value_format_name: percent_2
  }

  measure: total_cost {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    value_format_name: usd
    sql: ${cost} ;;
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
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
