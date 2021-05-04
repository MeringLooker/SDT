view: sdt_omnitrak_ads {
  derived_table: {
    sql:
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        placement,
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
        placement,
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
        placement,
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
        placement,
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
        placement,
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
        placement,
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
        placement,
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
        placement,
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
        placement,
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
        placement,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_clicks,
        total_views,
        total_cost
        from ${omni_hulu_drivemarket.SQL_TABLE_NAME}
        union
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        placement,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_clicks,
        total_views,
        total_cost
        from ${omni_adara_pullthrough.SQL_TABLE_NAME}
        union
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        placement,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_clicks,
        total_views,
        total_cost
        from ${omni_helm.SQL_TABLE_NAME}
        union
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        placement,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_clicks,
        total_views,
        total_cost
        from ${omni_fy21_adara_pt_2h.SQL_TABLE_NAME}
        union
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        placement,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_clicks,
        total_views,
        total_cost
        from ${omni_fy21_adara_pt_2h_offline.SQL_TABLE_NAME}
        union
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        placement,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_clicks,
        total_views,
        total_cost
        from ${omni_pullthrough_priceline.SQL_TABLE_NAME}
        union
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        placement,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_clicks,
        total_views,
        total_cost
        from ${omni_pullthrough_ta.SQL_TABLE_NAME}
        union
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        placement,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_clicks,
        total_views,
        total_cost
        from ${omni_dcm_pullthrough_2h.SQL_TABLE_NAME}
        union
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        placement,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_clicks,
        total_views,
        total_cost
        from ${omni_dcm_springaware.SQL_TABLE_NAME}
        union
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        placement,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_clicks,
        total_views,
        total_cost
        from ${omni_dcm_springaware_pub.SQL_TABLE_NAME}
        union
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        placement,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_clicks,
        total_views,
        total_cost
        from ${omni_springaware_ta_horizon.SQL_TABLE_NAME}
        union
        select
        cast("ad_id" as varchar),
        ad_name,
        date,
        campaign,
        placement,
        publisher,
        region,
        creative_name,
        total_impressions,
        total_clicks,
        total_views,
        total_cost
        from ${omni_snap.SQL_TABLE_NAME}
        ;;
    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*1)/(60*60*24)) ;;
    distribution_style: all
  }

