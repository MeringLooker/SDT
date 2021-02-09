view: pdt_fy21_pullthrough_campaign {
  derived_table: {
    sql:
          select * from ${pdt_fy21_pullthrough_adara.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_pullthrough_adara_2h_3p.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_pullthrough_sojern.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_pullthrough_tripadvisor.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_pullthrough_priceline.SQL_TABLE_NAME}
          union
          select * from ${pdt_fy21_pullthrough_expedia_pub.SQL_TABLE_NAME}
            ;;
    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*8)/(60*60*24)) ;;
    distribution_style: all
  }

#### Primary Key Added ####

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${campaign}||'_'||${publisher}||'_'||${market}||'_'||${layer}||'_'||${region}||'_'||${placement}||'_'||${creative_name}||'_'||${ad_size}||'_'||${date} ;;
  }

### All dimensions go below ###

  dimension: publisher {
    type: string
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

  dimension: layer {
    type: string
    sql: ${TABLE}.layer ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: placement {
    type: string
    label: "Campaign Placement"
    sql: ${TABLE}.placement ;;
  }

  dimension: creative_name {
    type: string
    sql: ${TABLE}.creative_name ;;
  }

  dimension: ad_size {
    type: string
    sql: ${TABLE}.ad_size ;;
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
      WHEN ${date} BETWEEN '2020-07-01' AND '2021-06-30' THEN 'FY 20/21'
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

  dimension: completes {
    type: number
    hidden: yes
    sql: ${TABLE}.total_completes ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: ${TABLE}.total_views ;;
  }

  dimension: sessions {
    type: number
    hidden: yes
    sql: ${TABLE}.total_sessions ;;
  }

  dimension: session_duration {
    type: number
    hidden: yes
    sql: ${TABLE}.total_session_duration ;;
  }

  ## Creative dimensions ##

  dimension: creative_set {
    type: string
    drill_fields: [placement,creative_name]
    hidden: no
    sql: case
            when ${creative_name} ilike '%KidsFree%' then 'Kids Free'
            when ${creative_name} ilike '%Kids-Free%' then 'Kids Free'
            when ${creative_name} ilike '%Kids Free%' then 'Kids Free'
            when ${creative_name} ilike '%HICYB%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%BookHotel%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%PlanNow%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Book Hotel%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Plan Now%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike 'Sunset%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike 'Surfing%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike 'Family%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike 'Outdoor_v1%' then 'TripAdvisor Outdoor'
            when ${creative_name} ilike 'Outdoor_v2%' then 'TripAdvisor Outdoor'
            when ${creative_name} ilike 'ExpediaNativeTile%' and ${date} BETWEEN '2020-07-27' AND '2020-10-13' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike 'ExpediaNativeTile%' and ${date} BETWEEN '2020-07-27' AND '2021-01-03' then 'WeekYay'
            when ${creative_name} ilike '%Happiness Is Calling You Back%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%WeekYay%' then 'WeekYay'
            else 'Uncategorized'
            end
      ;;
  }

  dimension: is_kids_free {
    label: "Is Kids Free"
    type: yesno
    hidden: no
    sql: ${creative_set} = 'Kids Free' ;;
  }

  dimension: is_hicyb {
    label: "Is HICYB"
    type: yesno
    hidden: no
    sql: ${creative_set} = 'Happiness Is Calling You Back' ;;
  }

  dimension: is_weekyay {
    label: "Is WeekYay"
    type: yesno
    hidden: no
    sql: ${creative_set} = 'WeekYay' ;;
  }

  dimension: is_ta_outdoor {
    label: "Is TripAdvisor Outdoor"
    type: yesno
    hidden: no
    sql: ${creative_set} = 'Kids Free' ;;
  }

### All measures go below ###

  measure: total_impressions {
    type: sum
    # sql_distinct_key: ${primary_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum
    # sql_distinct_key: ${primary_key} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_cost {
    type: sum
    label: "Total Media Spend"
    # sql_distinct_key: ${primary_key} ;;
    value_format_name: usd
    sql: ${cost} ;;
  }

  measure: total_views {
    type: sum
    # sql_distinct_key: ${primary_key} ;;
    sql: ${views} ;;
    hidden: yes
  }

  measure: total_completes {
    type: sum
    # sql_distinct_key: ${primary_key} ;;
    sql: ${completes} ;;
    hidden: yes
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

  measure: total_sessions {
    type: sum
    # sql_distinct_key: ${primary_key} ;;
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    type: number
    label: "CPS"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_sessions}, 0) ;;
  }

  measure: total_session_duration {
    type: sum
    # sql_distinct_key: ${primary_key} ;;
    sql: ${session_duration} ;;
    hidden: yes
  }

  measure: avg_session_duration {
    label: "Avg. TOS"
    type: number
    sql: (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400 ;;
    value_format: "m:ss"
  }
}
