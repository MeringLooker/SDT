view: sdt_ga_campaigns_lookup {
  derived_table: {
    sql:
        select
        campaign,
        publisher,
        ad_id
        from ${campaigns_dcm.SQL_TABLE_NAME}
        union
        select
        campaign,
        publisher,
        ad_id
        from ${campaigns_pin.SQL_TABLE_NAME}
        union
        select
        campaign,
        publisher,
        cast("ad_id" as varchar)
        from ${campaigns_gdn.SQL_TABLE_NAME}
        union
        select
        campaign,
        publisher,
        cast("ad_id" as varchar)
        from ${campaigns_fb.SQL_TABLE_NAME}
        union
        select
        campaign,
        publisher,
        cast("ad_id" as varchar)
        from ${campaigns_yt.SQL_TABLE_NAME}
        union
        select
        campaign,
        publisher,
        cast("ad_id" as varchar)
        from ${campaigns_sem.SQL_TABLE_NAME}
        ;;
    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*1)/(60*60*24)) ;;
    distribution_style: all
  }

#### Primary Key Added ####

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${campaign}||'_'||${publisher}||'_'||${ad_id} ;;
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

  dimension: ad_id {
    type: string
    hidden: yes
    sql: ${TABLE}.ad_id ;;
  }

}
