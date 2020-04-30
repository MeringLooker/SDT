view: sdt_ta_dest_spon_elements {
  sql_table_name: public.sdt_ta_dest_spon_elements ;;

# Primary Key #

  dimension: elements_pk {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.elements_pk ;;
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

  dimension: element {
    type: string
    sql: ${TABLE}.element ;;
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

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
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
    label: "Platform/Device"
    sql: ${TABLE}."platform group" ;;
  }

  # Measures #

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${elements_pk} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${elements_pk} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    label: "CTR"
    type: number
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
  }

  measure: count {
    type: count
    hidden: yes
  }
}
