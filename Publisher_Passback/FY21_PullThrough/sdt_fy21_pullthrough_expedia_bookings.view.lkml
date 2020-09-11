view: sdt_fy21_pullthrough_expedia_bookings {
  sql_table_name: public.sdt_fy21_pullthrough_expedia_bookings ;;

  ## Primary ID ##

  dimension: bookings_join_id {
    hidden: yes
    type: string
    sql: ${line_item_name}||'_'||${date_month} ;;
  }

  ## Dimensions Added to this table via LookML ##

  dimension: publisher {
    type: string
    group_label: "Client Dimensions"
    sql: 'Expedia' ;;
  }

  dimension: sdt_market {
    type: string
    label: "Market"
    group_label: "Client Dimensions"
    sql: 'United States' ;;
  }

  dimension: sdt_campaign {
    type: string
    label: "Campaign"
    group_label: "Client Dimensions"
    sql: 'US Pull-Through' ;;
  }

  dimension: sdt_layer {
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql: 'Intent' ;;
  }

  dimension: sdt_placement {
    type: string
    label: "Campaign Placement"
    group_label: "Client Dimensions"
    sql:
      case
        when ${line_item_name} ilike '001:%' then 'Expedia ROS Results Right - SD Intenders'
        when ${line_item_name} ilike '002:%' then 'EBP Hotels+Vacation Packages Display - SD Intenders'
        when ${line_item_name} ilike '003:%' then 'EBP Homepage Center Top - SD Intenders'
        when ${line_item_name} ilike '004:%' then 'EBP Display - SD Intenders'
        when ${line_item_name} ilike '005:%' then 'EBP Premium Hotels Bundle - SD Intenders'
        when ${line_item_name} ilike '007:%' then 'EBP Homepage Center Top - Travel Intenders'
        when ${line_item_name} ilike '008:%' then 'Expedia ROS Results Right - SD Intenders'
        when ${line_item_name} ilike '009:%' then 'Hotels.com ROS Responsive - SD Intenders'
        when ${line_item_name} ilike '010:%' then 'Hotels.com ROS - SD Intenders'
        when ${line_item_name} ilike '011:%' then 'EBP Hotels+Vacation Packages Center Top - SD Intenders'
        when ${line_item_name} ilike '012:%' then 'Expedia ROS Search Tiles - Travel Intenders'
        when ${line_item_name} ilike '013:%' then 'Expedia ROS Search Center Top - Travel Intenders'
        when ${line_item_name} ilike '014:%' then 'Expedia ROS Search Tiles - Travel Intenders'
        when ${line_item_name} ilike '019:%' then 'EBP Hotels+Vacation Packages Center Top - SD Intenders'
        when ${line_item_name} ilike '020:%' then 'Expedia ROS Search Tiles - Travel Intenders'
        when ${line_item_name} ilike '021:%' then 'Expedia ROS Search Center Top - SD Intenders'
        when ${line_item_name} ilike '022:%' then 'Expedia ROS Search Tiles - Travel Intenders'
        else 'Uncategorized'
        end
    ;;
  }

  ## Dimensions Native to table ##

  dimension: ad_spend {
    type: number
    hidden: yes
    sql: ${TABLE}.ad_spend ;;
  }

  dimension: adr {
    type: number
    hidden: yes
    sql: ${TABLE}.adr ;;
  }

  dimension: avg_length_of_stay {
    type: number
    hidden: yes
    sql: ${TABLE}.avg_los ;;
  }

  dimension: click_thru_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.click_thru_revenue ;;
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

  dimension: gross_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.gross_revenue ;;
  }

  dimension: line_item_name {
    label: "Expedia Line Item"
    type: string
    sql: ${TABLE}.line_item_name ;;
  }

  dimension: passengers {
    type: number
    hidden: yes
    sql: ${TABLE}.passengers ;;
  }

  dimension: room_nights {
    type: number
    hidden: yes
    sql: ${TABLE}.room_nights ;;
  }

  dimension: daily_rate {
    type: number
    hidden: yes
    sql: ${TABLE}.total_daily_rate ;;
  }

  dimension: los {
    type: number
    hidden: yes
    sql: ${TABLE}.total_los ;;
  }

  dimension: view_thru_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.view_thru_revenue ;;
  }

  ######### All measures go below ########

  measure: total_view_thru_revenue {
    label: "View Thru Booking Revenue"
    type: sum_distinct
    sql_distinct_key: ${bookings_join_id} ;;
    sql: ${view_thru_revenue} ;;
    value_format_name: usd
  }

  measure: total_click_thru_revenue {
    label: "Click Thru Booking Revenue"
    type: sum_distinct
    sql_distinct_key: ${bookings_join_id} ;;
    sql: ${click_thru_revenue} ;;
    value_format_name: usd
  }

  measure: total_gross_revenue {
    label: "Gross Booking Revenue"
    type: sum_distinct
    sql_distinct_key: ${bookings_join_id} ;;
    sql: ${gross_revenue} ;;
    value_format_name: usd
  }

  measure: total_room_nights {
    label: "Room Nights"
    type: sum_distinct
    sql_distinct_key: ${bookings_join_id} ;;
    sql: ${room_nights} ;;
  }

  measure: total_pax {
    label: "Total Passengers"
    description: "This value is a self-reported figure of the number of people in a room, based on the selection the user makes."
    type: sum_distinct
    sql_distinct_key: ${bookings_join_id} ;;
    sql: ${passengers} ;;
  }

  measure: total_ad_spend {
    label: "Ad Spend"
    type: sum_distinct
    sql_distinct_key: ${bookings_join_id} ;;
    sql: ${ad_spend} ;;
    value_format_name: usd
  }

  measure: total_roas {
    label: "ROAS"
    type: number
    sql: ${total_gross_revenue}/nullif(${total_ad_spend},0) ;;
    value_format_name: usd
  }

  measure: total_daily_rate {
    hidden: yes
    type: sum_distinct
    sql_distinct_key: ${bookings_join_id} ;;
    sql: ${daily_rate} ;;
    value_format_name: usd
  }

  measure: avg_adr {
    label: "Avg. Daily Rate"
    type: number
    sql: ${total_daily_rate}/nullif(${total_room_nights},0) ;;
    value_format_name: decimal_0
  }

  measure: total_los {
    hidden: yes
    type: sum_distinct
    sql_distinct_key: ${bookings_join_id} ;;
    sql: ${los} ;;
  }

  measure: avg_los {
    label: "Avg. Length of Stay"
    type: number
    sql:  ${total_los}/nullif(${total_room_nights},0) ;;
    value_format_name: decimal_1
  }


}
