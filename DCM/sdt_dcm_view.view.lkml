view: sdt_dcm_view {
  sql_table_name: public.sdt_dcm_view ;;

######## Primary Key ########

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

######## GA Join ID ########

  dimension: comp_key {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key ;;
  }

  dimension: passback_join { ## placement ID + date ALWAYS
    type: string
    hidden: yes
    sql: ${placement_id}||'_'||${date_date} ;;
  }

  dimension: passback_join_ad { ## Ad ID + date ALWAYS
    type: string
    hidden: yes
    sql: ${ad_id}||'_'||${date_date} ;;
  }

##### Dimensions added to this table via LookML ######

  dimension: fiscal_year {
    type: string
    group_label: "Client Dimensions"
    label: "Fiscal Year"
    sql:
      CASE
        WHEN ${date_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 18/18'
        WHEN ${date_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${date_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: ad_size {
    type: string
    group_label: "DCM Dimensions"
    label: "Ad Size"
    sql:
      CASE
        when ${creative} ILIKE '%728x90%' then '728x90'
        when ${creative} ILIKE '%300x250%' then '300x250'
        when ${creative} ILIKE '%300x600%' then '300x600'
        when ${creative} ILIKE '%160x600%' then '160x600'
        when ${creative} ILIKE '%970x250%' then '970x250'
        when ${placement} ilike '%\\_728x90' then '728x90'
        when ${placement} ilike '%\\_300x600' then '300x600'
        when ${placement} ilike '%\\_300x250' then '300x250'
        when ${placement_id} = '257577555' then 'Native'
        when ${placement} ilike '%\\_320x50' then '320x50'
        when ${placement} ilike '%\\_970x250' then '970x250'
        when ${placement} ilike '%\\_160x600' then '160x600'
        when ${placement} ilike '%\\_468x60' then '468x60'
        when ${placement} ilike '%\\_300x50' then '300x50'
        when ${placement} ilike '%\\_970x90' then '970x90'
        when ${placement} ilike '%\\_1320x742' then '1320x742'
        when ${placement} ilike '%\\_2560x500' then '2560x500'
        when ${placement} ilike '%\\_474x250' then '474x250'

        when ${placement} ilike '%\\_491x872' then '491x872'
        when ${placement} ilike '%\\_990x1320' then '990x1320'

        when ${placement} ilike '%Native Desktop Inline Ad%' then 'Inline Ad'
        when ${placement} ilike '%Native Mobile Inline Ad%' then 'Inline Ad'

        when ${placement} ilike '%Halo Desktop/Tablet%' then 'Halo'
        when ${placement} ilike '%Halo Mobile%' then 'Halo'

        when ${placement} = 'T+L_Meredith_FY20 Prem. Digital_Awareness_NTL excl. SD_AT HALO_Travel Interest_020320-041220_1x1' then 'Halo'
        when ${placement} = 'T+L_Meredith_FY20 Prem. Digital_Awareness_NTL excl. SD_High Impact Display Portrait_Travel Interest_020320-041220_1x1' then 'Portrait'
        when ${placement} = 'T+L_Meredith_FY20 Prem. Digital_Awareness_NTL excl. SD_Cross Screen Scroller_Travel Interest_020320-041220_1x1' then 'Cross Screen Scroller'

        when ${placement_id} = '257565459' then 'N/A'
        when ${placement_id} = '257132603' then 'N/A'
        when ${placement_id} = '257571681' then 'N/A'
        when ${placement_id} = '257132600' then 'N/A'
        when ${placement_id} = '257133410' then 'N/A'
        when ${placement_id} = '257580111' then 'Native'
        when ${placement_id} = '257456647' then 'Native'

        when ${placement_id} = '256904522' then 'N/A'
        when ${placement_id} = '256902170' then 'N/A'
        when ${placement_id} = '257219080' then 'N/A'
        when ${placement_id} = '256833626' then 'N/A'
        when ${placement_id} = '257219077' then 'N/A'
        when ${placement_id} = '257364207' then 'Native'
        when ${placement_id} = '257365923' then 'Native'
        when ${placement_id} = '256913039' then 'Native'

        when ${placement_id} = '254378108' then 'Native'
        when ${placement_id} = '254378081' then 'Native'
        when ${placement_id} = '254378165' then 'Native'
        when ${placement_id} = '254378066' then 'Native'
        when ${placement_id} = '254378135' then 'Native'
        when ${placement_id} = '254378051' then 'Native'
        when ${placement_id} = '254378105' then 'Native'
        when ${placement_id} = '254378156' then 'N/A'
        when ${placement_id} = '254378168' then 'N/A'
        when ${placement_id} = '254378150' then 'N/A'
        when ${placement_id} = '254378162' then 'N/A'

        when ${placement} ilike 'Sunset_FY20 Balboa_Awareness_VS A25-54_NTL_Newsletters%' then 'Newsletter'
        when ${placement} ilike 'Sunset_FY20 Balboa_Awareness_VS A25-54_NTL_High Impact Halo Unit%' then 'Halo Unit'

        when ${ad} ilike '%SDTA Content Hub Promotional Click Out%' then 'N/A'

      ELSE 'Uncategorized'
      END;;
  }

  dimension: publisher {
    type: string
    group_label: "Client Dimensions"
    label: "Publisher"
    sql:
      CASE
        when ${site_dcm} ILIKE 'bellmedia%' then 'Bell Media'
        when ${site_dcm} ILIKE 'CBS%' then 'CBS'
        when ${site_dcm} ILIKE 'Expedia%' then 'Expedia'
        when ${site_dcm} ILIKE 'globaltv%' then 'GlobalTV'
        when ${site_dcm} ILIKE 'Hulu%' then 'Hulu'
        when ${site_dcm} ILIKE 'Nativo%' then 'Nativo'
        when ${site_dcm} ILIKE 'NBC Sports%' then 'NBC Sports'
        when ${site_dcm} ILIKE 'TripAdvisor%' then 'Trip Advisor'

        when ${site_dcm} ILIKE 'Turner Sports%' then 'Turner Sports'

        when ${placement} ILIKE 'T+L_Meredith_FY20 Prem. Digital_Awareness_NTL%' then 'Travel + Leisure'
        when ${site_dcm} ILIKE 'Meredith%' then 'Meredith'

        when ${site_dcm} ILIKE 'Lastminute%' then 'Lastminute'
        when ${site_dcm} ILIKE 'Triplelift%' then 'TripleLift'

        when ${site_dcm} ILIKE 'Adroll%' then 'AdRoll'
        when ${site_dcm} ILIKE 'Adara%' then 'Adara'
        when ${site_dcm} ILIKE 'Kayak%' then 'Kayak'
        when ${site_dcm} ILIKE 'Priceline%' then 'Priceline'

        when ${site_dcm} ILIKE 'travelocity.ca/ca%' then 'Travelocity'

        when ${site_dcm} ILIKE 'TravelandLeisure' then 'Travel + Leisure'
        when ${site_dcm} ILIKE 'Sunset%' then 'Sunset'

        ELSE ${site_dcm}

      END;;
  }

  dimension: sdt_layer {
    type: string
    group_label: "Client Dimensions"
    label: "Campaign Layer"
    sql:
      CASE
        when ${placement} ILIKE 'AdRoll_Retargeting_Web Display Package_Retargeting%' then 'Retargeting'
        when ${placement} ILIKE '%Anaheim/Disneyland%' then 'Disneyland'
        when ${placement} ILIKE '%Conquesting%' then 'Competitive Conquest'
        when ${placement} ILIKE 'Adara\\_Los Angeles\\_%' then 'Los Angeles'
        when ${placement} ILIKE 'Adara\\_PT\\_Display Prospecting%' then 'Pull-Through Base'
        when ${placement} ILIKE 'Adara\\_PT\\_AV Display Prospecting%' then 'Pull-Through Base'
        when ${placement} ILIKE 'AdRoll\\_Retargeting%' then 'Retargeting'
        when ${placement} ILIKE '%Competitive Conquesting%' then 'Competitive Conquest'
        when ${placement} ILIKE '%Disneyland/Anaheim%' then 'Disneyland'
        when ${placement} ILIKE 'Expedia\\_Los Angeles\\_%' then 'Los Angeles'
        when ${placement} ILIKE 'Expedia\\_OTA Base\\_%' then 'OTA Base'
        when ${placement} ILIKE 'Kayak\\_Los Angeles\\_%' then 'Los Angeles'
        when ${placement} ILIKE 'Expedia\\_Los Angeles\\_%' then 'Los Angeles'
        when ${placement} ILIKE 'Expedia\\_Phoenix\\_%' then 'Phoenix'
        when ${placement} ILIKE 'Sojern\\_PT\\_Display Prospecting%' then 'Pull-Through Base'
        when ${placement} ILIKE 'Sojern\\_PT\\_AV Display Prospecting%' then 'Pull-Through Base'
        when ${placement} ILIKE 'Priceline\\_OTA Base\\_%' then 'OTA Base'

        when ${placement} ILIKE 'StackAdapt_FY20 AlwaysOnContent_Micro_%' then 'Micro Video'
        when ${placement} ILIKE 'StackAdapt_FY20 AlwaysOnContent_Macro_%' then 'Macro Video'

        when ${placement} ILIKE 'VDX_FY20 UK Digital_Reach/Storytelling_%' then 'Amplify Reach'
        when ${placement} ILIKE 'Lastminute_FY20 UK Digital_Content_VS%' then 'Storytelling'

        when ${placement} ilike 'Bell Media_Awareness/Reach%' then 'Amplify Reach'
        when ${placement} ilike 'Global TV_Awareness/Reach%' then 'Amplify Reach'
        when ${placement} ilike 'StackAdapt_Content_RON%' then 'Storytelling'

        when ${ad} ILIKE 'TripAdvisor Tracker-TripAdvisor_Storytelling%' then 'Storytelling'
        when ${ad} ILIKE 'Trip Advisor Tracker-TripAdvisor_Storytelling%' then 'Storytelling'
        when ${ad} ILIKE 'TripAdvisor_Storytelling_Native Hub%' then 'Storytelling'
        when ${ad} ILIKE 'TripAdvisor Tracker-TripAdvisor_Reach_Homepage Hero%' then 'Amplify Reach'
        when ${ad} ILIKE 'TripAdvisor Tracker-TripAdvisor_Destination Sponsorship%' then 'Impact'

        when ${ad} ILIKE 'TripAdvisor Tracker-TripAdvisor_Storytelling%' then 'Storytelling'
        when ${ad} ILIKE 'Trip Advisor Tracker-TripAdvisor_Storytelling%' then 'Storytelling'
        when ${ad} ILIKE 'TripAdvisor_Storytelling_Native Hub%' then 'Storytelling'
        when ${ad} ILIKE 'TripAdvisor Tracker-TripAdvisor_Reach_Homepage Hero%' then 'Amplify Reach'
        when ${ad} ILIKE 'TripAdvisor Tracker-TripAdvisor_Destination Sponsorship%' then 'Impact'

        when ${placement} ilike 'TripAdvisor_Native Outstream Video Banner - Storytelling_Outdoor%' then 'Storytelling'
        when ${placement} ilike 'TripAdvisor_Native Outstream Dynamic Video Banner - Storytelling%' then 'Storytelling'
        when ${placement} ilike 'TripAdvisor_Native Hub Traffic Driver - Storytelling%' then 'Storytelling'
        when ${placement} ilike 'TripAdvisor_Audience Extension - Video - Storytelling%' then 'Storytelling'
        when ${placement} ilike 'TripAdvisor_Homepage Hero - Display - Reach%' then 'Amplify Reach'
        when ${placement} ilike 'TripAdvisor_Dynamic Video Banner - Storytelling%' then 'Storytelling'
        when ${placement} ilike 'TripAdvisor_DF Retargeting - Impact%' then 'Impact'
        when ${placement} ilike 'TripAdvisor_Destination Sponsorship - Impact%' then 'Impact'

        when ${placement_id} = '255163867' then 'Nano Traffic'
        when ${placement_id} = '255163873' then 'Nano Traffic'
        when ${placement_id} = '255163879' then 'Nano Traffic'

        when ${placement_id} = '255163489' then 'Micro Traffic'
        when ${placement_id} = '255163492' then 'Micro Traffic'
        when ${placement_id} = '255163495' then 'Micro Traffic'

        when ${placement_id} = '255163510' then 'Macro Video'
        when ${placement_id} = '255163522' then 'Macro Video'
        when ${placement_id} = '255163534' then 'Macro Video'
        when ${placement_id} = '255163516' then 'Macro Video'
        when ${placement_id} = '255163528' then 'Macro Video'
        when ${placement_id} = '255163540' then 'Macro Video'

        when ${placement_id} = '255163513' then 'Macro Traffic'
        when ${placement_id} = '255163525' then 'Macro Traffic'
        when ${placement_id} = '255163537' then 'Macro Traffic'
        when ${placement_id} = '255163519' then 'Macro Traffic'
        when ${placement_id} = '255163531' then 'Macro Traffic'
        when ${placement_id} = '255163543' then 'Macro Traffic'

        when ${placement_id} = '255163882' then 'Macro Traffic'
        when ${placement_id} = '255163483' then 'Nano Traffic'
        when ${placement_id} = '255163888' then 'Macro Video'

        when ${placement} ilike 'Taboola_FY20 Family Content_Macro%' then 'Macro Video'
        when ${placement} ilike 'Taboola_FY20 Family Content_Micro%' then 'Micro Traffic'
        when ${placement} ilike 'Taboola_FY20 Family Content_Nano%' then 'Nano Traffic'

        ELSE 'Uncategorized'
        end ;;
  }

  dimension: sdt_campaign {
    type: string
    group_label: "Client Dimensions"
    label: "Campaign Name"
    sql:
      CASE
        when ${campaign} ILIKE '%Balboa Park%' then 'Balboa Park Digital'
        when ${campaign} ILIKE '%Family Content%' then 'Family Content'
        when ${campaign} ILIKE '%SD For The Holidays%' then 'SD For The Holidays'

        when ${campaign} = 'SDT: FY19 TripAdvisor Program- CAN' then 'CAN TripAdvisor Program'
        when ${campaign} = 'SDT: 004676_01 FY20 TripAdvisor CAN Campaign' then 'CAN TripAdvisor Program'
        when ${campaign} = 'SDT: 004676_01 FY20 TripAdvisor US Campaign' then 'US TripAdvisor Program'
        when ${campaign} = 'SDT FY19 TripAdvisor Program- US' then 'US TripAdvisor Program'
        when ${campaign} = 'SDT: 004676_01 FY20 TripAdvisor UK Campaign' then 'UK TripAdvisor Program'
        when ${campaign} = 'SDT FY19 TripAdvisor Program- UK' then 'UK TripAdvisor Program'

        when ${campaign} ILIKE '%Brand Digital Video%' then 'Brand Digital Video'
        when ${campaign} ILIKE '%Canada Digital%' then 'Canada Digital'
        when ${campaign} ILIKE '%Fall Promo%' then 'Fall Promo'
        when ${campaign} ILIKE '%Canada Campaign%' then 'Canada Digital'
        when ${campaign} ILIKE '%Germany Campaign%' then 'Germany Digital'
        when ${campaign} ILIKE '%UK Digital Campaign%' then 'United Kingdom Digital'
        when ${campaign} ILIKE '%UK Digital' then 'United Kingdom Digital'
        when ${campaign} ILIKE '%Content%' then 'Always On Content'
        when ${campaign} ILIKE '%Content' then 'Always On Content'
        when ${campaign} ILIKE '%Sports%' then 'Sports Digital Video'
        when ${campaign} ILIKE '%Travel & Tourism Week' then 'Travel & Tourism Week'
        when ${campaign} ILIKE '%NatGeo%' then 'Nat Geo Digital'
        when ${campaign} ILIKE '%Mexico Campaign' then 'Mexico Digital'
        when ${campaign} ILIKE '%Mexico Campaign' then 'Mexico Digital'
        when ${campaign} ILIKE '%Kids Free%' then 'Kids Free'
        when ${campaign} ILIKE '%ABC VOD%' then 'ABC VOD'
        when ${campaign} ILIKE '%Digital Video' then 'Brand Digital Video'

        when ${campaign} = 'SDT: 004762_01 FY20 UK Pull-Through Campaign' then 'UK Pull-Through'
        when ${campaign} = 'SDT: 004762_01 FY20 Pull-Through Campaign' then 'US Pull-Through'
        when ${campaign} = 'SDT: 004762_01 FY20 CAN Pull-Through Campaign' then 'CAN Pull-Through'
        when ${campaign} = 'SDT: 004027_01 FY19 Foundational Pull-Through' then 'US Pull-Through'
        when ${campaign} = '003220_01 FY18 Foundational Travel Intender Pull-Through Digital' then 'US Pull-Through'
        when ${campaign} = 'SDT: 004978_01 FY20 Premium Digital Display Campaign' then 'Premium Digital Display'


      ELSE ${campaign}
      END;;
  }

  dimension: sdt_market {
    type: string
    group_label: "Client Dimensions"
    label: "Market"
    sql:
      CASE
        when ${sdt_campaign} = 'United Kingdom Digital' then 'United Kingdom'
        when ${sdt_campaign} = 'Canada Digital' then 'Canada'
        when ${sdt_campaign} = 'Mexico Digital' then 'Mexico'
        when ${sdt_campaign} = 'Germany Digital' then 'Germany'
        when ${campaign_id} = '22103210' then 'United Kingdom'
        when ${campaign_id} = '23302406' then 'Canada'
        when ${campaign_id} = '22169957' then 'Canada'
        when ${campaign_id} = '23350539' then 'Canada'

        when ${campaign} = 'SDT: 004676_01 FY20 TripAdvisor US Campaign' then 'United States'
        when ${campaign} = 'SDT FY19 TripAdvisor Program- US' then 'United States'
        when ${campaign} = 'SDT: 004676_01 FY20 TripAdvisor UK Campaign' then 'United Kingdom'
        when ${campaign} = 'SDT: 004762_01 FY20 UK Pull-Through Campaign' then 'United Kingdom'
        when ${campaign} = 'SDT: 004762_01 FY20 Pull-Through Campaign' then 'United States'

        when ${campaign} = 'SDTA_FY19 SD for the Holidays Campaign' then 'United States'
        when ${campaign} = 'SDTA_FY18 Balboa Park Spring Native Campaign' then 'United States'
        when ${campaign} = 'SDT: FY19 Sports Campaign' then 'United States'
        when ${campaign} = 'SDT: FY19 National Travel & Tourism Week' then 'United States'
        when ${campaign} = 'SDT: FY19 Family Content' then 'United States'
        when ${campaign} = 'SDT: FY19 Balboa Park' then 'United States'
        when ${campaign} = 'SDT: 004978_01 FY20 Premium Digital Display Campaign' then 'United States'
        when ${campaign} = 'SDT: 004576_01 FY20 Brand Digital Video Campaign' then 'United States'
        when ${campaign} = 'SDT: 004573_01 FY20 Fall Promo Campaign' then 'United States'
        when ${campaign} = 'SDT: 004183_01 FY19 NatGeoa Digital Campaign' then 'United States'
        when ${campaign} = 'SDT: 004027_01 FY19 Foundational Pull-Through' then 'United States'
        when ${campaign} = 'SDT: 003858_01 FY19 Brand Digital Video' then 'United States'
        when ${campaign} = 'SDT_FY19 Always On Content - Stage 2' then 'United States'
        when ${campaign} = 'SDT FY19 Kids Free Campaign' then 'United States'
        when ${campaign} = 'SDT : 004655_01 / FY20 Always On Content' then 'United States'
        when ${campaign} = 'FY19 ABC VOD Campaign' then 'United States'
        when ${campaign} = '003451_01 FY18 Content Digital Campaign' then 'United States'
        when ${campaign} = '003392_01_FY18_SDTA_Digital Video' then 'United States'
        when ${campaign} = '003220_01 FY18 Foundational Travel Intender Pull-Through Digital' then 'United States'
        when ${campaign} = '003076_01 FY18 San Diego Kids Free Digital' then 'United States'
        when ${campaign} = 'SDT: 004928_01 FY20 Family Content Campaign' then 'United States'
        when ${campaign} = 'SDT: 004660_01 FY20 Balboa Park Campaign' then 'United States'

          ELSE 'Uncategorized'
      END;;
  }

  dimension: sdt_region {
    type: string
    group_label: "Client Dimensions"
    label: "Region"
    sql:
      case
        when ${placement_id} = '253217116' then 'National'
        when ${placement_id} = '253217146' then 'National'
        when ${placement_id} = '252866297' then 'National'
        when ${placement_id} = '252866285' then 'National'

        when ${placement} ilike '%Geotargeting Seattle DMA%' then 'Seattle'
        when ${placement} ilike '%Geotargeting San Francisco DMA%' then 'San Francisco'
        when ${placement} ilike '%Geotargeting Sacramento DMA%' then 'Sacramento'
        when ${placement} ilike '%Geotargeting Phoenix DMA%' then 'Phoenix'
        when ${placement} ilike '%Geotargeting New York DMA%' then 'New York City'
        when ${placement} ilike '%Geotargeting Dallas DMA%' then 'Dallas'
        when ${placement} ilike '%Geotargeting Chicago DMA%' then 'Chicago'

        when ${placement} ilike 'ABC Seattle LFV%' then 'Seattle'
        when ${placement} ilike 'ABC New York LFV%' then 'New York City'
        when ${placement} ilike 'ABC New York SFV%' then 'New York City'
        when ${placement} ilike 'ABC Chicago LFV%' then 'Chicago'
        when ${placement} ilike 'ABC Chicago SFV%' then 'Chicago'
        when ${placement} ilike 'ABC Phoenix SFV%' then 'Phoenix'
        when ${placement} ilike 'ABC Phoenix LFV%' then 'Phoenix'
        when ${placement} ilike 'ABC Dallas LFV%' then 'Dallas'
        when ${placement} ilike 'ABC Sacramento SFV%' then 'Sacramento'
        when ${placement} ilike 'ABC Sacramento LFV%' then 'Sacramento'
        when ${placement} ilike 'ABC San Francisco SFV%' then 'San Francisco'
        when ${placement} ilike 'ABC San Francisco LFV%' then 'San Francisco'

        when ${placement} ilike 'CBS Chicago Cross Platform%' then 'Chicago'
        when ${placement} ilike 'CBS National Cross Platform%' then 'National'
        when ${placement} ilike 'CBS Dallas Cross Platform%' then 'Dallas'
        when ${placement} ilike 'CBS New York City Cross Platform%' then 'New York City'
        when ${placement} ilike 'CBS Seattle Cross Platform%' then 'Seattle'
        when ${placement} ilike 'CBS San Francisco Cross Platform%' then 'San Francisco'
        when ${placement} ilike 'CBS Sacramento Cross Platform%' then 'Sacramento'
        when ${placement} ilike 'CBS Phoenix Cross Platform%' then 'Phoenix'

        when ${placement} ilike 'NBC Seattle Sports Live Streaming%' then 'Seattle'
        when ${placement} ilike 'NBC Dallas Sports Live Streaming%' then 'Dallas'
        when ${placement} ilike 'NBC Sacramento Sports Live Streaming%' then 'Sacramento'
        when ${placement} ilike 'NBC Phoenix Sports Live Streaming%' then 'Phoenix'
        when ${placement} ilike 'NBC National Sports Live Streaming%' then 'National'
        when ${placement} ilike 'NBC Chicago Sports Live Streaming%' then 'Chicago'
        when ${placement} ilike 'NBC New York Sports Live Streaming%' then 'New York City'
        when ${placement} ilike 'NBC San Francisco Sports Live Streaming%' then 'San Francisco'

        when ${placement_id} ilike '252324176' then 'National'
        when ${placement_id} ilike '252324173' then 'National'
        when ${placement_id} ilike '252328262' then 'National'
        when ${placement_id} ilike '252330722' then 'National'
        when ${placement_id} ilike '252330719' then 'National'
        when ${placement_id} ilike '252701236' then 'National'

        when ${campaign} = 'SDT: 004576_01 FY20 Brand Digital Video Campaign' and ${site_dcm} = 'Amobee' then 'National'

        when ${placement} ilike '%RetargetMacro\\_US\\_%' then 'National'
        when ${placement} ilike '%RetargetMacro\\_PHX\\_%' then 'Phoenix'
        when ${placement} ilike '%RetargetMacro\\_LA\\_%' then 'Los Angeles'

        when ${placement} ilike '%AlwaysOnContent_Macro_Outdoor_VarietySeeker\\_LA\\_%' then 'Los Angeles'
        when ${placement} ilike '%AlwaysOnContent_Macro_Outdoor_VarietySeeker\\_PHX\\_%' then 'Phoenix'
        when ${placement} ilike '%AlwaysOnContent_Macro_Outdoor_VarietySeeker\\_US\\_%' then 'National'

        when ${placement} ilike '%AlwaysOnContent_Macro_NonOutdoor_VarietySeeker\\_LA\\_%' then 'Los Angeles'
        when ${placement} ilike '%AlwaysOnContent_Macro_NonOutdoor_VarietySeeker\\_PHX\\_%' then 'Phoenix'
        when ${placement} ilike '%AlwaysOnContent_Macro_NonOutdoor_VarietySeeker\\_US\\_%' then 'National'

        when ${placement_id} = '255163522' then 'Phoenix'
        when ${placement_id} = '255163525' then 'Phoenix'
        when ${placement_id} = '255163531' then 'Phoenix'
        when ${placement_id} = '255163873' then 'Phoenix'
        when ${placement_id} = '255163528' then 'Phoenix'
        when ${placement_id} = '255163492' then 'Phoenix'

        when ${placement_id} = '255163534' then 'Los Angeles'
        when ${placement_id} = '255163495' then 'Los Angeles'
        when ${placement_id} = '255163879' then 'Los Angeles'
        when ${placement_id} = '255163540' then 'Los Angeles'
        when ${placement_id} = '255163537' then 'Los Angeles'
        when ${placement_id} = '255163543' then 'Los Angeles'

        when ${placement_id} = '255163516' then 'National'
        when ${placement_id} = '255163519' then 'National'
        when ${placement_id} = '255163513' then 'National'
        when ${placement_id} = '255163510' then 'National'
        when ${placement_id} = '255163867' then 'National'
        when ${placement_id} = '255163489' then 'National'

        when ${placement_id} = '255163882' then 'Los Angeles'
        when ${placement_id} = '255163483' then 'Phoenix'
        when ${placement_id} = '255163888' then 'Los Angeles'

          ELSE 'Uncategorized'
      END;;
  }

  dimension: sdt_audience {
    type: string
    group_label: "Client Dimensions"
    label: "Audience"
    sql:
      case
        when ${placement_id} = '252937755' then 'Family'
        when ${placement_id} = '252509375' then 'Brand'
        when ${placement_id} = '253217116' then 'Brand'
        when ${placement_id} = '253217146' then 'Family'
        when ${placement_id} = '252866297' then 'Brand'
        when ${placement_id} = '252866285' then 'Family'

        when ${placement_id} = '252328262' then 'Family'
        when ${placement_id} = '252701236' then 'Brand'
        when ${placement_id} = '253315548' then 'Brand'

        when ${campaign} = 'SDT: 004576_01 FY20 Brand Digital Video Campaign' and ${site_dcm} = 'NBC Sports' then 'Brand'

        when ${placement} ilike '%\\:30 Happy Today - Family' then 'Family'
        when ${placement} ilike '%\\:30 Happy Today - Brand' then 'Brand'

        when ${placement_id} = '252934278' then 'Brand'
        when ${placement_id} = '252937650' then 'Brand'

        when ${placement_id} = '252871376' then 'Brand'
        when ${placement_id} = '253303128' then 'Brand'
        when ${placement_id} = '252324173' then 'Brand'
        when ${placement_id} = '253309155' then 'Brand'
        when ${placement_id} = '253301820' then 'Brand'
        when ${placement_id} = '252875912' then 'Brand'
        when ${placement_id} = '252330719' then 'Brand'
        when ${placement_id} = '253225471' then 'Brand'
        when ${placement_id} = '253220767' then 'Brand'
        when ${placement_id} = '252868753' then 'Brand'
        when ${placement_id} = '252937671' then 'Brand'

        when ${placement_id} = '265518918' then 'Family'
        when ${placement_id} = '265499293' then 'Family'
        when ${placement_id} = '253236655' then 'Family'
        when ${placement_id} = '265503247' then 'Family'

          ELSE 'Uncategorized'
      END;;
  }

  dimension: sdt_placement {
    type: string
    group_label: "Client Dimensions"
    label: "Placement Name"
    sql:
      case

      when ${placement} ilike '%Sports Live Streaming Video Flight%' then 'Live Streaming Video'
      when ${placement} ilike '%Sports Live Streaming Video Added Value Companion%' then 'Companion Banner'

      when ${placement} ilike 'Expedia_OTA Base_ROS Bundle_%' then 'ROS Bundle'
      when ${placement} ilike 'Expedia_OTA Base_ROS 160x600_%' then 'ROS 160x600'
      when ${placement} ilike 'Expedia_OTA Base_Hotels.com Responsive ROS Bundle_%' then 'Hotels.com Responsive ROS Bundle'
      when ${placement} ilike 'Expedia_OTA Base_Hotels.com ROS Bundle%' then 'Hotels.com ROS Bundle'
      when ${placement} ilike 'Expedia_OTA Base_EBP_Previous search%' then 'EBP'
      when ${placement} ilike 'Expedia_OTA Base_EBP_Previous search%' then 'EBP'
      when ${placement} ilike 'Expedia_OTA Base_EBP Native Marquee%' then 'EBP Native Marquee'
      when ${placement} ilike 'Expedia_OTA Base_EBP Match_Previous search%' then 'EBP Match'
      when ${placement} ilike 'Expedia_OTA Base_Travelocity Responsive ROS Bundle_%' then 'Travelocity Responsive ROS Bundle'
      when ${placement} ilike 'Expedia_OTA Base_Travelocity ROS Bundle%' then 'Travelocity ROS Bundle'

      when ${placement} ilike 'AdRoll_Retargeting_Web Display Package_Retargeting PT site visitors_National%' then 'Display Retargeting - PT Base'
      when ${placement} ilike 'AdRoll_Retargeting_Web Display Package_Retargeting Competitive site visitors%' then 'Display Retargeting - Competitive Conquesting'
      when ${placement} ilike 'AdRoll_Retargeting_Web Display Package_Retargeting Los Angeles site visitors%' then 'Display Retargeting - Los Angeles'
      when ${placement} ilike 'AdRoll_Retargeting_Web Display Package_Retargeting Disneyland site visitors%' then 'Display Retargeting - Disneyland'

      when ${placement} ilike 'Sojern_PT_Display Prospecting_Active Travel Intenders%' then 'Display Prospecting'
      when ${placement} ilike 'Sojern_PT_AV Display Prospecting_Active Travel Intenders%' then 'Display Prospecting - AV'

      when ${placement} ilike 'Adara_Anaheim/Disneyland_Display Prospecting Package%' then 'Display Prospecting - Disneyland'
      when ${placement} ilike 'Adara_AV Anaheim/Disneyland_Display Prospecting Package%' then 'Display Prospecting AV - Disneyland'
      when ${placement} ilike 'Adara_Conquesting_Display Prospecting Package%' then 'Display Prospecting - Competitive Conquest'
      when ${placement} ilike 'Adara_AV Conquesting_Display Prospecting Package%' then 'Display Prospecting AV - Competitive Conquest'
      when ${placement} ilike 'Adara_Los Angeles_Display Prospecting Package%' then 'Display Prospecting - Los Angeles'
      when ${placement} ilike 'Adara_Los Angeles_AV Display Prospecting Package%' then 'Display Prospecting AV - Los Angeles'
      when ${placement_id} = '254553726' then 'Display Prospecting AV - Los Angeles'
      when ${placement_id} = '254553723' then 'Display Prospecting AV - Los Angeles'
      when ${placement_id} = '254449423' then 'Display Prospecting AV - Los Angeles'
      when ${placement} ilike 'Adara_PT_Display Prospecting Package%' then 'Display Prospecting - Base'
      when ${placement} ilike 'Adara_PT_AV Display Prospecting Package%' then 'Display Prospecting AV - Base'

      when ${placement} ilike 'Priceline_OTA Base_ROS: Audience Targeting%' then 'ROS: Audience Targeting - Base'
      when ${placement} ilike 'Priceline_OTA Base_Product Home Page: Native%' then 'Product Home Page: Native - Base'

      when ${placement} ilike 'Priceline_Competitive Conquesting_Search Results_Competing destinations%' then 'Search Results - Competitive Destinations'
      when ${placement} ilike 'Priceline_Anaheim/Disneyland_ROS: Audience Targeting_Disneyland Intenders%' then 'ROS: Audience Targeting (Disneyland) - Disneyland'
      when ${placement} ilike 'Priceline_Anaheim/Disneyland_ROS: Audience Targeting_Anaheim Intenders%' then 'ROS: Audience Targeting (Anaheim) - Disneyland'

      when ${placement} ilike 'Kayak_Los Angeles_Results Page Takeover%' then 'Results Page Takeover - Los Angeles'
      when ${placement} ilike 'Kayak_Los Angeles_Native Mobile Inline Ad%' then 'Native Mobile Inline Ad - Los Angeles'
      when ${placement} ilike 'Kayak_Los Angeles_Native Desktop Inline Ad%' then 'Native Desktop Inline Ad - Los Angeles'

      when ${placement} ilike 'Kayak_Competitive Conquesting_Results Page Takeover%' then 'Results Page Takeover - Competitive Conquesting'
      when ${placement} ilike 'Kayak_Competitive Conquesting_Native Mobile Inline Ad%' then 'Native Mobile Inline Ad - Competitive Conquesting'
      when ${placement} ilike 'Kayak_Competitive Conquesting_Native Desktop Inline Ad%' then 'Native Desktop Inline Ad - Competitive Conquesting'

      when ${placement} ilike 'Kayak_Anaheim/Disneyland_Results Page Takeover%' then 'Results Page Takeover - Disneyland'
      when ${placement} ilike 'Kayak_Anaheim/Disneyland_Native Mobile Inline Ad%' then 'Native Mobile Inline Ad - Disneyland'
      when ${placement} ilike 'Kayak_Anaheim/Disneyland_Native Desktop Inline Ad%' then 'Native Desktop Inline Ad - Disneyland'

      when ${placement} ilike 'Expedia_OTA Base_Hotels.com: Native Marquee%' then 'Hotels.com Native Marquee - OTA Base'
      when ${placement} ilike 'Expedia_OTA Base_Hotels.com: Infosite/Results L1%' then 'Hotels.com Infosite/Results L1 - OTA Base'
      when ${placement} ilike 'Expedia_OTA Base_Hotels.com Results R1%' then 'Hotels.com Results R1 - OTA Base'
      when ${placement} ilike 'Expedia_OTA Base_Hotels.com Home Page CT Banner%' then 'Hotels.com HomePage CT Banner - OTA Base'
      when ${placement} ilike 'Expedia_OTA Base_Expedia: Search Center Top%' then 'Expedia Search Center Top - OTA Base'
      when ${placement} ilike 'Expedia_OTA Base_Expedia: Results R1- Flights/Hotels/VacationsPKG%' then 'Expedia: Results R1 Flight/Hotels/PKG - OTA Base'
      when ${placement} ilike 'Expedia_OTA Base_Expedia: Results R1- Flights/Hotels/PKG%' then 'Expedia: Results R1 Flight/Hotels/PKG - OTA Base'
      when ${placement} ilike 'Expedia_OTA Base_EBP Premium%' then 'EBP Premium - OTA Base'
      when ${placement} ilike 'Expedia_OTA Base_EBP Native Marquee%' then 'EBP Native Marquee - OTA Base'

      when ${placement} ilike 'Expedia_Los Angeles_Hotels.com: Native Marquee%' then 'Hotels.com Native Marquee - Los Angeles'
      when ${placement} ilike 'Expedia_Los Angeles_Hotels.com: Results R1%' then 'Hotels.com Results R1 -Los Angeles'
      when ${placement} ilike 'Expedia_Los Angeles_Hotels.com Home Page CT Banner%' then 'Hotels.com HomePage CT Banner - Los Angeles'

      when ${placement} ilike 'Expedia_Los Angeles_Expedia: Results R1- Hotels/Vacations/PKG%' then 'Expedia: Results R1 Flight/Hotels/PKG - Los Angeles'
      when ${placement} ilike 'Expedia_Los Angeles_Expedia: Results R1- Flights/Hotels/PKG%' then 'Expedia: Results R1 Flight/Hotels/PKG - Los Angeles'
      when ${placement} ilike 'Expedia_Los Angeles_EBP Premium%' then 'EBP Premium - Los Angeles'
      when ${placement} ilike 'Expedia_Los Angeles_EBP Native Marquee%' then 'EBP Native Marquee - Los Angeles'

      when ${placement} ilike 'Expedia_Disneyland/Anaheim_Travelocity: Expedia: Results R1%' then 'Travelocity Results R1 - Disneyland'
      when ${placement} ilike 'Expedia_Disneyland/Anaheim_Hotels.com: ROS%' then 'Hotels.com ROS - Disneyland'
      when ${placement} ilike 'Expedia_Disneyland/Anaheim_Hotels.com: Homepage Marquee%' then 'Hotels.com HomePage Marquee - Disneyland'
      when ${placement} ilike 'Expedia_Disneyland/Anaheim_Expedia: Results R1/2 - Flights/Hotels/PKG%' then 'Expedia Results R1/2 - Flights/Hotels/PKG - Disneyland'
      when ${placement} ilike 'Expedia_Disneyland/Anaheim_EBP Native Marquee%' then 'EBP Native Marquee - Disneyland'

      when ${placement} ilike 'Expedia_Competitive Conquesting_Travelocity: Expedia: Results R1%' then 'Travelocity Results R1 - Competitive Conquesting'
      when ${placement} ilike 'Expedia_Competitive Conquesting_Hotels.com: Results R1/2 - Flights/Hotels/PKG%' then 'Hotels.com: Results R1/2 - Flights/Hotels/PKG - Competitive Conquesting'
      when ${placement} ilike 'Expedia_Competitive Conquesting_Expedia: Results R1- Flights/Hotels/PKG%' then 'Expedia Results R1 - Flights/Hotels/PKG - Competitive Conquesting'

      when ${placement} ilike 'Expedia_Phoenix_Expedia: Flights/Hotels/Vacations/PKG Center Top%' then 'Expedia: Flights/Hotels/PKG Center Top - Phoenix'
      when ${placement} ilike 'Expedia_Phoenix_EBP Premium%' then 'EBP Premium - Phoenix'
      when ${placement} ilike 'Expedia_Phoenix_EBP Native Marquee%' then 'EBP Native Marquee - Phoenix'
      when ${placement} ilike 'Expedia_Phoenix_Expedia: Flights/Hotels/Vacations/PKG R1%' then 'Expedia: Flights/Hotels/PKG R1 - Phoenix'

      when ${placement} ilike '%UK_High Impact Display%' then 'Off-Site High Impact Display'
      when ${placement} ilike '%UK_On Site High Impact Display%' then 'On-Site High Impact Display'
      when ${placement} ilike '%High Impact Native Click Through%' then 'On-Site High Impact Native'
      when ${placement} ilike '%UK_Off site Native Traffic Drivers%' then 'Off-Site High Impact Native'

      when ${placement} ilike 'Conde Nast_FY20 Prem. Digital_Awareness_NTL_HPTO/First Impression Takeover%' then 'CN Traveler - Homepage/First Impression Takeover'
      when ${placement} ilike 'Conde Nast_FY20 Prem. Digital_Awareness_NTL_Sitewide Rotation_CN Traveler Display%' then 'CN Traveler - Rotaional Display'
      when ${placement} ilike 'Conde Nast_FY20 Prem. Digital_Awareness_NTL_Contextually Targeted Display_CN Portfolio%' then 'CN Portfolio - Contextual Display'
      when ${placement} ilike 'Conde Nast_FY20 Prem. Digital_Awareness_NTL_Contextually Targeted Display AV_CN Traveler AV%' then 'CN Traveler - Contextual Display AV'

      when ${placement} ilike 'T+L_Meredith_FY20 Prem. Digital_Awareness_NTL excl. SD_AV_Lux Group%' then 'Meredith - AV Display'
      when ${placement} ilike 'T+L_Meredith_FY20 Prem. Digital_Awareness_NTL excl. SD_Lux Group & InStyle_Travel Content%' then 'Meredith - ROS Display'
      when ${placement} = 'T+L_Meredith_FY20 Prem. Digital_Awareness_NTL excl. SD_High Impact Display Portrait_Travel Interest_020320-041220_1x1' then 'Meredith - Portrait High Impact Display'
      when ${placement} = 'T+L_Meredith_FY20 Prem. Digital_Awareness_NTL excl. SD_AT HALO_Travel Interest_020320-041220_1x1' then 'Meredith - Halo Unit'
      when ${placement} = 'T+L_Meredith_FY20 Prem. Digital_Awareness_NTL excl. SD_Cross Screen Scroller_Travel Interest_020320-041220_1x1' then 'Meredith - Cross Screen Scroller'

      when ${placement} ilike 'T+L_FY20 Prem. Digital_Awareness_NTL_Editorial Sponsorship%' then 'T+L - Editorial Sponsorship'
      when ${placement} = 'T+L_FY20 Prem. Digital_Awareness_NTL_Social Amplification_Editorial Spons. _020320-022920_1x1' then 'T+L - Social Amplification'
      when ${placement} ilike 'T+L_FY20 Prem. Digital_Awareness_NTL_HPTO & First Impression Sponsorship 1%' then 'T+L - Homepage/First Impression Takeover (2/3 - 2/9)'
      when ${placement} ilike 'T+L_FY20 Prem. Digital_Awareness_NTL_HPTO & First Impression Sponsorship 2%' then 'T+L - Homepage/First Impression Takeover (2/24 - 3/1)'
      when ${placement} ilike 'T+L_FY20 Prem. Digital_Awareness_NTL_HPTO & First Impression Sponsorship 3%' then 'T+L - Homepage/First Impression Takeover (3/16 - 3/22)'
      when ${placement} ilike 'T+L_FY20 Prem. Digital_Awareness_NTL_HPTO & First Impression Sponsorship3%' then 'T+L - Homepage/First Impression Takeover (3/16 - 3/22)'
      when ${placement} ilike 'T+L_FY20 Prem. Digital_Awareness_NTL_HPTO & First Impression Sponsorship 4%' then 'T+L - Homepage/First Impression Takeover (3/30 - 4/5)'

      when ${placement} ilike 'TripAdvisor_Storytelling_Native Outstream Video Banner%' then 'Native Outstream Dynamic Video Banner'
      when ${placement} ilike 'TripAdvisor_Storytelling_Dynamic Video Banner%' then 'Dynamic Video Banners'
      when ${placement} ilike 'TripAdvisor_Storytelling_Native Hub Traffic Driver (in-kind)%' then 'Content Hub Traffic Drivers (In-Kind)'
      when ${placement} ilike 'TripAdvisor_Storytelling_Native Hub Traffic Driver_Outdoor%' then 'Content Hub Traffic Drivers'
      when ${placement} ilike 'TripAdvisor_Storytelling_Native Hub Traffic Driver_Culinary%' then 'Content Hub Traffic Drivers'
      when ${placement} ilike 'TripAdvisor_Storytelling_Audience Extension - Video%' then 'Audience Extension - Video'
      when ${placement} ilike 'TripAdvisor_Reach_Homepage Hero%' then 'HomePage Hero'
      when ${placement} ilike 'TripAdvisor_Destination Sponsorship%' then 'Destination Sponsorship'
      when ${placement} ilike 'TripAdvisor_SDTA Content Hub Promotional Click Out' then 'Content Hub Promotional Click Out'

      when ${placement_id} = '254378108' then 'Native Outstream Dynamic Video Banner'
      when ${placement_id} = '254378081' then 'Native Outstream Dynamic Video Banner'
      when ${placement} ilike 'TripAdvisor_Native Hub Traffic Driver - Storytelling%' then 'Content Hub Traffic Drivers'
      when ${placement} ilike 'TripAdvisor_Homepage Hero - Display - Reach%' then 'HomePage Hero'
      when ${placement} ilike 'TripAdvisor_Dynamic Video Banner - Storytelling%' then 'Dynamic Video Banners'
      when ${placement} ilike 'TripAdvisor_Destination Sponsorship%' then 'Destination Sponsorship'
      when ${placement} ilike 'TripAdvisor_DF Retargeting - Impact%' then 'DF Retargeting'
      when ${placement} ilike 'TripAdvisor_Audience Extension - Video - Storytelling%' then 'Audience Extension - Video'

      when ${placement} ilike 'Taboola_FY20 Family Content_Macro%' then 'Native :60 Video - Family Variety Seeker'
      when ${placement} ilike 'Taboola_FY20 Family Content_Micro%' then 'Native Static - Retargeting Macro'
      when ${placement} ilike 'Taboola_FY20 Family Content_Nano%' then 'Native Static - Retargeting Micro'

      when ${placement} ilike 'Sunset_FY20 Balboa_Awareness_VS A25-54_NTL_Run of Site%' then 'Sunset.com Run of Site'
      when ${placement} ilike 'Sunset_FY20 Balboa_Awareness_VS A25-54_NTL_Newsletters%' then 'Weekly Newsletters'
      when ${placement} ilike 'Sunset_FY20 Balboa_Awareness_VS A25-54_NTL_High Impact Halo Unit%' then 'High Impact Halo Unit'

      when ${placement} ilike 'inPowered_Native_Nano%' then 'Native Traffic - Nano'
      when ${placement_id} = '255163489' then 'Native Traffic - Micro'
      when ${placement_id} = '255163492' then 'Native Traffic - Micro'
      when ${placement_id} = '255163495' then 'Native Traffic - Micro'
      when ${placement_id} = '255163510' then 'Native Video - Macro Outdoor'
      when ${placement_id} = '255163522' then 'Native Video - Macro Outdoor'
      when ${placement_id} = '255163534' then 'Native Video - Macro Outdoor'
      when ${placement_id} = '255163516' then 'Native Video - Macro NonOutdoor'
      when ${placement_id} = '255163528' then 'Native Video - Macro NonOutdoor'
      when ${placement_id} = '255163540' then 'Native Video - Macro NonOutdoor'
      when ${placement_id} = '255163888' then 'Native Video - Macro NonOutdoor'
      when ${placement_id} = '255163513' then 'Native Traffic - Macro Outdoor'
      when ${placement_id} = '255163525' then 'Native Traffic - Macro Outdoor'
      when ${placement_id} = '255163537' then 'Native Traffic - Macro Outdoor'
      when ${placement_id} = '255163882' then 'Native Traffic - Macro Outdoor'
      when ${placement_id} = '255163519' then 'Native Traffic - Macro NonOutdoor'
      when ${placement_id} = '255163531' then 'Native Traffic - Macro NonOutdoor'
      when ${placement_id} = '255163543' then 'Native Traffic - Macro NonOutdoor'

      when ${placement} ilike 'StackAdapt_FY20 AlwaysOnContent_Macro_Outdoor%' then 'Native Video - Macro Outdoor'
      when ${placement} ilike 'StackAdapt_FY20 AlwaysOnContent_Macro_NonOutdoor%' then 'Native Video - Macro NonOutdoor'
      when ${placement} ilike 'StackAdapt_FY20 AlwaysOnContent_Micro%' then 'Native Video - Micro Mixed'

      when ${placement} ilike 'Bell Media_Awareness/Reach_Custom Package%' then 'Pre-Roll Video - Custom Package'
      when ${placement} ilike 'Bell Media_Awareness/Reach_TSN%' then 'Pre-Roll Video - TSN'

      when ${placement} ilike 'Global TV_Awareness/Reach_Companion Banner%' then 'Video Companion Banner'
      when ${placement} ilike 'Global TV_Awareness/Reach_HGTV.ca%' then 'Pre-Roll Video - HGTV'
      when ${placement} ilike 'Global TV_Awareness/Reach_Food Network%' then 'Pre-Roll Video - Food Network'
      when ${placement} ilike 'Global TV_Awareness/Reach_GlobalTV.ca%' then 'Pre-Roll Video - Global TV'
      when ${placement} ilike 'Global TV_Awareness/Reach_Global Go%' then 'Pre-Roll Video - Global Go'

      when ${placement} ilike 'StackAdapt_Content_RON - Video - Behavioral%' then 'Native Video - Behavior Targeting'
      when ${placement} ilike 'StackAdapt_Content_RON - Video - Contextual%' then 'Native Video - Contextual Targeting'
      when ${placement} ilike 'StackAdapt_Content_RON - Video - Lookalike%' then 'Native Video - Lookalike Targeting'
      when ${placement} ilike 'StackAdapt_Content_RON - Native Traffic - Behavioral%' then 'Native Traffic - Behavior Targeting'
      when ${placement} ilike 'StackAdapt_Content_RON - Native Traffic - Contextual%' then 'Native Traffic - Contextual Targeting'
      when ${placement} ilike 'StackAdapt_Content_RON - Native Traffic - Lookalike%' then 'Native Traffic - Lookalike Targeting'

      else 'Uncategorized'
    end;;
}

  dimension: sdt_pillar {
    type: string
    group_label: "Client Dimensions"
    label: "Pillar"
    sql:
      case
        when ${ad} ilike '%(in-kind)_Outdoor_%' then 'Outdoor'
        when ${ad} ilike '%(in-kind)_Entertainment_%' then 'Entertainment'
        when ${ad} ilike '%(in-kind)_Culture_%' then 'Culture'
        when ${ad} ilike '%(in-kind)_Culinary_%' then 'Culinary'
        when ${ad} ilike '%(in-kind)_Attractions_%' then 'Attractions'

        when ${ad} ilike '%Native Outstream Video Banner_Outdoor%' then 'Outdoor'

        when ${ad} ilike '%Native Hub Traffic Driver_Outdoor%' then 'Outdoor'
        when ${ad} ilike '%Native Hub Traffic Driver_Entertainment%' then 'Entertainment'
        when ${ad} ilike '%Native Hub Traffic Driver_Culture%' then 'Culture'
        when ${ad} ilike '%Native Hub Traffic Driver_Culinary%' then 'Culinary'
        when ${ad} ilike '%Native Hub Traffic Driver_Attractions%' then 'Attractions'

        when ${ad} ilike '%Dynamic Video Banner_Outdoor%' then 'Outdoor'
        when ${ad} ilike '%Dynamic Video Banner_Entertainment%' then 'Entertainment'
        when ${ad} ilike '%Dynamic Video Banner_Culture%' then 'Culture'
        when ${ad} ilike '%Dynamic Video Banner_Culinary%' then 'Culinary'
        when ${ad} ilike '%Dynamic Video Banner_Attractions%' then 'Attractions'

        when ${ad} ilike '%Audience Extension - Video_Outdoor%' then 'Outdoor'
        when ${ad} ilike '%Audience Extension - Video_Entertainment%' then 'Entertainment'
        when ${ad} ilike '%Audience Extension - Video_Culture%' then 'Culture'
        when ${ad} ilike '%Audience Extension - Video_Culinary%' then 'Culinary'
        when ${ad} ilike '%Audience Extension - Video_Attractions%' then 'Attractions'

        when ${ad} ilike '%Click Out_Attractions%' then 'Attractions'
        when ${ad} ilike '%Click Out_Entertainment%' then 'Entertainment'
        when ${ad} ilike '%Click Out_Outdoor%' then 'Outdoor'
        when ${ad} ilike '%Click Out_Culture%' then 'Culture'
        when ${ad} ilike '%Click Out_Culinary%' then 'Culinary'

        when ${placement_id} = '257563080' then 'N/A'
        when ${placement_id} = '257459206' then 'N/A'

        when ${placement_id} = '256942838' then 'N/A'
        when ${placement_id} = '257262213' then 'N/A'

        when ${ad} ilike '%TripAdvisor_Native Outstream Video Banner - Storytelling_Outdoor%' then 'Outdoor'
        when ${ad} ilike '%TripAdvisor_Native Outstream Dynamic Video Banner - Storytelling_Outdoor%' then 'Outdoor'
        when ${ad} ilike '%TripAdvisor_Native Hub Traffic Driver - Storytelling_Outdoor%' then 'Outdoor'
        when ${ad} ilike '%TripAdvisor_Native Hub Traffic Driver - Storytelling_Entertainment%' then 'Entertainment'
        when ${ad} ilike '%TripAdvisor_Native Hub Traffic Driver - Storytelling_Culture%' then 'Culture'
        when ${ad} ilike '%TripAdvisor_Native Hub Traffic Driver - Storytelling_Culinary%' then 'Culinary'
        when ${ad} ilike '%TripAdvisor_Native Hub Traffic Driver - Storytelling_Attractions%' then 'Attractions'

        when ${ad} ilike '%TripAdvisor_Dynamic Video Banner - Storytelling_Outdoor%' then 'Outdoor'
        when ${ad} ilike '%TripAdvisor_Dynamic Video Banner - Storytelling_Entertainment%' then 'Entertainment'
        when ${ad} ilike '%TripAdvisor_Dynamic Video Banner - Storytelling_Culture%' then 'Culture'
        when ${ad} ilike '%TripAdvisor_Dynamic Video Banner - Storytelling_Culinary%' then 'Culinary'
        when ${ad} ilike '%TripAdvisor_Dynamic Video Banner - Storytelling_Attractions%' then 'Attractions'

        when ${ad} ilike '%TripAdvisor_Audience Extension - Video - Storytelling_Outdoor%' then 'Outdoor'
        when ${ad} ilike '%TripAdvisor_Audience Extension - Video - Storytelling_Entertainment%' then 'Entertainment'
        when ${ad} ilike '%TripAdvisor_Audience Extension - Video - Storytelling_Culture%' then 'Culture'
        when ${ad} ilike '%TripAdvisor_Audience Extension - Video - Storytelling_Culinary%' then 'Culinary'
        when ${ad} ilike '%TripAdvisor_Audience Extension - Video - Storytelling_Attractions%' then 'Attractions'

        when ${placement_id} = '254378105' then 'N/A'
        when ${placement_id} = '254378129' then 'N/A'
        when ${placement_id} = '254378111' then 'N/A'
        when ${placement_id} = '254378123' then 'N/A'
        when ${placement_id} = '254378117' then 'N/A'
        when ${placement_id} = '254378099' then 'N/A'
        when ${placement_id} = '254374502' then 'N/A'
        when ${placement_id} = '254380277' then 'N/A'

        when ${placement} ilike '%Video Completes_Outdoor' then 'Outdoor'
        when ${placement} ilike '%Video Completes_Neighborhoods' then 'Neighborhood'
        when ${placement} ilike '%Video Completes_Culinary' then 'Culinary'
        when ${placement} ilike '%Video Completes_Attractions' then 'Attractions'

        when ${placement} ilike '%Impressions_Outdoor' then 'Outdoor'
        when ${placement} ilike '%Impressions_Neighborhoods' then 'Neighborhood'
        when ${placement} ilike '%Impressions_Culinary' then 'Culinary'
        when ${placement} ilike '%Impressions_Attractions' then 'Attractions'

        when ${placement} ilike 'inPowered_Native_Nano%' then 'N/A'
      when ${placement_id} = '255163510' then 'Outdoor'
      when ${placement_id} = '255163522' then 'Outdoor'
      when ${placement_id} = '255163534' then 'Outdoor'
      when ${placement_id} = '255163516' then 'Non-Outdoor'
      when ${placement_id} = '255163528' then 'Non-Outdoor'
      when ${placement_id} = '255163540' then 'Non-Outdoor'
      when ${placement_id} = '255163888' then 'Non-Outdoor'
      when ${placement_id} = '255163513' then 'Outdoor'
      when ${placement_id} = '255163525' then 'Outdoor'
      when ${placement_id} = '255163537' then 'Outdoor'
      when ${placement_id} = '255163882' then 'Outdoor'
      when ${placement_id} = '255163519' then 'Non-Outdoor'
      when ${placement_id} = '255163531' then 'Non-Outdoor'
      when ${placement_id} = '255163543' then 'Non-Outdoor'

          ELSE 'Uncategorized'
      END;;
  }

  dimension: creative_name {
    type: string
    group_label: "Client Dimensions"
    label: "Creative Name"
    sql:
      case
        when ${placement_id} = '252937755' then 'Find Your Smile in San Diego (:30) - Family'
        when ${placement_id} = '252509375' then 'Find Your Smile in San Diego (:30) - Brand'

        when ${placement_id} = '252866297' then 'Find Your Smile in San Diego (:30) - Brand'
        when ${placement_id} = '252866285' then 'Find Your Smile in San Diego (:30) - Family'

        when ${placement_id} = '252328262' then 'Find Your Smile in San Diego (:30) - Family'
        when ${placement_id} = '252701236' then 'Find Your Smile in San Diego (:30) - Brand'

        when ${placement_id} = '253236655' then 'Find Your Smile in San Diego (:30) - Family'
        when ${placement_id} = '253315548' then 'Find Your Smile in San Diego (:30) - Brand'

        when ${placement} ilike '%live streaming video added value companion%' then 'Companion Banner'
        when ${placement} ilike '%30 Happy Today - Family' then 'Happy Today (:30) - Family'
        when ${placement} ilike '%30 Happy Today - Brand' then 'Happy Today (:30) - Brand'

        when ${placement_id} = '252945715' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '252530186' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '252530123' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '252888028' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '252888751' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '252888157' then 'Happy Today (:30) - Brand'

        when ${placement_id} = '252875912' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '253220767' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '253309155' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '253225471' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '253303128' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '252871376' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '253301820' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '253217116' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '252888799' then 'Happy Today (:30) - Brand'

        when ${placement_id} = '265518918' then 'Happy Today (:30) - Family'
        when ${placement_id} = '265518918' then 'Happy Today (:30) - Family'
        when ${placement_id} = '265503247' then 'Happy Today (:30) - Family'
        when ${placement_id} = '253217146' then 'Happy Today (:30) - Family'
        when ${placement_id} = '265499293' then 'Happy Today (:30) - Family'

        when ${placement_id} = '252330719' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '252324173' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '252868753' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '252530312' then 'Happy Today (:30) - Brand'

        when ${placement_id} = '252934278' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '252937650' then 'Happy Today (:30) - Brand'
        when ${placement_id} = '252937671' then 'Happy Today (:30) - Brand'

        when ${ad} ilike '%Torrey Pines Golf :60' then 'Torrey Pines Golf (:60)'
        when ${ad} ilike '%Coastal Yoga :60' then 'Coastal Yoga (:60)'
        when ${ad} ilike '%Boardwalk Cruising :60' then 'Boardwalk Cruising (:60)'
        when ${ad} ilike '%Tiki OBI :60' then 'Tiki (:60)'
        when ${ad} ilike '%Liberty Station OBI :60' then 'Liberty Station (:60)'
        when ${ad} ilike '%Barrio Logan G2GS :60' then 'Barrio Logan (:60)'
        when ${ad} ilike '%Barrio Dogg Longform' then 'Barrio Dogg Longform'
        when ${ad} ilike '%Animae Longform' then 'Animae Longform'
        when ${ad} ilike '%USS Midway OBI :60' then 'USS Midway (:60)'
        when ${ad} ilike '%Stuart Collection OBI :60' then 'Stuart Collection (:60)'
        when ${ad} ilike '%Live Music G2GS :60' then 'Live Music (:60)'

        when ${ad} ilike '%SD_OBI_Lego Movie World :60' then 'Lego Movie World (:60)'
        when ${ad} ilike '%SD_OBI_Birch Aquarium :60' then 'Birch Aquarium (:60)'
        when ${ad} ilike '%SD_OBI_Learn to Surf :60' then 'Learn to Surf (:60)'
        when ${ad} ilike '%SD_OBI_Whale Watching :60' then 'Whale Watching (:60)'
        when ${ad} ilike '%SD_Socks_Star of India' then 'Star of India Longform'
        when ${ad} ilike '%SD_Socks_Tidepools' then 'Tidepools Longform'
        when ${ad} ilike '%SD_Socks_Torrey Pines' then 'Torrey Pines Longform'
        when ${ad} ilike '%SD_OBI_Caravan Safari :60' then 'Caravan Safari (:60)'
        when ${ad} ilike '%SD_OBI_Seaworld :60' then 'Seaworld (:60)'

        when ${ad} ilike '%SD_Native Static_Legoland Listicle' then 'LegoLand Listicle'
        when ${ad} ilike '%SD_Native Static_7 Reasons to Bring the Family to San Diego' then '7 Reasons to Bring the Family to San Diego'
        when ${ad} ilike '%SD_Native Static_A One-Day Kid-Focused Tour' then 'A One-Day Kid-Focused Tour'
        when ${ad} ilike '%SD_Native Static_Education Disguised as Entertainment' then 'Education Disguised as Entertainment'
        when ${ad} ilike '%SD_Native Static_Family Fun in San Diego' then 'Family Fun in San Diego'

        when ${ad} ilike '%SD_Native Static_San Diego Zoo Listicle' then 'San Diego Zoo Listicle'
        when ${ad} ilike '%SD_Native Static_Seaworld Listicle' then 'SeaWorld Listicle'
        when ${ad} ilike '%SD_Native Static_Awesome Awaits' then 'Awesome Awaits'
        when ${ad} ilike '%SD_Native Static_Buy Online and Save' then 'Buy Online and Save'
        when ${ad} ilike '%SD_Native Static_The Lego Movie World' then 'The Lego Movie World'
        when ${ad} ilike '%SD_Native Static_Hotels & Resorts' then 'Hotels & Resorts'
        when ${ad} ilike '%SD_Native Static_Plan - Family Travel' then 'Plan - Family Travel'
        when ${ad} ilike '%SD_Native Static_Save Big with San Diego Passes' then 'Save Big with San Diego Passes'
        when ${ad} ilike '%SD_Native Static_Choose Your Caravan Safari' then 'Choose Your Caravan Safari'
        when ${ad} ilike '%SD_Native Static_Experience Jungle Ropes Safari' then 'Experience Jungle Ropes Safari'
        when ${ad} ilike '%SD_Native Static_Soar on Flightline Safari' then 'Soar on Flightline Safari'
        when ${ad} ilike '%SD_Native Static_Get Up Close with Dolphins' then 'Get Up Close with Dolphins'
        when ${ad} ilike '%SD_Native Static_Save $20 Online' then 'Save $20 Online'

        when ${ad} ilike '%Video - Lookalike_Alana La Jolla%' then 'La Jolla (:60)'
        when ${ad} ilike '%Video - Lookalike_Ron Machado%' then 'Surfing San Diego (:60)'
        when ${ad} ilike '%Video - Lookalike_Aaron Picture Perfect%' then 'Picture Perfect Spots (:60)'
        when ${ad} ilike '%Video - Lookalike_Alana Mission Bay%' then 'Mission Bay (:60)'
        when ${ad} ilike '%Video - Lookalike_OBI: Old Town Mexican%' then 'Old Town Mexican (:60)'
        when ${ad} ilike '%Video - Lookalike_OBI: Coastal Yoga%' then 'Coastal Yoga (:60)'

        when ${ad} ilike '%Video - Contextual_Alana La Jolla%' then 'La Jolla (:60)'
        when ${ad} ilike '%Video - Contextual_Rob Machado%' then 'Surfing San Diego (:60)'
        when ${ad} ilike '%Video - Contextual_Aaron Picture Perfect%' then 'Picture Perfect Spots (:60)'
        when ${ad} ilike '%Video - Contextual_Alana Mission Bay%' then 'Mission Bay (:60)'
        when ${ad} ilike '%Video - Contextual_OBI: Old Town Mexican%' then 'Old Town Mexican (:60)'
        when ${ad} ilike '%Video - Contextual_OBI: Coastal Yoga%' then 'Coastal Yoga (:60)'

        when ${ad} ilike '%Video - Behavioral_Alana La Jolla%' then 'La Jolla (:60)'
        when ${ad} ilike '%Video - Behavioral_Rob Machado%' then 'Surfing San Diego (:60)'
        when ${ad} ilike '%Video - Behavioral_Aaron Picture Perfect%' then 'Picture Perfect Spots (:60)'
        when ${ad} ilike '%Video - Behavioral_Alana Mission Bay%' then 'Mission Bay (:60)'
        when ${ad} ilike '%Video - Behavioral_OBI: Old Town Mexican%' then 'Old Town Mexican (:60)'
        when ${ad} ilike '%Video - Behavioral_OBI: Coastal Yoga%' then 'Coastal Yoga (:60)'

        when ${ad} ilike '%Traffic - Behavioral_Sunsets%' then 'Sunsets'
        when ${ad} ilike '%Traffic - Behavioral_Rooftop Restaurants%' then 'Rooftop Restaurants'
        when ${ad} ilike '%Traffic - Behavioral_Make a splash%' then '7 Ways to Make a Splash'
        when ${ad} ilike '%Traffic - Behavioral_BP Hidden Gems%' then 'Balboa Park Hidden Gems'
        when ${ad} ilike '%Traffic - Behavioral_Boat Rides%' then 'Boat Rides'
        when ${ad} ilike '%Traffic - Behavioral_Behind The Scenes%' then 'Behind The Scenes Tours'

        when ${ad} ilike '%Traffic - Contextual_Sunsets%' then 'Sunsets'
        when ${ad} ilike '%Traffic - Contextual_Rooftop Restaurants%' then 'Rooftop Restaurants'
        when ${ad} ilike '%Traffic - Contextual_Make a splash%' then '7 Ways to Make a Splash'
        when ${ad} ilike '%Traffic - Contextual_BP Hidden Gems%' then 'Balboa Park Hidden Gems'
        when ${ad} ilike '%Traffic - Contextual_Boat Rides%' then 'Boat Rides'
        when ${ad} ilike '%Traffic - Contextual_Behind The Scenes%' then 'Behind The Scenes Tours'

        when ${ad} ilike '%Traffic - Lookalike_Sunsets%' then 'Sunsets'
        when ${ad} ilike '%Traffic - Lookalike_Rooftop Restaurants%' then 'Rooftop Restaurants'
        when ${ad} ilike '%Traffic - Lookalike_Make a splash%' then '7 Ways to Make a Splash'
        when ${ad} ilike '%Traffic - Lookalike_Hidden Gems%' then 'Balboa Park Hidden Gems'
        when ${ad} ilike '%Traffic - Lookalike_Boat Rides%' then 'Boat Rides'
        when ${ad} ilike '%Traffic - Lookalike_Behind The Scenes%' then 'Behind The Scenes Tours'

        when ${placement} ilike 'Global TV_Awareness/Reach_Companion Banner%' then 'Video Companion Banner'
        when ${placement_id} = '252937671' then 'Find Your Smile in San Diego (:30)'

        when ${placement} ilike 'Bell Media_Awareness/Reach_Custom Package%' then 'Find Your Smile in San Diego (:30)'
        when ${placement} ilike 'Bell Media_Awareness/Reach_TSN%' then 'Find Your Smile in San Diego (:30)'

        when ${placement} ilike 'Global TV_Awareness/Reach_Companion Banner%' then 'Video Companion Banner'
        when ${placement} ilike 'Global TV_Awareness/Reach_HGTV.ca%' then 'Find Your Smile in San Diego (:30)'
        when ${placement} ilike 'Global TV_Awareness/Reach_Food Network%' then 'Find Your Smile in San Diego (:30)'
        when ${placement} ilike 'Global TV_Awareness/Reach_GlobalTV.ca%' then 'Find Your Smile in San Diego (:30)'
        when ${placement} ilike 'Global TV_Awareness/Reach_Global Go%' then 'Find Your Smile in San Diego (:30)'






          ELSE 'Uncategorized'
      END;;
  }

  dimension: sdt_partner {
    type: string
    group_label: "Client Dimensions"
    label: "SDT Partner (Fam. Content)"
    sql:
    case
      when ${placement} ilike 'Taboola_FY20 Family Content_Macro\\_LL\\_%' then 'LegoLand'
      when ${placement} ilike 'Taboola_FY20 Family Content_Macro\\_SD\\_%' then 'San Diego Tourism'
      when ${placement} ilike 'Taboola_FY20 Family Content_Macro\\_SDZ\\_%' then 'San Diego Zoo'
      when ${placement} ilike 'Taboola_FY20 Family Content_Macro\\_SW\\_%' then 'SeaWorld'

      when ${placement} ilike 'Taboola_FY20 Family Content_Micro\\_LL\\_Macro RTG%' then 'LegoLand'
      when ${placement} ilike 'Taboola_FY20 Family Content_Nano\\_LL\\_Micro RTG%' then 'LegoLand'

      when ${placement} ilike 'Taboola_FY20 Family Content_Micro\\_SD\\_Macro RTG%' then 'San Diego Tourism'
      when ${placement} ilike 'Taboola_FY20 Family Content_Nano\\_SD\\_Micro RTG%' then 'San Diego Tourism'

      when ${placement} ilike 'Taboola_FY20 Family Content_Micro\\_SDZ\\_Macro RTG%' then 'San Diego Zoo'
      when ${placement} ilike 'Taboola_FY20 Family Content_Nano\\_SDZ\\_Micro RTG%' then 'San Diego Zoo'

      when ${placement} ilike 'Taboola_FY20 Family Content_Micro\\_SW\\_Macro RTG%' then 'SeaWorld'
      when ${placement} ilike 'Taboola_FY20 Family Content_Nano\\_SW\\_Micro RTG%' then 'SeaWorld'

      ELSE null
      END;;
  }



#           when ${placement_id} = '252330719' then 'Happy Today (:30)'
#         when ${placement_id} = '252324173' then 'Happy Today (:30)'
#         when ${placement_id} = '252868753' then 'Happy Today (:30)'

#           when ${placement} ilike '%:30 Happy Today - Brand%' then 'Every Day is a Happy Day in San Diego (:30)'

######### All Dimensions Native to Source Table Below #########

  dimension: __report {
    hidden: yes
    type: number
    sql: ${TABLE}.__report ;;
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

  dimension: active_view__measurable_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}."active view: % measurable impressions"  ;;
  }

  dimension: active_view__viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: % viewable impressions"  ;;
  }

  dimension: active_view_eligible_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: eligible impressions"  ;;
  }

  dimension: active_view_measurable_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}."active view: measurable impressions" ;;
  }

  dimension: active_view_viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: viewable impressions" ;;
  }

  dimension: ad {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_id {
    type: string
    group_label: "DCM IDs"
    sql: ${TABLE}."ad id" ;;
  }

  dimension: advertiser {
    type: string
    hidden: yes
    sql: ${TABLE}.advertiser ;;
  }

  dimension: booked_clicks {
    hidden: yes
    group_label: "Booked Metrics"
    label: "Booked Clicks"
    type: number
    sql: ${TABLE}."booked clicks" ;;
  }

  dimension: booked_impressions {
    type: number
    hidden: yes
    group_label: "Booked Metrics"
    label: "Booked Impressions"
    sql: ${TABLE}."booked impressions" ;;
  }

  dimension: booked_viewable_impressions {
    type: number
    hidden: yes
    group_label: "Booked Metrics"
    label: "Booked Viewable Impressions"
    sql: ${TABLE}."booked viewable impressions" ;;
  }

  dimension: campaign {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "DCM IDs"
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: clickthrough_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}."click-through conversions" ;;
  }

  dimension: clickthrough_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}."click-through revenue" ;;
  }

  dimension: creative {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.creative ;;
  }

  dimension: creative_id {
    type: string
    group_label: "DCM IDs"
    sql: ${TABLE}."creative id" ;;
  }

  dimension_group: date {
    type: time
    group_label: "Date Periods"
    label: ""
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
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: media_cost {
    type: number
    hidden: yes
    sql: ${TABLE}."media cost" ;;
  }

  dimension: placement {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.placement ;;
  }

  dimension: placement_id {
    type: number
    group_label: "DCM IDs"
    sql: ${TABLE}."placement id" ;;
  }

  dimension: advertising_channel {
    type: string
    group_label: "DCM Dimensions"
    label: "Channel"
    sql: ${TABLE}."placement strategy" ;;
  }

  dimension: planned_media_cost {
    type: number
    hidden: yes
    group_label: "Booked Metrics"
    label: "Booked Media Cost"
    value_format_name: usd
    sql: ${TABLE}."planned media cost" ;;
  }

  dimension: platform_type {
    type: string
    hidden: yes
    sql: ${TABLE}."platform type" ;;
  }

  dimension: site_dcm {
    type: string
    label: "Site"
    group_label: "DCM Dimensions"
    sql: ${TABLE}."site (dcm)" ;;
  }

  dimension: total_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}."total conversions" ;;
  }

  dimension: total_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}."total revenue" ;;
  }

  dimension: viewthrough_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}."view-through conversions" ;;
  }

  dimension: viewthrough_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}."view-through revenue" ;;
  }

