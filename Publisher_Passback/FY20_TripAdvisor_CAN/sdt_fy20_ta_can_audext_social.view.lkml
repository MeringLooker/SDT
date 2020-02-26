view: sdt_fy20_ta_can_audext_social {
  sql_table_name: public.sdt_fy20_ta_can_audext_social ;;
  drill_fields: [id]

### Primary Key ###

dimension: id {
  primary_key: yes
  hidden: yes
  type: string
  sql: ${TABLE}.id ;;
}

##### Added to This Table via LookML #####

dimension: sdt_placement {
  type: string
  group_label: "Client Dimensions"
  label: "Placement Name"
  sql: 'Audience Extension - Social' ;;
}

dimension: sdt_layer {
  type: string
  group_label: "Client Dimensions"
  label: "Layer"
  sql: 'Amplify Reach' ;;
}

dimension: sdt_pillar {
  type: string
  group_label: "Client Dimensions"
  label: "Pillar"
  sql:
      case
        when ${creative_name} ilike '%Feed_Attractions%' then 'Attractions'
        when ${creative_name} ilike '%Feed_Culinary%' then 'Culinary'
        when ${creative_name} ilike '%Feed_Culture%' then 'Culture'
        when ${creative_name} ilike '%Feed Image_Entertainment%' then 'Entertainment'
        when ${creative_name} ilike '%Feed Image_Outdoors%' then 'Outdoor'
        else 'Uncategorized'
        end;;
}

dimension: sdt_campaign {
  type: string
  group_label: "Client Dimensions"
  label: "Campaign Name"
  sql: 'CAN TripAdvisor Program' ;;
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
  sql: 'Canada' ;;
}

dimension: ad_size {
  type: string
  group_label: "Client Dimensions"
  label: "Ad Size"
  sql: 'N/A' ;;
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

dimension: creative_name {
  type: string
  label: "TripAdvisor Creative Name"
  sql: ${TABLE}.creative_name ;;
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

dimension: device {
  type: string
  sql: ${TABLE}.device ;;
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

dimension: platform {
  type: string
  sql: ${TABLE}.platform ;;
}

dimension: post_comments {
  type: number
  hidden: yes
  sql: ${TABLE}.post_comments ;;
}

dimension: post_engagements {
  type: number
  hidden: yes
  sql: ${TABLE}.post_engagements ;;
}

dimension: post_reactions {
  type: number
  hidden: yes
  sql: ${TABLE}.post_reactions ;;
}

dimension: post_shares {
  type: number
  hidden: yes
  sql: ${TABLE}.post_shares ;;
}

dimension: views {
  type: number
  hidden: yes
  sql: 0 ;;
}

dimension: completes {
  type: number
  hidden: yes
  sql: 0 ;;
}

#### Measures go below ####

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

measure: total_reactions {
  type: sum_distinct
  sql_distinct_key: ${id} ;;
  sql: ${post_reactions} ;;
}

measure: total_comments {
  type: sum_distinct
  sql_distinct_key: ${id} ;;
  sql: ${post_comments} ;;
}

measure: total_shares {
  type: sum_distinct
  sql_distinct_key: ${id} ;;
  sql: ${post_shares} ;;
}

measure: total_engagements {
  type: sum_distinct
  sql_distinct_key: ${id} ;;
  sql: ${post_engagements} ;;
}

measure: engagement_rate {
  type: number
  label: "Engagement Rate"
  sql: 1.0*${total_engagements}/nullif(${total_impressions}, 0) ;;
  value_format_name: percent_2
}

measure: total_views {
  type: sum_distinct
  hidden: yes
  sql_distinct_key: ${id} ;;
  sql: ${views} ;;
}

measure: total_completes {
  type: sum_distinct
  hidden: yes
  sql_distinct_key: ${id} ;;
  sql: ${completes} ;;
}

measure: count {
  type: count
  drill_fields: [id, creative_name]
}
}
