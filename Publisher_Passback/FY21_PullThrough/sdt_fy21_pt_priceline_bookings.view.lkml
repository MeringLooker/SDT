view: sdt_fy21_pt_priceline_bookings {
  sql_table_name: public.sdt_fy21_pt_priceline_bookings ;;
  drill_fields: [id]

  ## Primary Key ##

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

## Dimensions Native to table ##

  dimension: ad_spend {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: click_thru_bookings {
    hidden: yes
    type: number
    sql: ${TABLE}.click_thru_bookings ;;
  }

  dimension: click_thru_revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.click_thru_revenue ;;
  }

  dimension: clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension_group: date {
    type: time
    group_label: "Date Periods"
    label: ""
    timeframes: [
      month,
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: line_item_name {
    label: "Priceline Line Item"
    type: string
    sql: REPLACE(${TABLE}.line_item_name, 'PULL THROUGH - ', '' )
    ;;
  }

  dimension: roas {
    type: number
    hidden: yes
    sql: ${TABLE}.roas ;;
  }

  dimension: view_thru_bookings {
    type: number
    hidden: yes
    sql: ${TABLE}.view_thru_bookings ;;
  }

  dimension: view_thru_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.view_thru_revenue ;;
  }

  ######### All measures go below ########

  measure: total_impressions {
    label: "Impressions"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    label: "Clicks"
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

  measure: total_spend {
    label: "Ad Spend"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${ad_spend} ;;
    value_format_name: usd_0
  }

  measure: total_gross_revenue {
    label: "Gross Revenue"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${view_thru_revenue} + ${click_thru_revenue} ;;
    value_format_name: usd_0
  }

  measure: total_view_thru_revenue {
    label: "View Thru Booking Revenue"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${view_thru_revenue} ;;
    value_format_name: usd_0
  }

  measure: total_click_thru_revenue {
    label: "Click Thru Booking Revenue"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${click_thru_revenue} ;;
    value_format_name: usd_0
  }

  measure: total_view_thru_bookings {
    label: "View Thru Bookings"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${view_thru_bookings} ;;
  }

  measure: total_click_thru_bookings {
    label: "Click Thru Bookings"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${click_thru_bookings} ;;
  }

  measure: total_bookings {
    label: "Bookings"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${view_thru_bookings} + ${click_thru_bookings} ;;
  }

  measure: total_roas {
    label: "ROAS"
    type: number
    sql: ${total_gross_revenue}/nullif(${total_spend},0) ;;
    value_format_name: usd
  }
}