#### Primary Key Added ####

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${ad_name}||'_'||${ad_id}||'_'||${campaign}||'_'||${publisher}||'_'||${placement}||'_'||${region}||'_'||${creative_name}||'_'||${date} ;;
  }

  dimension: omnitrak_program_key {
    type: string
    hidden: yes
    sql: ${program}||'_'||${region}||'_'||${month} ;;
  }

  dimension: omnitrak_creative_key {
    type: string
    hidden: yes
    sql: ${creative_campaign}||'_'||${region}||'_'||${month} ;;
  }

  ## Omnitrak Dimensions ##

  dimension: program {
    type: string
    label: "Omnitrak Program"
    group_label: "Omnitrak Research"
    sql:
        case
          when ${creative_name} ilike '%Kids Free%' then 'Kids Free'
          when ${creative_name} ilike '%KidsFree%' then 'Kids Free'
          when ${creative_name} ilike '%Kids-Free%' then 'Kids Free'
          when ${creative_name} ilike '%WeekYay%' then 'Week Yay'
          when ${publisher} = 'Trip Advisor' then 'Trip Advisor'
          when ${campaign} = 'Always On Content' then 'Content Net'
          when ${creative_name} ilike '%BookHotel%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%PlanNow%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%Book Hotel%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%Plan Now%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling'

          when ${creative_name} ilike '%Surfer Coast Pin%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%Surfers Single Image%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%Surfer Girl Single Image%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%Roller Girls Single Image%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%Surfer Coast Single Image%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%Family Pin%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%Drive Market IG Story%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%Pandora_750x1400%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%Pandora :30 Audio%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%High Impact Halo%' then 'Happiness Is Calling'
          when ${creative_name} ilike '%Desktop_Portrait%' then 'Happiness Is Calling'

          when ${ad_name} ilike '%HICYB%' then 'Happiness Is Calling'
          when ${campaign} = 'US Pull-Through' then 'Happiness Is Calling'
          when ${creative_name} ilike '%WeekYay%' then 'Week Yay'
          when ${publisher} = 'Travelzoo' then 'Happiness Is Calling'
          when ${creative_name} ilike 'Sunset_%' then 'Happiness Is Calling'
          when ${creative_name} ilike 'Family_%' then 'Happiness Is Calling'
          when ${creative_name} ilike 'SELF Native Article Driver' then 'Happiness Is Calling'
          when ${creative_name} ilike 'HICYB Snap Story' then 'Happiness Is Calling'
          when ${creative_name} ilike 'HICYB:%' then 'Happiness Is Calling'
          when ${creative_name} ilike 'HICYB_%' then 'Happiness Is Calling'

          else null
          end
        ;;
  }

  dimension: creative_campaign {
    type: string
    label: "Omnitrak Creative"
    group_label: "Omnitrak Research"
    sql:
        case
          when ${publisher} = 'Trip Advisor' then 'Trip Advisor'
          when ${publisher} = 'Travelzoo' then 'Happiness Is Calling Advertorial'
          when ${creative_name} ilike 'OBI:%' then 'One Bright Idea'
          when ${creative_name} ilike 'BB:%' then 'Bliss Break'
          when ${creative_name} ilike 'DH:%' then 'Dishing Happiness'
          when ${creative_name} ilike 'S7:%' then 'Sunny 7'
          when ${creative_name} ilike 'G2GS:%' then 'Guides To Good Stuff'
          when ${creative_name} ilike 'Socks:%' then 'Stories From The Sock Drawer'
          when ${creative_name} ilike 'WC:%' then 'Website Content'
          when ${creative_name} ilike 'Nano Traffic%' then 'Website Content'

          when ${program} = 'Happiness Is Calling' and ${publisher} = 'Meredith' then 'Happiness Is Calling Digital'
          when ${program} = 'Happiness Is Calling' and ${publisher} = 'Condé Nast' then 'Happiness Is Calling Digital'
          when ${program} = 'Kids Free' and ${publisher} = 'Meredith' then 'Kids Free Digital'
          when ${program} = 'Kids Free' and ${publisher} = 'Condé Nast' then 'Kids Free Digital'
          when ${publisher} = 'Facebook' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Digital'
          when ${publisher} = 'Facebook' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Digital'

          when ${publisher} = 'Pinterest' and ${program} = 'Happiness Is Calling' then 'Happiness Is Calling Digital'
          when ${publisher} = 'Pinterest' and ${program} = 'Kids Free' then 'Kids Free Digital'
          when ${publisher} = 'Pinterest' and ${program} = 'Week Yay' then 'WeekYay Digital'
          when ${publisher} = 'Facebook' and ${program} = 'Happiness Is Calling' then 'Happiness Is Calling Digital'
          when ${publisher} = 'Facebook' and ${program} = 'Kids Free' then 'Kids Free Digital'
          when ${publisher} = 'Facebook' and ${program} = 'Week Yay' then 'WeekYay Digital'

          when ${publisher} = 'CBS' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Video'
          when ${publisher} = 'ABC' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Video'
          when ${publisher} = 'Spot X' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Video'
          when ${publisher} = 'NBC' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Video'
          when ${publisher} = 'Hulu' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Video'
          when ${publisher} = 'The Helm' and ${creative_name} ilike 'Happiness is Calling You Back (:30)' then 'Happiness Is Calling Video'
          when ${publisher} = 'Pandora' and ${creative_name} ilike 'Happiness is Calling You Back (:30)' then 'Happiness Is Calling Video'
          when ${publisher} = 'VDX.tv' and ${creative_name} ilike 'Happiness is Calling You Back (:30)' then 'Happiness Is Calling Video'
          when ${publisher} = 'CBS' and ${creative_name} ilike 'Kids Free%' then 'Kids Free Video'
          when ${publisher} = 'ABC' and ${creative_name} ilike 'Kids Free%' then 'Kids Free Video'
          when ${publisher} = 'Spot X' and ${creative_name} ilike 'Kids Free%' then 'Kids Free Video'
          when ${publisher} = 'NBC' and ${creative_name} ilike 'Kids Free%' then 'Kids Free Video'
          when ${publisher} = 'Hulu' and ${creative_name} ilike 'Kids Free%' then 'Kids Free Video'
          when ${placement} = 'Spotify :30 Audio' and ${program} = 'Happiness Is Calling' then 'Happiness Is Calling Radio'
          when ${placement} = 'Spotify :30 Audio' and ${program} = 'Kids Free' then 'Kids Free Radio'
          when ${placement} = 'Spotify :30 Audio' and ${program} = 'Week Yay' then 'WeekYay Radio'
          when ${placement} = 'Pandora :30 Audio' and ${program} = 'Happiness Is Calling' then 'Happiness Is Calling Radio'
          when ${placement} = 'Pandora :30 Audio + Display' and ${creative_name} = 'Pandora HICYB Audio (:30)' then 'Happiness Is Calling Radio'
          when ${placement} = 'Pandora :30 Audio + Display' and ${creative_name} = 'Pandora WeekYay Audio (:30)' then 'WeekYay Radio'
          when ${placement} = 'Pandora :30 Audio' and ${program} = 'Kids Free' then 'Kids Free Radio'
          when ${placement} = 'Pandora :30 Audio' and ${program} = 'Week Yay' then 'WeekYay Radio'
          when ${placement} = 'Spotify Video Sponsored Session' and ${program} = 'Happiness Is Calling' then 'Happiness Is Calling Video'
          when ${placement} = 'Spotify Video Sponsored Session' and ${program} = 'Kids Free' then 'Kids Free Video'
          when ${placement} = 'Pandora AV Display' and ${program} = 'Happiness Is Calling' then 'Happiness Is Calling Digital'
          when ${placement} = 'Pandora AV Display' and ${program} = 'Kids Free' then 'Kids Free Digital'
          when ${placement} = 'Pandora Audio Companion Banner' and ${program} = 'Happiness Is Calling' then 'Happiness Is Calling Digital'
          when ${placement} = 'Pandora Audio Companion Banner' and ${program} = 'Kids Free' then 'Kids Free Digital'
          when ${placement} ilike 'Pandora Mobile Interstitial Display' then 'Happiness Is Calling Digital'
          when ${placement} ilike 'Pandora AV Display' and ${program} = 'Week Yay' then 'WeekYay Digital'
          when ${placement} ilike 'Pandora Audio Companion Banner' and ${program} = 'Week Yay' then 'WeekYay Digital'
          when ${program} = 'Pandora Audio Companion Banner' and ${program} = 'Week Yay' then 'WeekYay Digital'
          when ${campaign} = 'US Pull-Through' and ${program} = 'Happiness Is Calling' then 'Happiness Is Calling Digital'
          when ${campaign} = 'US Pull-Through' and ${program} = 'Week Yay' then 'WeekYay Digital'
          when ${creative_name} ilike 'PlanNow%' then 'Happiness Is Calling Digital'
          when ${creative_name} ilike 'WeekYay_Hotel%' then 'WeekYay Digital'
          when ${creative_name} ilike 'WeekYay_Family%' then 'WeekYay Digital'
          when ${creative_name} ilike 'BookHotel%' then 'Happiness Is Calling Digital'
          when ${creative_name} ilike 'HICYB: Animated Slideshow' then 'Happiness Is Calling Digital'
          when ${creative_name} ilike 'HICYB Mobile Interstitial' then 'Happiness Is Calling Digital'
          when ${creative_name} ilike 'Happiness is Calling You Back (:15)' then 'Happiness Is Calling Video'
          when ${creative_name} ilike 'HICYB_%' then 'Happiness Is Calling Digital'
          when ${creative_name} ilike 'Sunset_%' then 'Happiness Is Calling Digital'
          when ${creative_name} ilike 'Family_%' then 'Happiness Is Calling Digital'
          when ${creative_name} ilike 'HICYB Snap Story' then 'Happiness Is Calling Digital'
          when ${creative_name} ilike 'HICYB:' then 'Happiness Is Calling Digital'
          when ${creative_name} ilike 'SELF Native Article Driver' then 'Happiness Is Calling Advertorial'
          else null
          end
        ;;
  }

  dimension: omnitrak_region {
    type: string
    label: "Omnitrak Region"
    group_label: "Omnitrak Research"
    sql:
        case
          when ${region} = 'Phoenix/Tucson' then 'Phoenix'
          when ${region} = 'Tucson' then 'Phoenix'

          else ${region}
          end
        ;;
  }

  dimension: omnitrak_publisher {
    label: "Omnitrak Publisher"
    hidden: yes
    type: string
    group_label: "Omnitrak Research"
    sql: ${TABLE}.publisher ;;
  }

### All dimensions go below ###

  dimension: campaign {
    label: "Ad Campaign"
    type: string
    group_label: "Advertising Campaigns"
    sql: ${TABLE}.campaign ;;
  }

  dimension: publisher {
    label: "Ad Publisher"
    type: string
    group_label: "Advertising Campaigns"
    sql: ${TABLE}.publisher ;;
  }

  dimension: placement {
    label: "Ad Placement"
    type: string
    group_label: "Advertising Campaigns"
    sql: ${TABLE}.placement ;;
  }

  dimension: region {
    label: "Ad Region"
    type: string
    group_label: "Advertising Campaigns"
    sql: ${TABLE}.region ;;
  }

  dimension: creative_name {
    label: "Ad Creative"
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
    hidden: yes
    sql: ${TABLE}.ad_name ;;
  }

  dimension: date {
    hidden: yes
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
