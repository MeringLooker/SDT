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
        total_clicks,
        total_views,
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
        total_clicks,
        total_views,
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
        total_clicks,
        total_views,
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
        total_clicks,
        total_views,
        total_cost
        from ${omni_yt.SQL_TABLE_NAME}
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
        total_clicks,
        total_views,
        total_cost
        from ${omni_dcm_content.SQL_TABLE_NAME}
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
        total_clicks,
        total_views,
        total_cost
        from ${omni_pullthrough_exp.SQL_TABLE_NAME}
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
        total_clicks,
        total_views,
        total_cost
        from ${omni_dcm_pullthrough.SQL_TABLE_NAME}
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
        total_clicks,
        total_views,
        total_cost
        from ${omni_dcm_drivemarket.SQL_TABLE_NAME}
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
        total_clicks,
        total_views,
        total_cost
        from ${omni_dcm_1p_drivemarket.SQL_TABLE_NAME}
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
        total_clicks,
        total_views,
        total_cost
        from ${omni_hulu_drivemarket.SQL_TABLE_NAME}
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

  dimension: omnitrak_key {
    type: string
    hidden: yes
    sql: ${campaign}||'_'||${publisher}||'_'||${region}||'_'||${creative_name}||'_'||${date} ;;
  }

### All dimensions go below ###

  dimension: campaign {
    type: string
    group_label: "Advertising Campaigns"
    sql: ${TABLE}.campaign ;;
  }

  dimension: publisher {
    type: string
    group_label: "Omnitrak Research"
    sql: ${TABLE}.publisher ;;
  }

  dimension: region {
    type: string
    group_label: "Omnitrak Research"
    sql: ${TABLE}.region ;;
  }

  dimension: creative_name {
    type: string
    group_label: "Advertising Campaigns"
    sql: ${TABLE}.creative_name ;;
  }

  dimension: ad_id {
    type: string
    hidden: yes
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    group_label: "Advertising Campaigns"
    hidden: no
    sql: ${TABLE}.ad_name ;;
  }

  dimension: date {
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: month {
    type: date_month
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

  dimension: clicks {
    type: string
    hidden: yes
    sql: ${TABLE}.total_clicks ;;
  }

  dimension: views {
    type: string
    hidden: yes
    sql: ${TABLE}.total_views ;;
  }

  ## Omnitrak Dimensions ##

  dimension: creative_campaign {
    type: string
    label: "Creative Campaign"
    group_label: "Omnitrak Research"
    sql:
        case
          when ${campaign} = 'US Pull-Through' then 'Happiness Is Calling You Back'
          when ${creative_name} ilike '%Kids Free%' then 'Kids Free'
          when ${creative_name} ilike '%KidsFree%' then 'Kids Free'
          when ${creative_name} ilike '%Kids--Free%' then 'Kids Free'
          when ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling You Back'
          when ${ad_name} ilike '%HICYB%' then 'Happiness Is Calling You Back'
          when ${creative_name} ilike 'OBI:%' then 'One Bright Idea'
          when ${creative_name} ilike 'BB:%' then 'Bliss Break'
          when ${creative_name} ilike 'DH:%' then 'Dishing Happiness'
          when ${creative_name} ilike 'S7:%' then 'Sunny 7'
          when ${creative_name} ilike 'G2GS:%' then 'Guides To The Good Stuff'
          else 'Uncategorized'
          end
        ;;
  }

  ## Measures ##

  measure: total_impressions {
    label: "Impressions"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    label: "Clicks"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${clicks} ;;
  }

  measure: total_views {
    label: "Views"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${views} ;;
  }

  measure: total_cost {
    type: sum_distinct
    label: "Net Media Spend"
    sql_distinct_key: ${primary_key} ;;
    value_format_name: usd
    sql: ${cost} ;;
  }


}
