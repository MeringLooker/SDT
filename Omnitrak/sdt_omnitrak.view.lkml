view: sdt_omnitrak {
  sql_table_name: public.sdt_omnitrak ;;
  drill_fields: [id]

  ### Primary Key ###

  dimension: omnitrak_key_old {
    hidden: no
    primary_key: yes
    type: string
    sql: ${TABLE}.omnitrak_key ;;
  }

  dimension: omnitrak_key_new {
    # label: "Omnitrak Key"
    hidden: no
    type: string
    sql:${program}||'_'||${creative_campaign}||'_'||${region}||'_'||${month} ;;
  }

  ## Dimensions Native to This Table ##

  dimension: id {
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

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
    type: string
    sql: ${TABLE}.creative_campaign ;;
  }

  dimension: creative_rating {
    description: "Omnitrak Rating for various Creative Campaigns."
    type: number
    sql: ${TABLE}.creative_rating ;;
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
    description: "Omnitrak Rating for various Programs."
    type: number
    sql: ${TABLE}.program_rating ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [id]
  }
}
