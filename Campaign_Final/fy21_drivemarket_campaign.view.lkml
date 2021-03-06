view: sdt_fy21_drivemarket_campaign {
  sql_table_name: public.sdt_fy21_drivemarket_campaign ;;

#### Primary Key Added ####

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${campaign}||'_'||${publisher}||'_'||${market}||'_'||${layer}||'_'||${region}||'_'||${placement}||'_'||${creative_name}||'_'||${creative_set}||'_'||${date} ;;
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
    drill_fields: [creative_set]
    label: "Campaign Placement"
    sql: ${TABLE}.placement ;;
  }

  dimension: creative_name {
    type: string
    sql: ${TABLE}.creative_name ;;
  }

  dimension: fiscal_year {
    type:  string
    group_label: "Date Periods"
    sql:
      CASE
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
            when ${creative_name} ilike '%High Impact Halo Unit%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Desktop_Portrait%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Drive Market IG Story%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Family Pin%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Pandora :30 Audio%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Surfers%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Surfer Coast%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Surfer Girl%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Roller Girls%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%TripAdvisor_2560x400%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Pandora_750x1400%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%Happiness Is Calling You Back%' then 'Happiness Is Calling You Back'
            when ${creative_name} ilike '%WeekYay%' then 'WeekYay'
            else 'Uncategorized'
            end
      ;;
  }

  dimension: is_kids_free {
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
    hidden: yes
    # sql_distinct_key: ${primary_key} ;;
    sql: ${session_duration} ;;
  }

  measure: avg_session_duration {
    label: "Avg. TOS"
    type: number
    sql: (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400 ;;
    value_format: "m:ss"
  }
}
