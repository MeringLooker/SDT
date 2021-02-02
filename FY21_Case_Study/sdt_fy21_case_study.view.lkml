view: sdt_fy21_case_study {
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
        total_completes,
        total_cost,
        total_sessions,
        total_session_duration
        from ${case_study_sem.SQL_TABLE_NAME}
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
        total_completes,
        total_cost,
        total_sessions,
        total_session_duration
        from ${case_study_adara_pt.SQL_TABLE_NAME}
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
        total_completes,
        total_cost,
        total_sessions,
        total_session_duration
        from ${case_study_dcm_dm_1p.SQL_TABLE_NAME}
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
        total_completes,
        total_cost,
        total_sessions,
        total_session_duration
        from ${case_study_dcm_dm_3p.SQL_TABLE_NAME}
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
        total_completes,
        total_cost,
        total_sessions,
        total_session_duration
        from ${case_study_dcm_pt.SQL_TABLE_NAME}
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
        total_completes,
        total_cost,
        total_sessions,
        total_session_duration
        from ${case_study_exp_pt.SQL_TABLE_NAME}
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
        total_completes,
        total_cost,
        total_sessions,
        total_session_duration
        from ${case_study_hulu_dm.SQL_TABLE_NAME}
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
        total_completes,
        total_cost,
        total_sessions,
        total_session_duration
        from ${case_study_locals_dcm.SQL_TABLE_NAME}
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
        total_completes,
        total_cost,
        total_sessions,
        total_session_duration
        from ${case_study_fb.SQL_TABLE_NAME}
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
        total_completes,
        total_cost,
        total_sessions,
        total_session_duration
        from ${case_study_gdn.SQL_TABLE_NAME}
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
        total_completes,
        total_cost,
        total_sessions,
        total_session_duration
        from ${case_study_pin.SQL_TABLE_NAME}
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
        total_completes,
        total_cost,
        total_sessions,
        total_session_duration
        from ${case_study_yt.SQL_TABLE_NAME}
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

  # dimension: omnitrak_program_key {
  #   type: string
  #   hidden: yes
  #   sql: ${program}||'_'||${region}||'_'||${month} ;;
  # }

  # dimension: omnitrak_creative_key {
  #   type: string
  #   hidden: yes
  #   sql: ${creative_campaign}||'_'||${region}||'_'||${month} ;;
  # }

  ## Case Study Dimensions ##
  # campaign, creative, creative+tactic#

  dimension: creative {
    type: string
    label: "Creative Group"
    group_label: "Advertising"
    drill_fields: [publisher,campaign,placement]
    sql:
        case
          when ${placement} = 'Base WeekYay' then 'Week Yay'
          when ${placement} = 'Base Kids Free CA, AZ' then 'Kids Free'
          when ${placement} = 'Base Kids Free CA, AZ' then 'Locals'
          when ${campaign} = 'Locals Recovery' then 'Locals'
          when ${publisher} = 'Google Search' then 'Happiness Is Calling'
          when ${creative_name} ilike '%Kids Free%' then 'Kids Free'
          when ${creative_name} ilike '%KidsFree%' then 'Kids Free'
          when ${creative_name} ilike '%Kids-Free%' then 'Kids Free'
          when ${creative_name} ilike '%WeekYay%' then 'Week Yay'
          when ${publisher} = 'Trip Advisor' then 'Happiness Is Calling'
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

          else null
          end
        ;;
  }

  dimension: creative_tactic {
    type: string
    label: "Creative + Tactic"
    group_label: "Advertising"
    drill_fields: [publisher,campaign,placement]
    sql:
        case
          when ${campaign} = 'Locals Recovery' then 'Locals Digital'
          when ${publisher} = 'Trip Advisor' then 'Happiness Is Calling Digital'
          when ${placement} = 'Base WeekYay' then 'WeekYay Digital'
          when ${placement} = 'Base Kids Free CA, AZ' then 'Kids Free Digital'
          when ${publisher} = 'Google Search' then 'Happiness Is Calling Digital'
          when ${creative_name} ilike 'OBI:%' then 'One Bright Idea'
          when ${creative_name} ilike 'BB:%' then 'Bliss Break'
          when ${creative_name} ilike 'DH:%' then 'Dishing Happiness'
          when ${creative_name} ilike 'S7:%' then 'Sunny 7'
          when ${creative_name} ilike 'G2GS:%' then 'Guides To Good Stuff'
          when ${creative_name} ilike 'Socks:%' then 'Stories From The Sock Drawer'
          when ${creative_name} ilike 'WC:%' then 'Website Content'
          when ${creative_name} ilike 'Nano Traffic%' then 'Website Content'

          when ${creative} = 'Happiness Is Calling' and ${publisher} = 'Meredith' then 'Happiness Is Calling Digital'
          when ${creative} = 'Happiness Is Calling' and ${publisher} = 'Condé Nast' then 'Happiness Is Calling Digital'
          when ${creative} = 'Kids Free' and ${publisher} = 'Meredith' then 'Kids Free Digital'
          when ${creative} = 'Kids Free' and ${publisher} = 'Condé Nast' then 'Kids Free Digital'
          when ${publisher} = 'Facebook' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Digital'
          when ${publisher} = 'Facebook' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Digital'

          when ${publisher} = 'Pinterest' and ${creative} = 'Happiness Is Calling' then 'Happiness Is Calling Digital'
          when ${publisher} = 'Pinterest' and ${creative} = 'Kids Free' then 'Kids Free Digital'
          when ${publisher} = 'Pinterest' and ${creative} = 'Week Yay' then 'WeekYay Digital'
          when ${publisher} = 'Facebook' and ${creative} = 'Happiness Is Calling' then 'Happiness Is Calling Digital'
          when ${publisher} = 'Facebook' and ${creative} = 'Kids Free' then 'Kids Free Digital'
          when ${publisher} = 'Facebook' and ${creative} = 'Week Yay' then 'WeekYay Digital'

          when ${publisher} = 'CBS' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Video'
          when ${publisher} = 'ABC' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Video'
          when ${publisher} = 'Spot X' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Video'
          when ${publisher} = 'NBC' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Video'
          when ${publisher} = 'Hulu' and ${creative_name} ilike '%Happiness Is Calling%' then 'Happiness Is Calling Video'
          when ${publisher} = 'CBS' and ${creative_name} ilike 'Kids Free%' then 'Kids Free Video'
          when ${publisher} = 'ABC' and ${creative_name} ilike 'Kids Free%' then 'Kids Free Video'
          when ${publisher} = 'Spot X' and ${creative_name} ilike 'Kids Free%' then 'Kids Free Video'
          when ${publisher} = 'NBC' and ${creative_name} ilike 'Kids Free%' then 'Kids Free Video'
          when ${publisher} = 'Hulu' and ${creative_name} ilike 'Kids Free%' then 'Kids Free Video'
          when ${placement} = 'Spotify :30 Audio' and ${creative} = 'Happiness Is Calling' then 'Happiness Is Calling Radio'
          when ${placement} = 'Spotify :30 Audio' and ${creative} = 'Kids Free' then 'Kids Free Radio'
          when ${placement} = 'Spotify :30 Audio' and ${creative} = 'Week Yay' then 'WeekYay Radio'
          when ${placement} = 'Pandora :30 Audio' and ${creative} = 'Happiness Is Calling' then 'Happiness Is Calling Radio'
          when ${placement} = 'Pandora :30 Audio' and ${creative} = 'Kids Free' then 'Kids Free Radio'
          when ${placement} = 'Pandora :30 Audio' and ${creative} = 'Week Yay' then 'WeekYay Radio'
          when ${placement} = 'Spotify Video Sponsored Session' and ${creative} = 'Happiness Is Calling' then 'Happiness Is Calling Video'
          when ${placement} = 'Spotify Video Sponsored Session' and ${creative} = 'Kids Free' then 'Kids Free Video'
          when ${placement} = 'Pandora AV Display' and ${creative} = 'Happiness Is Calling' then 'Happiness Is Calling Digital'
          when ${placement} = 'Pandora AV Display' and ${creative} = 'Kids Free' then 'Kids Free Digital'
          when ${placement} = 'Pandora Audio Companion Banner' and ${creative} = 'Happiness Is Calling' then 'Happiness Is Calling Digital'
          when ${placement} = 'Pandora Audio Companion Banner' and ${creative} = 'Kids Free' then 'Kids Free Digital'
          when ${placement} ilike 'Pandora Mobile Interstitial Display' then 'Happiness Is Calling Digital'
          when ${placement} ilike 'Pandora AV Display' and ${creative} = 'Week Yay' then 'WeekYay Digital'
          when ${placement} ilike 'Pandora Audio Companion Banner' and ${creative} = 'Week Yay' then 'WeekYay Digital'
          when ${creative} = 'Pandora Audio Companion Banner' and ${creative} = 'Week Yay' then 'WeekYay Digital'
          when ${campaign} = 'US Pull-Through' and ${creative} = 'Happiness Is Calling' then 'Happiness Is Calling Digital'
          when ${campaign} = 'US Pull-Through' and ${creative} = 'Week Yay' then 'WeekYay Digital'
          else null
          end
        ;;
  }

  dimension: omnitrak_region {
    type: string
    label: "Region"
    group_label: "Advertising"
    sql:
        case
          when ${region} = 'Phoenix/Tucson' then 'Phoenix'
          when ${region} = 'Tucson' then 'Phoenix'

          else ${region}
          end
        ;;
  }

### All dimensions go below ###

  dimension: campaign {
    label: "Ad Campaign"
    drill_fields: [publisher,creative,creative_tactic,placement]
    hidden: no
    type: string
    group_label: "Advertising"
    sql: ${TABLE}.campaign ;;
  }

  dimension: publisher {
    drill_fields: [creative,creative_tactic,placement]
    label: "Ad Publisher"
    type: string
    group_label: "Advertising"
    sql: ${TABLE}.publisher ;;
  }

  dimension: placement {
    label: "Ad Placement"
    drill_fields: [creative,creative_tactic,creative_name]
    type: string
    group_label: "Advertising"
    sql: ${TABLE}.placement ;;
  }

  dimension: region {
    label: "Ad Region"
    hidden: yes
    type: string
    group_label: "Advertising Campaigns"
    sql: ${TABLE}.region ;;
  }

  dimension: creative_name {
    label: "Ad Creative"
    type: string
    group_label: "Advertising"
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
    hidden: no
    type: date
    sql: ${TABLE}.date ;;
  }

  dimension: week {
    type: date_week
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

  dimension: completes {
    type: string
    hidden: yes
    sql: ${TABLE}.total_completes ;;
  }

  dimension: sessions {
    type: string
    hidden: yes
    sql: ${TABLE}.total_sessions ;;
  }

  dimension: session_duration {
    type: string
    hidden: yes
    sql: ${TABLE}.total_session_duration ;;
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

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views {
    label: "Views"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    label: "Completes"
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${completes} ;;
  }

  measure: total_cost {
    type: sum_distinct
    label: "Net Media Spend"
    sql_distinct_key: ${primary_key} ;;
    value_format_name: usd
    sql: ${cost} ;;
  }

    measure: video_impressions {
    type: sum
    hidden: yes
    sql_distinct_key: ${primary_key} ;;
    sql:
      case
        when ${views} > 0 then ${impressions}
        else null
        end
        ;;
  }

  measure: view_rate {
    type: number
    label: "View Rate"
    sql: 1.0*${total_views}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: completion_rate {
    type: number
    label: "Completion Rate"
    sql: 1.0*${total_completes}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_sessions {
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${primary_key} ;;
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    type: number
    label: "CPS"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_sessions}, 0) ;;
  }

  measure: total_session_duration {
    type: sum_distinct
    label: "Total Session Duration (s)"
    hidden: no
    sql_distinct_key: ${primary_key} ;;
    sql: ${session_duration} ;;
  }

  measure: avg_session_duration {
    label: "Avg. TOS"
    type: number
    sql: (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400 ;;
    value_format: "m:ss"
  }
}
