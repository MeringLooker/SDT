view: sdt_fy20_premium_digital_socialamp {
  sql_table_name: public.sdt_fy20_premium_digital_socialamp ;;
  drill_fields: [id]

  ### Primary Key ###

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  #### Dimensions added to this table via LookML ####

  dimension: publisher {
    type: string
    sql:'Travel + Leisure' ;;
  }

  dimension: sdt_campaign {
    type: string
    sql:'Premium Digital Display' ;;
  }

  dimension: sdt_placement {
    type: string
    sql:'T+L - Social Amplification' ;;
  }

  dimension: adsize {
    type: string
    sql:'N/A' ;;
  }

  dimension: creative_name {
    type: string
    sql:
      case
        when ${social_creative} = 'VisitSanDiego_TL_FB_Weekend' then 'Weekend'
        when ${social_creative} = 'VisitSanDiego_TL_FB_DogFriendly' then 'Dog Friendly'
        when ${social_creative} = 'VisitSanDiego_TL_FB_Beaches' then 'Beaches'
        when ${social_creative} = 'VisitSanDiego_TL_FB_Instagram' then 'Instagram'
        else null
        end
    ;;
  }


  #### All Dimensions native to this table ####

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

  dimension: comments {
    type: number
    hidden: yes
    sql: ${TABLE}.comments ;;
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

  dimension: engagements {
    type: number
    hidden: yes
    sql: ${TABLE}.engagements ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: media_spend {
    type: number
    hidden: yes
    sql: ${TABLE}.media_spend ;;
  }

  dimension: reactions {
    type: number
    hidden: yes
    sql: ${TABLE}.reactions ;;
  }

  dimension: shares {
    type: number
    hidden: yes
    sql: ${TABLE}.shares ;;
  }

  dimension: social_creative {
    type: string
    label: "Creative Name"
    sql: ${TABLE}.social_creative ;;
  }

  dimension: viewable_impressions {
    type: number
    hidden: yes
    sql: null ;;
  }

  dimension: measureable_impressions {
    type: number
    hidden: yes
    sql: null ;;
  }

  dimension: sessions {
    type: number
    hidden: yes
    sql: 0 ;;
  }

  dimension: session_duration {
    type: number
    hidden: yes
    sql: 0 ;;
  }

  ### Measures go below ###

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
    sql: ${media_spend} ;;
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

  measure: total_reactions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${reactions} ;;
  }

  measure: total_comments {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${comments} ;;
  }

  measure: total_shares {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${shares} ;;
  }

  measure: total_engagements {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${engagements} ;;
  }

  measure: engagement_rate {
    type: number
    label: "Engagement Rate"
    sql: 1.0*${total_engagements}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_viewable_impressions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${viewable_impressions} ;;
  }

  measure: total_measureable_impressions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${measureable_impressions} ;;
  }

  measure: total_sessions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${sessions} ;;
  }

  measure: total_session_duration {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${session_duration} ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
