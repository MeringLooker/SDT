view: sdt_fy21_awareness_tripadv_data {
  sql_table_name: public.sdt_fy21_awareness_tripadv_data ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: creative {
    type: string
    sql: ${TABLE}.creative ;;
  }

  dimension: sdt_campaign {
    type: string
    sql: 'Spring Awareness' ;;
  }

  dimension: sdt_market {
    type: string
    sql: 'United States' ;;
  }

  dimension: publisher {
    type: string
    sql: 'Trip Advisor' ;;
  }

  dimension: sdt_region {
    type: string
    sql:
      case
        when ${creative} ilike '29477_296681575_TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Variety Seeker_WesternRegion_Horizon_2.22.21' then 'Western Region'
        when ${creative} ilike '29477_296435753_TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Variety Seeker_Arizona_Horizon_2.22.21' then 'Arizona'
        when ${creative} ilike '29477_296435747_TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Variety Seeker_California_Horizon_2.22.21' then 'California'
        else 'Uncategorized'
        end ;;
  }

  dimension: sdt_placement {
    type: string
    sql:
      case
        when ${creative} ilike '%TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Variety Seeker_%_Horizon_2.22.21' then 'TripAdvisor Horizon High Impact Display (Variety Seeker)'
        else 'Uncategorized'
        end ;;
  }

  dimension: creative_name {
    type: string
    sql:
      case
        when ${creative} ilike '%TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Variety Seeker_%_Horizon_2.22.21' then 'TripAdvisor_Horizon'
        else 'Uncategorized'
        end ;;
  }

  dimension: ad_size {
    type: string
    sql:
      case
        when ${creative} ilike '%TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Variety Seeker_%_Horizon_2.22.21' then 'Horizon High Impact'
        else 'Uncategorized'
        end ;;
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
    sql: ${TABLE}.impressions ;;
  }

  dimension: line_item {
    type: string
    sql: ${TABLE}.line_item ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  ## Measure ##

  measure: total_impressions {
    sql: ${impressions} ;;
    type: sum
  }

  measure: total_clicks {
    sql: ${clicks} ;;
    type: sum
  }

  measure: total_cost {
    sql: ${cost} ;;
    type: sum
  }

  measure: total_views {
    sql: 0 ;;
    type: sum
  }

  measure: total_completes {
    sql: 0 ;;
    type: sum
  }

  measure: total_sessions {
    sql: 0 ;;
    type: sum
  }

  measure: total_session_duration {
    sql: 0 ;;
    type: sum
  }
}
