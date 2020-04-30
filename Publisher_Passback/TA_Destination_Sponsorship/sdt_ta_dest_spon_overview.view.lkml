view: sdt_ta_dest_spon_overview {
  sql_table_name: public.sdt_ta_dest_spon_overview ;;

# Primary Key #

  dimension: overview_pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.overview_pk ;;
  }

  # Dimensions Added Via LookML #

    dimension: market {
      type: string
      sql:
        case
          when ${locale} = 'en_US' then 'United States'
          when ${locale} = 'en_UK' then 'United Kingdom'
          when ${locale} = 'en_CA' then 'Canada'
          else 'Uncategorized'
          end
          ;;
    }

    # Dimensions native to this table #

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

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: month {
    type: date_month
    sql: ${TABLE}.date ;;
  }

  dimension: geo_id {
    type: number
    hidden: yes
    sql: ${TABLE}."geo id" ;;
  }

  dimension: geo_name {
    type: string
    sql: ${TABLE}."geo name" ;;
  }

  dimension: locale {
    type: string
    hidden: yes
    sql: ${TABLE}.locale ;;
  }

  dimension: platform_group {
    type: string
    label: "Platform/Device"
    sql: ${TABLE}."platform group" ;;
  }

  dimension: unique_users {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_users ;;
  }

  dimension: uniques_with_engagements {
    type: number
    hidden: yes
    sql: ${TABLE}.uniques_with_engagements ;;
  }

  # Measures #

  measure: total_unique_users {
    type: sum_distinct
    sql_distinct_key: ${overview_pk} ;;
    sql: ${unique_users} ;;
  }

  measure: total_unique_users_with_engagement {
    type: sum_distinct
    sql_distinct_key: ${overview_pk} ;;
    label: "Uniques w/ Engagements"
    sql: ${uniques_with_engagements} ;;
  }

  measure: engagement_rate {
    type: number
    sql: 1.0*${total_unique_users_with_engagement}/nullif(${total_unique_users}, 0) ;;
    value_format_name: percent_2
  }

  measure: count {
    type: count
    hidden: yes
  }
}
