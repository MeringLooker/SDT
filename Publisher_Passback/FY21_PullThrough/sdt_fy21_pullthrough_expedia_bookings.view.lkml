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
        when ${line_item_name} ilike '001:1655877%' then 'Expedia ROS Results Right - SD Intenders'
        when ${line_item_name} ilike '002:1655870%' then 'EBP Hotels+Vacation Packages Display - SD Intenders'
        when ${line_item_name} ilike '003:1655875%' then 'EBP Homepage Center Top - SD Intenders'
        when ${line_item_name} ilike '004:1655876%' then 'EBP Display - SD Intenders'
        when ${line_item_name} ilike '005:1655874%' then 'EBP Premium Hotels Bundle - SD Intenders'
        when ${line_item_name} ilike '007:1655880%' then 'EBP Homepage Center Top - Travel Intenders'
        when ${line_item_name} ilike '008:1655881%' then 'Expedia ROS Results Right - SD Intenders'
        when ${line_item_name} ilike '009:1655883%' then 'Hotels.com ROS Responsive - SD Intenders'
        when ${line_item_name} ilike '010:1655882%' then 'Hotels.com ROS - SD Intenders'
        when ${line_item_name} ilike '011:1655886%' then 'EBP Hotels+Vacation Packages Center Top - SD Intenders'
        when ${line_item_name} ilike '012:1658029%' then 'Expedia ROS Search Tiles - Travel Intenders'
        when ${line_item_name} ilike '013:1655887%' then 'Expedia ROS Search Center Top - Travel Intenders'
        when ${line_item_name} ilike '014:1655885%' then 'Expedia ROS Search Tiles - Travel Intenders'
        when ${line_item_name} ilike '019:1655893%' then 'EBP Hotels+Vacation Packages Center Top - SD Intenders'
        when ${line_item_name} ilike '020:1658031%' then 'Expedia ROS Search Tiles - Travel Intenders'
        when ${line_item_name} ilike '021:1655894%' then 'Expedia ROS Search Center Top - SD Intenders'
        when ${line_item_name} ilike '022:1655895%' then 'Expedia ROS Search Tiles - Travel Intenders'

        when ${line_item_name} ilike '001:1690246%' then 'Expedia.com ROS Right Results'
        when ${line_item_name} ilike '002:1710091%' then 'Expedia.com Hotels Photo Gallery Display'
        when ${line_item_name} ilike '003:1710092%' then 'Expedia.com Hotels Infosite/Details Display'
        when ${line_item_name} ilike '004:1709613%' then 'Expedia.com ROS Display'
        when ${line_item_name} ilike '005:1690244%' then 'Expedia.com ROS Responsive Display'
        when ${line_item_name} ilike '006:1710085%' then 'Expedia.com Marquee Card'
        when ${line_item_name} ilike '007:1709611%' then 'Hotels.com Destination Results Listing'
        when ${line_item_name} ilike '008:1710083%' then 'Hotels.com ROS Display'
        when ${line_item_name} ilike '009:1690985%' then 'Hotels.com ROS Display'
        when ${line_item_name} ilike '010:1690245%' then 'Hotels.com ROS Responsive Display'
        when ${line_item_name} ilike '011:1690237%' then 'Expedia Brands Portfolio Display'
        when ${line_item_name} ilike '012:1690911%' then 'Expedia.com ROS Right Results'
        when ${line_item_name} ilike '013:1690916%' then 'Expedia.com Marquee Card'
        when ${line_item_name} ilike '014:1690917%' then 'Expedia.com ROS Responsive Display'
        when ${line_item_name} ilike '015:1690925%' then 'Expedia.com ROS Right Results'
        when ${line_item_name} ilike '016:1690919%' then 'Expedia.com ROS Responsive Display'
        when ${line_item_name} ilike '017:1690927%' then 'Expedia.com Marquee Card'

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
    value_format_name: usd_0
  }

  measure: total_click_thru_revenue {
    label: "Click Thru Booking Revenue"
    type: sum_distinct
    sql_distinct_key: ${bookings_join_id} ;;
    sql: ${click_thru_revenue} ;;
    value_format_name: usd_0
  }

  measure: total_gross_revenue {
    label: "Gross Booking Revenue"
    type: sum_distinct
    sql_distinct_key: ${bookings_join_id} ;;
    sql: ${gross_revenue} ;;
    value_format_name: usd_0
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
    value_format_name: usd
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
