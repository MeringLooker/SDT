view: sdt_fy20_content_stackadapt {
  sql_table_name: public.sdt_fy20_content_stackadapt ;;
  drill_fields: [id]

### Primary Key ###

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: passback_join { ## ad ID + date ALWAYS ##
    type: string
    hidden: yes
    sql: ${ad_id}||'_'||${date_date} ;;
  }

######## Dimensions from DCM that join to this table #######

  dimension: placement {
    type: string
    sql: ${sdt_dcm_view.placement} ;;
  }

  dimension: publisher {
    type: string
    sql: ${sdt_dcm_view.publisher} ;;
  }

  dimension: creative_name {
    type: string
    sql: ${sdt_dcm_view.creative} ;;
  }

######## Dimensions native to passback file #######

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

  dimension: ad_id {
    type: string
    sql: ${TABLE}.ad_id ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: media_cost {
    type: number
    sql: ${TABLE}.media_cost ;;
  }

  dimension: video_complete {
    type: number
    sql: ${TABLE}.video_complete ;;
  }

  dimension: video_started {
    type: number
    sql: ${TABLE}.video_started ;;
  }

  dimension: view_to_25 {
    type: number
    sql: ${TABLE}.view_to_25 ;;
  }

  dimension: view_to_50 {
    type: number
    sql: ${TABLE}.view_to_50 ;;
  }

  dimension: view_to_75 {
    type: number
    sql: ${TABLE}.view_to_75 ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