######### All measures go below ########

  measure: total_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Clicks"
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    group_label: "3rd Party Measures"
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_active_view_measureable_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Active View Measureable Impressions"
    sql: ${active_view_measurable_impressions} ;;
  }

  measure: total_active_view_viewable_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Active View Viewable Impressions"
    sql: ${active_view_viewable_impressions} ;;
  }

  measure: total_viewability {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewability"
    sql: ${total_active_view_viewable_impressions}/nullif(${total_active_view_measureable_impressions}, 0) ;;
    value_format_name: percent_0
  }

  measure: total_media_cost {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Media Spend"
    sql: ${media_cost} ;;
    value_format_name: usd
  }

  measure: cost_per_click {
    group_label: "3rd Party Measures"
    type: number
    label: "CPC"
    sql: ${total_media_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: viewable_click_through_rate {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewable CTR"
    sql: ${total_clicks}/nullif(${total_active_view_viewable_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: viewable_cpm {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewable CPM"
    sql: 1.0*${total_media_cost}/nullif(${total_active_view_viewable_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    group_label: "3rd Party Measures"
    type: number
    label: "CPM"
    sql: 1.0*${total_media_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  ####### Joined GA Measures #########

  measure: ga_sessions {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${sdt_ga_onsite.id};;
    sql: ${sdt_ga_onsite.sessions} ;;
  }

  measure: cost_per_session {
    group_label: "GA Reporting"
    type: number
    label: "CPS"
    sql: ${total_media_cost}/nullif(${ga_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: ga_total_session_duration {
    hidden: yes
    group_label: "GA Reporting"
    type: sum_distinct
    sql_distinct_key: ${sdt_ga_onsite.id};;
    label: "Total Session Duration"
    sql: ${sdt_ga_onsite.sessionduration} ;;
  }

  measure: ga_avg_session_duration {
    type: number
    label: "Avg. TOS"
    group_label: "GA Reporting"
    sql: (${ga_total_session_duration}/nullif(${ga_sessions}, 0))::float/86400 ;;
    value_format: "m:ss"
  }

  measure: ga_total_users {
    group_label: "GA Reporting"
    label: "Users"
    type: sum_distinct
    sql_distinct_key: ${sdt_ga_onsite.id};;
    sql: ${sdt_ga_onsite.users} ;;
  }

  measure: ga_new_users {
    group_label: "GA Reporting"
    label: "New Users"
    type: sum_distinct
    sql_distinct_key: ${sdt_ga_onsite.id};;
    sql: ${sdt_ga_onsite.newusers} ;;
  }

  measure: percent_new_users {
    group_label: "GA Reporting"
    label: "% New Users"
    type: number
    sql: ${ga_new_users}/nullif(${ga_total_users}, 0) ;;
    value_format_name: percent_0
  }

  measure: ga_total_pageviews {
    group_label: "GA Reporting"
    label: "Pageviews"
    type: sum_distinct
    sql_distinct_key: ${sdt_ga_onsite.id};;
    sql: ${sdt_ga_onsite.pageviews} ;;
  }

  measure: pages_per_session {
    group_label: "GA Reporting"
    label: "Pgs/Session"
    type: number
    sql: ${ga_total_pageviews}/nullif(${ga_sessions}, 0) ;;
    value_format: "#.0"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
