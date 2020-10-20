view: sdt_omnitrak_creative {
  sql_table_name: public.sdt_omnitrak_creative ;;

  ### Primary Key ###

  dimension: omnitrak_creative_key {
    # label: "Omnitrak Key"
    hidden: yes
    primary_key: yes
    type: string
    sql:${creative_campaign}||'_'||${region}||'_'||${month} ;;
  }

  ## Dimensions for Table ##

  dimension_group: __senttime {
    hidden: yes
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
    sql: ${TABLE}.__senttime ;;
  }

  dimension: __state {
    hidden: yes
    type: string
    sql: ${TABLE}.__state ;;
  }

  dimension_group: __updatetime {
    hidden: yes
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
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: creative_campaign {
    label: "Creative Campaign"
    type: string
    sql: ${TABLE}.creative_campaign ;;
  }

  dimension: creative_rating {
    hidden: yes
    description: "Omnitrak Rating for various Creative Campaigns."
    type: number
    sql: ${TABLE}.creative_rating ;;
  }

  dimension: month {
    type: date_month
    sql: ${TABLE}.month ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  ## Measures ##

  measure: rating {
    label: "Creative Rating"
    description: "Omnitrak Rating for various Creative Campaigns."
    type: sum_distinct
    sql_distinct_key: ${omnitrak_creative_key} ;;
    sql: ${TABLE}.creative_rating ;;
    value_format_name: decimal_1
  }


}
