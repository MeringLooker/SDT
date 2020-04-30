view: sdt_ta_dest_spon_content {
  sql_table_name: public.sdt_ta_dest_spon_content ;;

  # Primary Key #

  dimension: content_pk {
    type: string
    hidden: yes
    sql: ${TABLE}.content_pk ;;
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

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: content_name {
    type: string
    sql: ${TABLE}."content name" ;;
  }

  dimension: content_type {
    type: string
    sql: ${TABLE}."content type" ;;
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

  dimension: overview_pk {
    type: string
    hidden: yes
    sql: ${TABLE}.overview_pk ;;
  }

  dimension: platform_group {
    type: string
    sql: ${TABLE}."platform group" ;;
  }

  # Measure #

  measure: total_clicks {
    type: sum_distinct
    sql: ${clicks} ;;
    sql_distinct_key: ${content_pk} ;;
  }

}
