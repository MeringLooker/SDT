view: sdt_ga_ads_lookup {
  sql_table_name: public.sdt_ga_ads_lookup ;;

  dimension: ad_platform_id {
    type: string
    sql: ${TABLE}.ad_platform_id ;;
  }

  dimension: ad_name {
    type: string
    sql: ${TABLE}.ad_name ;;
  }

  dimension: creative_id {
    type: string
    sql: ${TABLE}.creative_id ;;
  }

  dimension: creative_name {
    type: string
    sql: ${TABLE}.creative_name ;;
  }

  dimension: publisher {
    type: string
    sql: ${TABLE}.publisher ;;
  }

  measure: count {
    type: count
    drill_fields: [creative_name, ad_name]
  }
}
