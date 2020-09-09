view: sdt_omnitrak_union {
  derived_table: {
    sql:
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_cost
        from ${omni_fb.SQL_TABLE_NAME}
        union
        select
        ad_id,
        ad_name,
        date,
        campaign,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_cost
        from ${omni_pin.SQL_TABLE_NAME}
        union
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_cost
        from ${omni_gdn.SQL_TABLE_NAME}
        union
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_cost
        from ${omni_yt.SQL_TABLE_NAME}
        ;;
    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*1)/(60*60*24)) ;;
    distribution_style: all
  }

#### Primary Key Added ####

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${ad_name}||'_'||${ad_id}||'_'||${campaign}||'_'||${publisher}||'_'||${region}||'_'||${creative_name}||'_'||${date} ;;
  }

### All dimensions go below ###

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: publisher {
    type: string
    sql: ${TABLE}.publisher ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: creative_name {
    type: string
    sql: ${TABLE}.creative_name ;;
  }

  dimension: ad_id {
    type: string
    hidden: yes
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    hidden: no
    sql: ${TABLE}.ad_name ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: impressions {
    type: string
    hidden: yes
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: cost {
    type: string
    hidden: yes
    sql: ${TABLE}.total_cost ;;
  }

  ## Measures ##

  measure: total_impressions {
    label: "Impressions"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_cost {
    type: sum_distinct
    label: "Net Media Spend"
    sql_distinct_key: ${primary_key} ;;
    value_format_name: usd
    sql: ${cost} ;;
  }


}
