view: pdt_fy21_spring_awareness_campaign {
  derived_table: {
    sql:
        select * from ${pdt_fy21_spring_awareness_fb.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_seesource.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_pin.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_hulu.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_abc.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_cbs.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_clearchannel.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_cn.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_nbc.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_pandora.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_pandora_video.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_spotify.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_tripadv.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_ta_horizon.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_vdx.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_snap.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_tz.SQL_TABLE_NAME}
        union
        select * from ${pdt_fy21_spring_awareness_helm.SQL_TABLE_NAME}
        ;;
    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*8)/(60*60*24)) ;;
    distribution_style: all
  }


#### Primary Key Added ####

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${campaign}||'_'||${publisher}||'_'||${market}||'_'||${region}||'_'||${placement}||'_'||${creative_name}||'_'||${ad_size}||'_'||${date} ;;
  }

### All dimensions go below ###

  dimension: creative_set {
    type: string
    drill_fields: [placement,creative_name]
    hidden: no
    sql: case
            when ${creative_name} ilike '%HICYB%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%BookHotel%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%PlanNow%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Book Hotel%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Plan Now%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike 'Sunset%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike 'Surfing%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike 'Family%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%TripAdvisor%' then 'TripAdvisor Outdoor'
            when ${creative_name} ilike '%Happiness Is Calling You Back%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%WeekYay%' then 'WeekYay'
            when ${creative_name} ilike 'BB:%' then 'Bliss Break'
            when ${creative_name} ilike 'TravelZoo%' then 'TravelZoo'
            else 'Uncategorized'
            end
      ;;
  }

  dimension: is_tripadvisor_outdoor {
    type: yesno
    hidden: no
    sql: ${creative_set} = 'TripAdvisor Outdoor' ;;
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

  dimension: is_bliss_break {
    label: "Is Bliss Break"
    type: yesno
    hidden: no
    sql: ${creative_set} = 'Bliss Break' ;;
  }

  dimension: publisher {
    type: string
    drill_fields: [region,placement,creative_name]
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
    sql: ${TABLE}.region ;;
  }

  dimension: placement {
    type: string
    drill_fields: [creative_name]
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

  dimension: date {
    type: date
    group_label: "Date Periods"
    sql: ${TABLE}.date ;;
  }

  dimension: week {
    type: date_week
    group_label: "Date Periods"
    sql: ${TABLE}.date ;;
  }

  dimension: month {
    type: date_month
    group_label: "Date Periods"
    sql: ${TABLE}.date ;;
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

  dimension: cost {
    type: number
    hidden: yes
    sql:  ${TABLE}.total_cost ;;
    value_format_name: usd
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

### All measures go below ###

  measure: total_impressions {
    type: sum
    label: "Impressions"
    # sql_distinct_key: ${primary_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum
    label: "Clicks"
    # sql_distinct_key: ${primary_key} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views {
    type: sum
    label: "Video Views"
    # sql_distinct_key: ${primary_key} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum
    label: "Video Completes"
    # sql_distinct_key: ${primary_key} ;;
    sql: ${completes} ;;
    value_format_name: decimal_0
  }

  measure: total_cost {
    type: sum
    label: "Media Spend"
    # sql_distinct_key: ${primary_key} ;;
    value_format_name: usd
    sql: ${cost} ;;
  }

  measure: video_impressions {
    type: sum
    hidden: yes
    # sql_distinct_key: ${primary_key} ;;
    sql:
      case
        when ${views} > 0 then ${impressions}
        else null
        end
        ;;
  }

  measure: view_rate {
    type: number
    label: "View Rate"
    sql: 1.0*${total_views}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: completion_rate {
    type: number
    label: "Completion Rate"
    sql: 1.0*${total_completes}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
  }

  measure: video_cost {
    type: sum
    hidden: yes
    # sql_distinct_key: ${primary_key} ;;
    sql:
      case
        when ${views} > 0 then ${cost}
        else null
        end
        ;;
  }

  measure: cost_per_view {
    type: number
    label: "CPV"
    value_format_name: usd
    sql: ${video_cost}/nullif(${total_views}, 0) ;;
  }

  measure: cost_per_complete {
    type: number
    label: "CPcV"
    value_format_name: usd
    sql: ${video_cost}/nullif(${total_completes}, 0) ;;
  }

  measure: total_sessions {
    type: sum
    label: "Sessions"
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
    hidden: no
    # sql_distinct_key: ${primary_key} ;;
    sql: ${session_duration} ;;
  }

  measure: avg_session_duration {
    label: "Avg. TOS"
    type: number
    sql: (floor((${total_session_duration}::numeric(19,6))/nullif(${total_sessions}, 0)))::float/86400 ;;
    value_format: "m:ss"
  }
}
