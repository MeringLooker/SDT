view: sdt_omnitrak_program {
  sql_table_name: public.sdt_omnitrak_program ;;

  ### Primary Key ###

  dimension: omnitrak_program_key {
    # label: "Omnitrak Key"
    hidden: yes
    primary_key: yes
    type: string
    sql:${program}||'_'||${region}||'_'||${month} ;;
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

  dimension: month {
    type: date_month
    sql: ${TABLE}.month ;;
  }

  dimension: program {
    type: string
    sql: ${TABLE}.program ;;
  }

  dimension: program_rating {
    hidden: no
    type: number
    sql: ${TABLE}.program_rating ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  ## Measures ##

  measure: rating {
    label: "Program Rating"
    description: "Omnitrak Rating for various Creative Campaigns."
    type: sum_distinct
    sql_distinct_key: ${omnitrak_program_key} ;;
    sql: ${TABLE}.program_rating ;;
  }
}
