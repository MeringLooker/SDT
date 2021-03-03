view: sdt_dcm_ga_view {
  sql_table_name: public.sdt_dcm_ga_view ;;

  ######## Primary Key ########

  dimension: ga_join_id {
    type: string
    primary_key: yes
    hidden: yes
    group_label: "DCM IDs"
    sql: ${TABLE}.ga_join_id ;;
  }

  #### Passback Join IDs ####

  dimension: passback_join { ## placement ID + date ALWAYS
    type: string
    hidden: yes
    sql: ${placement_id}||'_'||${date_date} ;;
  }

  dimension: passback_join_ad_creative {
    type: string
    hidden: yes
    sql: ${ad_id}||'_'||${creative_id}||'_'||${date_date} ;;
  }

  dimension: adara_join {
    type: string
    hidden: yes
    sql: ${placement_id}||'_'||${ad_id}||'_'||${creative_id} ;;
  }

  # dimension: passback_join_placement_name { ## placement name + date ALWAYS
  #   type: string
  #   hidden: yes
  #   sql: ${placement}||'_'||${date_date} ;;
  # }

  dimension: passback_join_ad { ## Ad ID + date ALWAYS
    type: string
    hidden: yes
    sql: ${ad_id}||'_'||${date_date} ;;
  }

  dimension: dcm_id { ## placement ID + date ALWAYS
    type: string
    hidden: yes
    sql: ${placement_id}||';'||${creative_id}||';'||${ad_id} ;;
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
          WHEN ${date_date} BETWEEN '2020-07-01' AND '2021-06-30' THEN 'FY 19/20'
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
          when ${placement} ILIKE '%728x90%' then '728x90'
          when ${creative} ILIKE '%300x250%' then '300x250'
          when ${placement} ILIKE '%300x250%' then '300x250'
          when ${creative} ILIKE '%300x600%' then '300x600'
          when ${creative} ILIKE '%160x600%' then '160x600'
          when ${placement} ILIKE '%160x600%' then '160x600'
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
          when ${placement} ilike '% 300x50' then '300x50'
          when ${placement} ilike '%\\_970x90' then '970x90'
          when ${placement} ilike '%\\_1320x742' then '1320x742'
          when ${placement} ilike '%\\_2560x500' then '2560x500'
          when ${placement} ilike '%\\_474x250' then '474x250'
          when ${placement} ilike '%\\_970x550' then '970x550'
          when ${placement} ilike '%\\_680x320' then '680x320'

          when ${ad_id} = '476971125' then '728x90'

          when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery%' then 'Native_1000x600'
          when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery%' then 'Video'

          when ${placement} ilike '%Travel Intender_OnSiteDisplay_Native%' then 'Native'

          when ${ad} ilike '%\\_500x1100_%' then '500x1100'

          when ${ad} ilike 'SDUT_SDTAFY21_RecoveryLocals_Awareness_HPTODisplay_Pushdown Skin_1x1%' then 'Pushdown Skin'

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
          when ${placement_id} = '276884083' then 'Native'

          when ${placement_id} = '294737080' then '400x225'
          when ${placement_id} = '294736822' then '400x225'
          when ${placement_id} = '294736012' then '400x225'

          when ${ad} ilike '%970x250%' then '970x250'
          when ${ad} ilike '%728x90 brand-neutral web ad%' then '728x90'
          when ${ad} ilike '%320x50 brand-neutral web ad%' then '320x50'
          when ${ad} ilike '%300x600 brand-neutral web ad%' then '300x600'
          when ${ad} ilike '%160x600 brand-neutral web ad%' then '160x600'
          when ${ad} ilike '%300x250 brand-neutral web ad%' then '300x250'

          when ${creative_name} ilike '%1200x627%' then '1200x627'

          when ${ad_id} = '487845862' then '2640x1485'
          when ${ad_id} = '487844650' then '2640x1485'
          when ${ad_id} = '487845853' then '2640x1485'

          when ${placement_id} = '256904522' then 'N/A'
          when ${placement_id} = '256902170' then 'N/A'
          when ${placement_id} = '257219080' then 'N/A'
          when ${placement_id} = '256833626' then 'N/A'
          when ${placement_id} = '257219077' then 'N/A'
          when ${placement_id} = '257364207' then 'Native'
          when ${placement_id} = '257365923' then 'Native'
          when ${placement_id} = '256913039' then 'Native'

          when ${placement_id} = '254378108' then 'Native'
          when ${placement} ilike '%Travel Intender_OffSiteDisplay_Native' then 'Native'
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

          when ${ad} ilike '%Halo_Mobile_1x1%' then 'Halo Unit (Mobile_768x768)'
          when ${ad} ilike '%Halo_Desktop_1x1%' then 'Halo Unit (Desktop_1920x480)'

          when ${ad} ilike '%SDTA Content Hub Promotional Click Out%' then 'N/A'

          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_%_RTGNative%' then 'Native'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_%_AVNative%' then 'Native'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_%_Native%' then 'Native'

          when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_SDIntenders_%_Native Search Results%' then 'Native'
          when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_SDIntenders_%_Email Marquee%' then 'Email'

          when ${ad_id} = '487962873' then '1200x627'
          when ${ad_id} = '487681778' then '1200x627'
          when ${ad_id} = '487707014' then '1200x627'

          when ${ad} ilike 'SPOTIFY_SDTAFY21_SpringAwareness_%_%_%_%_640x640_1x1' then '640x640'
          when ${ad} ilike 'SPOTIFY_SDTAFY21_SpringAwareness_%_%_%_%_Companion Banner_%_640x640_1x1' then '640x640'
          when ${ad} ilike 'PANDORA_SDTAFY21_SpringAwareness_%_%_%_%_Companion Banner_%_300x250_1x1' then '300x250'
          when ${ad} ilike 'PANDORA_SDTAFY21_SpringAwareness_%_%_Audio XP_%_Audio_:30_1x1' then 'Audio'

          when ${ad} ilike 'ABC_SDTAFY21_SpringAwareness_In Market Travel_%_Video_HICYB_1x1' then 'Video'
          when ${ad} ilike 'VIACOM_SDTAFY21_SpringAwareness_Variety Seeker_Entertainment and Youth_%_Video_HICYB_1x1' then 'Video'
          when ${ad} ilike 'CBS_SDTAFY21_SpringAwareness_Variety Seeker_%_%_Video_HICYB_1x1' then 'Video'
          when ${ad} ilike 'HULU_SDTAFY21_SpringAwareness_%_%_Video_HICYB_1x1' then 'Video'
          when ${ad} ilike 'NBC_SDTAFY21_SpringAwareness_%_%_Video_%_HICYB_1x1' then 'Video'
          when ${ad} ilike 'PANDORA_SDTAFY21_SpringAwareness_Variety Seeker_%_Video_HICYB_Mobile Video Plus_1x1' then 'Video'
          when ${ad} ilike 'THEHELM_SDTAFY21_SpringAwareness_Variety Seeker_%_Video_%_1x1' then 'Video'
          when ${ad} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_Variety Seeker_Arizona_Certified Pre-Roll Video_HICYB' then 'Video'

          when ${ad} ilike 'PANDORA_SDTAFY21_SpringAwareness_Variety Seeker_%_Audio XP_WeekYay_Companion Banner_WY Hotel_300x250_1x1' then '300x250'
          when ${ad} ilike 'PANDORA_SDTAFY21_SpringAwareness_Variety Seeker_%_Display_HICYB_Mobile Welcome Interstitial_1x1' then '750x1400'

          when ${ad} ilike 'Tripadvisor Tracking Ad-TRIPADVISOR_SDTAFY21_SpringAwareness_%_%_%_Native_1x1' then '1200x627'
          when ${ad} ilike 'Tripadvisor Tracking Ad-TRIPADVISOR_SDTAFY21_SpringAwareness_%_%_%_RTGNative_1x1' then '1200x627'
          when ${ad} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Variety Seeker_%_Horizon_1x1' then 'Horizon High Impact'
          when ${ad} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Destination Sponsorship_Horizon_1x1' then 'Destination Sponsorship'

          when ${ad} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_Spire_%_High Impact Crown_HICYB_Plan Now_1x1' then 'High Impact Crown'
          when ${ad} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_Spire_%_High Impact Crown_HICYB_Creative TBD_1x1' then 'High Impact Crown'

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
          when ${site_dcm} ILIKE 'Spotify%' then 'Spotify'
          when ${site_dcm} ILIKE 'NBC Sports%' then 'NBC Sports'
          when ${site_dcm} ILIKE 'NBC Universal%' then 'NBC'
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
          when ${site_dcm} ILIKE 'Conde Nast%' then 'Condé Nast'

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

          when ${placement} ilike '%AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic%' then 'Micro Traffic'
          when ${placement} ilike '%AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic%' then 'Macro Traffic'
          when ${placement} ilike '%AlwaysOnRecovery_Nano_RetargetMicro%' then 'Nano Traffic'

          when ${placement} ilike '%AlwaysOnRecovery_Macro_VarietySeeker_PHX,TUC_NativeVideo%' then 'Macro Video'
          when ${placement} ilike '%AlwaysOnRecovery_Macro_VarietySeeker_LA_NativeVideo%' then 'Macro Video'
          when ${placement} ilike '%AlwaysOnRecovery_Macro_VarietySeeker_CA_NativeVideo%' then 'Macro Video'

          when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro%' then 'Micro Video'

          when ${ad} ilike 'SDUT_SDTAFY21_RecoveryLocals_Awareness%' then 'Awareness'
          when ${campaign} ilike 'SDT: FY21 Pull-Through%' then 'Intent'

          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_FallDriveMarketRecovery%' then 'Display'
          when ${placement} ilike '%Video Sponsored Session' then 'Digital Video'
          when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery%' then 'Digital Video'
          when ${placement} ilike 'NBC SPOTON_SDTAFY21_FallDriveMarketRecovery%' then 'Digital Video'
          when ${placement} ilike 'HULU_SDTAFY21_FallDriveMarketRecovery%' then 'Digital Video'
          when ${placement} ilike 'ABC_SDTAFY21_FallDriveMarketRecovery%' then 'Digital Video'
          when ${placement} ilike 'CBS_SDTAFY21_FallDriveMarketRecovery%' then 'Digital Video'
          when ${placement} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery%' then 'Display'
          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery%' then 'Display'
          when ${placement} ilike 'SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Road Trip/Travel_TUCSON_Audio Everywhere' then 'Audio'
          when ${placement} ilike 'SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Road Trip/Travel_PHX_Audio Everywhere' then 'Audio'
          when ${placement} ilike 'SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Road Trip/Travel_CALIFORNIA_Audio Everywhere' then 'Audio'
          when ${placement} ilike '%_AudioXP' then 'Audio'
          when ${placement} ilike '%MobileWelcomeInterstitial' then 'Display'
          when ${placement} ilike 'PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_All Markets_AV_Display' then 'Display'
          when ${placement} ilike 'PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_All Markets_Phase 2 Family_AV_Display' then 'Display'

          when ${placement} ilike '%CBS_SDTAFY21_FallDriveMarketRecovery_Awareness_Fall Season_Family Variety Seekers_California%' then 'Audio'
          when ${placement} ilike '%CBS_SDTAFY21_FallDriveMarketRecovery_Awareness_Fall Season_Family Variety Seekers_Phoenix%' then 'Audio'
          when ${placement} ilike '%CBS_SDTAFY21_FallDriveMarketRecovery_Awareness_Fall Season_Family Variety Seekers_Tucson%' then 'Audio'

          when ${placement} ilike 'SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Kids/Family_TUCSON_Audio Everywhere' then 'Audio'
          when ${placement} ilike 'SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Kids/Family_PHX_Audio Everywhere' then 'Audio'
          when ${placement} ilike 'SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Kids/Family_CALIFORNIA_Audio Everywhere' then 'Audio'

          ELSE 'Uncategorized'
          end ;;
    }

    dimension: sdt_campaign {
      type: string
      group_label: "Client Dimensions"
      label: "Campaign Name"
      sql:
        CASE
          when ${campaign} ilike 'SDT: FY21 Pull-Through%' and ${site_dcm} ilike '%Adara%' then 'US Pull-Through'
          when ${ad_id} = '470013971' then 'Uncategorized'

          when ${campaign} ilike 'SDT: FY21 Drive Market Recovery%' then 'Fall Drive Market'

          when ${ad} = '(not set)' then 'Uncategorized'
          when ${ad} ilike '%Default Web Ad%' then 'Uncategorized'

          when ${campaign} ILIKE '%Balboa Park%' then 'Balboa Park Digital'
          when ${campaign} ILIKE '%Family Content%' then 'Family Content'
          when ${campaign} ILIKE '%SD For The Holidays%' then 'SD For The Holidays'

          when ${campaign} = 'SDT: FY19 TripAdvisor Program- CAN' then 'CAN TripAdvisor Program'
          when ${campaign} = 'SDT: 004676_01 FY20 TripAdvisor CAN Campaign' then 'CAN TripAdvisor Program'
          when ${campaign} = 'SDT: 004676_01 FY20 TripAdvisor US Campaign' then 'US TripAdvisor Program'
          when ${campaign} = 'SDT FY19 TripAdvisor Program- US' then 'US TripAdvisor Program'
          when ${campaign} = 'SDT: 004676_01 FY20 TripAdvisor UK Campaign' then 'UK TripAdvisor Program'
          when ${campaign} = 'SDT FY19 TripAdvisor Program- UK' then 'UK TripAdvisor Program'

          when ${campaign} ilike 'SDT: FY21 Local Market Recovery%' then 'Locals Recovery'

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
          when ${campaign} = 'SDT: FY21 Spring Awareness - 005867_01' then 'Spring Awareness'

          when ${campaign} ilike 'SDT: FY21 Pull-Through%' then 'US Pull-Through'
          when ${campaign} ilike 'SDT: FY21 Always On Recovery - 005402_01' then 'Always On Content'


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

          when ${campaign} ilike 'SDT: FY21 Local Market Recovery%' then 'United States'
          when ${campaign} ilike 'SDT: FY21 Pull-Through%' then 'United States'
          when ${campaign} ilike 'SDT: FY21 Drive Market Recovery%' then 'United States'
          when ${campaign} ilike 'SDT: FY21 Always On Recovery - 005402_01' then 'United States'
          when ${campaign} = 'SDT: FY21 Spring Awareness - 005867_01' then 'United States'

            ELSE 'Uncategorized'
        END;;
    }

    dimension: sdt_region {
      type: string
      group_label: "Client Dimensions"
      label: "Region"
      sql:
        case
          when ${placement} ilike 'ABC_SDTAFY21_SpringAwareness_In Market Travel_California_Video' then 'California'
          when ${placement} ilike 'ABC_SDTAFY21_SpringAwareness_In Market Travel_Arizona_Video' then 'Arizona'

          when ${placement} ilike 'VIACOM_SDTAFY21_SpringAwareness_Variety Seeker_%_California_Video' then 'California'
          when ${placement} ilike 'VIACOM_SDTAFY21_SpringAwareness_Variety Seeker_%_Arizona_Video' then 'Arizona'
          when ${placement} ilike 'CBS_SDTAFY21_SpringAwareness_Variety Seeker_%_California_Video' then 'California'
          when ${placement} ilike 'CBS_SDTAFY21_SpringAwareness_Variety Seeker_%_Arizona_Video' then 'Arizona'

          when ${placement} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_Variety Seeker_Arizona_%' then 'Arizona'
          when ${placement} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_Spire_California_%' then 'California'
          when ${placement} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_Spire_Arizona_%' then 'Arizona'
          when ${placement} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_SELF Native Article_National_%' then 'National'
          when ${placement} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_Run of CN Portfolio_National_%' then 'National'

          when ${placement} ilike 'HULU_SDTAFY21_SpringAwareness_%_California_Video' then 'California'
          when ${placement} ilike 'HULU_SDTAFY21_SpringAwareness_%_Arizona_Video' then 'Arizona'

          when ${placement} ilike 'NBC_SDTAFY21_SpringAwareness_%_California_Video' then 'California'
          when ${placement} ilike 'NBC_SDTAFY21_SpringAwareness_%_Arizona_Video' then 'Arizona'

          when ${placement} ilike 'PANDORA_SDTAFY21_SpringAwareness_%_California_%' then 'California'
          when ${placement} ilike 'PANDORA_SDTAFY21_SpringAwareness_%_Arizona%' then 'Arizona'

          when ${placement} ilike 'SEESOURCE_SDTAFY21_Spring Awareness_%_California_%' then 'California'
          when ${placement} ilike 'SEESOURCE_SDTAFY21_Spring Awareness_%_Arizona%' then 'Arizona'

          when ${placement} ilike 'SPOTIFY_SDTAFY21_SpringAwareness_%_California_%' then 'California'
          when ${placement} ilike 'SPOTIFY_SDTAFY21_SpringAwareness_%_Arizona%' then 'Arizona'

          when ${placement} ilike 'THEHELM_SDTAFY21_SpringAwareness_Variety Seeker_California_%' then 'California'
          when ${placement} ilike 'THEHELM_SDTAFY21_SpringAwareness_Variety Seeker_Arizona%' then 'Arizona'

          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_%_%_California_%' then 'California'
          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_%_%_Arizona%' then 'Arizona'
          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_%_%_WesternRegion%' then 'Western Region'
          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Destination Sponsorship_%' then 'National'

          when ${placement_id} = '294443196' then 'Western Region'
          when ${placement_id} = '294365546' then 'Western Region'
          when ${placement_id} = '294445794' then 'Western Region'
          when ${placement_id} = '294365549' then 'Western Region'
          when ${placement_id} = '294431151' then 'Western Region'
          when ${placement_id} = '294429480' then 'Western Region'
          when ${placement_id} = '294431706' then 'Western Region'
          when ${placement_id} = '294428358' then 'Western Region'
          when ${placement_id} = '294433665' then 'Western Region'
          when ${placement_id} = '294362114' then 'Western Region'
          when ${placement_id} = '294543559' then 'Western Region'
          when ${placement_id} = '294362117' then 'Western Region'

          when ${placement_id} = '294453867' then 'Arizona'
          when ${placement_id} = '294560269' then 'Arizona'
          when ${placement_id} = '294555193' then 'Arizona'
          when ${placement_id} = '294445980' then 'Arizona'

          when ${placement_id} = '294453852' then 'California'
          when ${placement_id} = '294555163' then 'California'
          when ${placement_id} = '294454155' then 'California'
          when ${placement_id} = '294445962' then 'California'

          when ${placement_id} = '294555235' then 'California/Arizona'
          when ${placement_id} = '294456816' then 'California/Arizona'
          when ${placement_id} = '294561349' then 'California/Arizona'
          when ${placement_id} = '294456819' then 'California/Arizona'
          when ${placement_id} = '294453312' then 'California/Arizona'
          when ${placement_id} = '294450195' then 'California/Arizona'
          when ${placement_id} = '294560329' then 'California/Arizona'
          when ${placement_id} = '294449715' then 'California/Arizona'

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

          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROS_WesternRegion%' then 'Western Region'
          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROS_California%' then 'California'
          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROS_Arizona%' then 'Arizona'
          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROVE_Arizona%' then 'Arizona'

          when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_WesternRegion%' then 'Western Region'
          when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_California%' then 'California'
          when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_Arizona%' then 'Arizona'

          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Center Top_WesternRegion%' then 'Western Region'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Results Right_WesternRegion%' then 'Western Region'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_EBP_WesternRegion%' then 'Western Region'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_EBP_Hotels+Vacation Packages_WesternRegion%' then 'Western Region'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Hotels.com_ROS_WesternRegion%' then 'Western Region'

          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_EBP_Hotels+Vacation Packages Center Top_WesternRegion%' then 'Western Region'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_EBP_Homepage Center Top_WesternRegion%' then 'Western Region'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_EBP_Homepage Center Top_California%' then 'California'

          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Center Top_California%' then 'California'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Center Top_Arizona%' then 'Arizona'

          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Tiles_California%' then 'California'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Tiles_Arizona%' then 'Arizona'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Native Marquee+Carousel_Arizona%' then 'Arizona'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Native Marquee+Carousel_California%' then 'California'


          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_Intent_ActiveTravelPlannersUS_WesternRegion%' then 'Western Region'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_Intent_ActiveTravelPlannersUS_California%' then 'California'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_Intent_ActiveTravelPlannersUS_Arizona%' then 'Arizona'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerUS_California%' then 'California'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerUS_CA,AZ%' then 'California/Arizona'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerUS_Arizona%' then 'Arizona'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerSD_WesternRegion%' then 'Western Region'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerSD_WesternRegion%' then 'Western Region'

          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerSD_WesternRegion%' then 'Western Region'

          when ${placement} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery_Awareness_Variety Seeker_California%' then 'California'
          when ${placement} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery_Awareness_Family Variety Seeker_California%' then 'California'

          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_US_AV%' then 'National'

          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_Tucson%' then 'Tucson'
          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_Phoenix%' then 'Phoenix'
          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_Las Vegas%' then 'Las Vegas'
          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_California%' then 'California'

          when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_PHX,TUC%' then 'Phoenix/Tucson'
          when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_LA%' then 'Los Angeles'
          when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_CA%' then 'California'

          when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_PHX,TUC%' then 'Phoenix/Tucson'
          when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_LA%' then 'Los Angeles'
          when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_CA%' then 'California'

          when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery%' then 'Combined (CA/AZ)'

          when ${placement} ilike '%Phoenix+Tucson%' then 'Phoenix/Tucson'
          when ${placement} ilike '%PHX+Tucson%' then 'Phoenix/Tucson'
          when ${placement} ilike '%All Markets_AV_Display%' then 'National'
          when ${placement} ilike '%CA/PHX/Tucson%' then 'California/Arizona'
          when ${placement} ilike '%Tucson%' then 'Tucson'
          when ${placement} ilike '%WesternRegion%' then 'Western Region'
          when ${placement} ilike '%PHX_Audio Everywhere%' then 'Phoenix'
          when ${placement} ilike '%PHX_Video Sponsored Session%' then 'Phoenix'
          when ${placement} ilike '%California_Video Sponsored Session%' then 'California'
          when ${placement} ilike '%Phoenix_AudioXP%' then 'Phoenix'
          when ${placement} ilike '%Phoenix_AudioXP%' then 'Phoenix'
          when ${placement} ilike '%California_AudioXP%' then 'California'
          when ${placement} ilike '%California_Audio Everywhere%' then 'California'
          when ${placement} ilike '%California_Travel Intender%' then 'California'
          when ${placement} ilike '%Arizona_Travel Intender%' then 'Arizona'
          when ${placement} ilike '%Phoenix_OLV' then 'Phoenix'
          when ${placement} ilike '%Phoenix_OTT' then 'Phoenix'
          when ${placement} ilike '%Phoenix_Midroll%' then 'Phoenix'
          when ${placement} ilike '%In Market For Travel_Phoenix%' then 'Phoenix'
          when ${placement} ilike '%California_Midroll%' then 'California'
          when ${placement} ilike '%California_OLV' then 'California'
          when ${placement} ilike '%California_OTT' then 'California'
          when ${placement} ilike '%Fall Season_Variety Seekers_Phoenix' then 'Phoenix'
          when ${placement} ilike '%Fall Season_Variety Seekers_California' then 'California'
          when ${placement} ilike '%California_MobileWelcomeInterstitial%' then 'California'
          when ${placement} ilike '%_CA_Video%' then 'California'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_HHIValueTarget_California%' then 'California'

          when ${placement} ilike '%CBS_SDTAFY21_FallDriveMarketRecovery_Awareness_Fall Season_Family Variety Seekers_California%' then 'California'
          when ${placement} ilike '%CBS_SDTAFY21_FallDriveMarketRecovery_Awareness_Fall Season_Family Variety Seekers_Phoenix%' then 'Phoenix'
          when ${placement} ilike '%CBS_SDTAFY21_FallDriveMarketRecovery_Awareness_Fall Season_Family Variety Seekers_Tucson%' then 'Tucson'

          when ${placement} ilike '%CBS_SDTAFY21_FallDriveMarketRecovery_Awareness_Fall Season_Variety Seekers_California%' then 'California'
          when ${placement} ilike '%CBS_SDTAFY21_FallDriveMarketRecovery_Awareness_Fall Season_Variety Seekers_Phoenix%' then 'Phoenix'
          when ${placement} ilike '%CBS_SDTAFY21_FallDriveMarketRecovery_Awareness_Fall Season_Variety Seekers_Tucson%' then 'Tucson'

          when ${placement} ilike 'PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_All Markets_Phase 2 Family_AV_Display' then 'National'

          when ${placement} ilike 'HULU_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_1P: Parent Watchers_Phoenix_Video_1920x1080_Behavioral' then 'Phoenix'

          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_TravelIntent_California_Display%' then 'California'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_TravelIntent_Arizona_Display%' then 'Arizona'

          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerUS_California,Arizona%' then 'California/Arizona'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerUS_Arizona_Display%' then 'Arizona'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerUS_California_Display%' then 'California'

          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_Arizona_Display%' then 'Arizona'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_California_Display%' then 'California'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_California,Arizona_Display%' then 'California/Arizona'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_California,Arizona_RTGDisplay%' then 'California/Arizona'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_California,Arizona_AVDisplay%' then 'California/Arizona'


          when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_SDIntenders_National%' then 'National'
          when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_SDIntenders_California%' then 'California'
          when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_SDIntenders_Arizona%' then 'Arizona'

          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Rove_ActiveTravelPlanning_California%' then 'California'
          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Rove_ActiveTravelPlanning_Arizona%' then 'Arizona'
          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Onsite_ActiveTravelPlanning_California%' then 'California'
          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Onsite_ActiveTravelPlanning_Arizona%' then 'Arizona'

          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Arizona%' then 'Arizona'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_California%' then 'California'

          when ${placement_id} = '294443289' then 'Western Region'
          when ${placement_id} = '294443271' then 'Western Region'
          when ${placement_id} = '294445860' then 'Western Region'

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
        when ${placement} ilike 'ABC_SDTAFY21_SpringAwareness_In Market Travel_%_Video' then 'ABC :30 Video'
        when ${placement} ilike 'VIACOM_SDTAFY21_SpringAwareness_Variety Seeker_Entertainment and Youth_%_Video' then 'Viacom :30 Video (Entertainment & Youth)'
        when ${placement} ilike 'CBS_SDTAFY21_SpringAwareness_Variety Seeker_Custom Show List_%_Video' then 'CBS :30 Video (Custom Show List)'
        when ${placement} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_Variety Seeker_%_Certified Pre-Roll Video' then 'Certified Pre-Roll Video'

        when ${placement} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_Spire_%_High Impact Crown%' then 'High Impact Crown Display Package'
        when ${placement} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_SELF Native Article_National_Display%' then 'SELF Native Article Display'
        when ${placement} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_Run of CN Portfolio_National_AVDisplay_%' then 'AV - Run of CN Portfolio Display'

        when ${placement} ilike 'HULU_SDTAFY21_SpringAwareness_In Market Travel_%_Video%' then 'Hulu :30 Video - In Market Travel'
        when ${placement} ilike 'HULU_SDTAFY21_SpringAwareness_Affluent Travelers_%_Video%' then 'Hulu :30 Video - Affluent Travelers'

        when ${placement} ilike 'NBC_SDTAFY21_SpringAwareness_Travel Interest_%_Video%' then 'NBC Midroll :30 Video - Travel Interest'
        when ${placement} ilike 'NBC_SDTAFY21_SpringAwareness_A25-54_%_Video%' then 'NBC Midroll :30 Video - A25-54'

        when ${placement} ilike 'PANDORA_SDTAFY21_SpringAwareness_Variety Seeker_%_Audio XP' then 'Pandora :30 Audio + Display'
        when ${placement} ilike 'PANDORA_SDTAFY21_SpringAwareness_Variety Seeker_%_Display_Mobile Welcome Interstitial' then 'Pandora Mobile Welcome Interstitial'
        when ${placement} ilike 'PANDORA_SDTAFY21_SpringAwareness_Variety Seeker_%_Video_Mobile Video Plus' then 'Pandora Mobile Video Plus'

        when ${placement} ilike 'SEESOURCE_SDTAFY21_Spring Awareness_Variety Seeker_%_Display_%' then 'See Source Display'

        when ${placement} ilike 'SPOTIFY_SDTAFY21_SpringAwareness_Real Time Playlist_%_Audio Everywhere%' then 'Spotify :30 Audio - Real Time Playlist'
        when ${placement} ilike 'SPOTIFY_SDTAFY21_SpringAwareness_Luxury Travelers_%_Audio Everywhere%' then 'Spotify :30 Audio - Luxury Travelers'
        when ${placement} ilike 'SPOTIFY_SDTAFY21_SpringAwareness_Real Time Playlist_%_Mobile Sponsored Sessions' then 'Spotify Sponsored Video Session - Real Time Playlist'
        when ${placement} ilike 'SPOTIFY_SDTAFY21_SpringAwareness_Luxury Travelers_%_Mobile Sponsored Sessions' then 'Spotify Sponsored Video Session - Luxury Travelers'

        when ${placement} ilike 'THEHELM_SDTAFY21_SpringAwareness_Variety Seeker_%_Video_OTT: SFV' then 'OTT :30 Video: SFV'
        when ${placement} ilike 'THEHELM_SDTAFY21_SpringAwareness_Variety Seeker_%_Video_OTT: LFV/FEP/LTV' then 'OTT :30 Video: LFV/FEP/LTV'
        when ${placement} ilike 'THEHELM_SDTAFY21_SpringAwareness_Variety Seeker_%_Video_OLV' then 'OLV :30 Video'

        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_ROVE_Variety Seeker_%_RTG%' then 'TripAdvisor ROVE Display (Variety Seeker) - Retargeting'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Variety Seeker_%_Display%' then 'TripAdvisor Onsite Display (Variety Seeker)'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Variety Seeker_%_Native%' then 'TripAdvisor Onsite Display (Variety Seeker)'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Competitive Destination_%_Display%' then 'TripAdvisor Onsite Display (Competitive Destination)'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Competitive Destination_%_Native%' then 'TripAdvisor Onsite Display (Competitive Destination)'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Variety Seeker_%_Horizon%' then 'TripAdvisor Horizon High Impact Display (Variety Seeker)'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Destination Sponsorship%' then 'TripAdvisor Destination Sponsorship Display'

        when ${ad_id} = '471612518' then 'Nano Native Traffic'

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

        when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerSD_WesternRegion_AVDisplay%' then 'AV - Display Prospecting'
        when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerSD_WesternRegion_Display%' then 'Display Prospecting'
        when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerSD_WesternRegion_RTGDisplay%' then 'Display Retargeting'
        when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_Intent_ActiveTravelPlannersUS_California_RTGDisplay%' then 'Display Retargeting'
        when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_Intent_ActiveTravelPlannersUS_Arizona_RTGDisplay%' then 'Display Retargeting'

        when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerUS_Arizona_Display%' then 'Display Prospecting'
        when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_Intent_ActiveTravelPlannersUS_Arizona_Display%' then 'Display Prospecting'
        when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerUS_CA,AZ_AVDisplay%' then 'AV - Display Prospecting'
        when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_Intent_ActiveTravelPlannersUS_Arizona_AVDisplay%' then 'AV - Display Prospecting'
        when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_Intent_ActiveTravelPlannersUS_California_AVDisplay%' then 'AV - Display Prospecting'
        when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_Intent_ActiveTravelPlannersUS_WesternRegion_AVDisplay%' then 'AV - Display Prospecting'
        when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerUS_CA,AZ_RTGDisplay%' then 'Display Retargeting'

        when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerUS_California_Display%' then 'Display Prospecting'
        when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerSD_WesternRegion_Display%' then 'Display Prospecting'
        when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_In-marketLeisureTravelerSD_WesternRegion_RTGDisplay%' then 'Display Retargeting'

        when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_Intent_ActiveTravelPlannersUS_California_Display%' then 'Display Prospecting'
        when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_Intent_ActiveTravelPlannersUS_WesternRegion_Display%' then 'Display Prospecting'
        when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_Intent_ActiveTravelPlannersUS_WesternRegion_RTGDisplay%' then 'Display Retargeting'

        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROS_Arizona_Travel Intender_OnSiteDisplay_Native' then 'TripAdvisor OnSite Native Display'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROS_California_Travel Intender_OnSiteDisplay_Native' then 'TripAdvisor OnSite Native Display'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROS_WesternRegion_Travel Intender_OnSiteDisplay_Native' then 'TripAdvisor OnSite Native Display'

        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROS_Arizona_Travel Intender_OnSiteDisplay%' then 'TripAdvisor OnSite Display'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROS_California_Travel Intender_OnSiteDisplay%' then 'TripAdvisor OnSite Display'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROS_WesternRegion_Travel Intender_OnSiteDisplay%' then 'TripAdvisor OnSite Display'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROS_WesternRegion_Travel Intender_OffSiteDisplay%' then 'TripAdvisor OffSite Display'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROS_Arizona_Travel Intender_OffSiteDisplay%' then 'TripAdvisor OffSite Display'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROVE_Arizona_Travel Intender_OffSiteDisplay_Native%' then 'TripAdvisor ROVE OffSite Native Display'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROVE_Arizona_Travel Intender_OffSiteDisplay%' then 'TripAdvisor ROVE OffSite Display'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROVE_WesternRegion_Travel Intender_OffSiteDisplay%' then 'TripAdvisor ROVE OffSite Display'
        when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Intent_ROVE_California_Travel Intender_OffSiteDisplay%' then 'TripAdvisor ROVE OffSite Display'

        when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_WesternRegion_SD Intenders+Not Booked_OnSiteDisplay%' then 'Priceline OnSite Display'
        when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_WesternRegion_SD Intenders+Not Booked_EmailDisplay%' then 'Priceline Email Display'
        when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_California_Active Travel Intenders+Not Booked_OnSiteDisplay%' then 'Priceline OnSite Display'
        when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_California_Active Travel Intenders+Not Booked_EmailDisplay%' then 'Priceline Email Display'
        when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_Arizona_Active Travel Intenders+Not Booked_OnSiteDisplay%' then 'Priceline OnSite Display'
        when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_Arizona_Active Travel Intenders+Not Booked_EmailDisplay%' then 'Priceline Email Display'

        when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_SDIntenders_%_ROS%' then 'Priceline ROS Display'
        when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_SDIntenders_%_Native Search Results%' then 'Priceline Search Results Native Display'
        when ${placement} ilike 'PRICELINE_SDTAFY21_PullThrough_SDIntenders_%_Email Marquee%' then 'Priceline Email Marquee Display'

        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Hotels.com_ROS_WesternRegion_SD Intenders_ResponsiveDisplay%' then 'Hotels.com ROS Responsive - SD Intenders'
        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Hotels.com_ROS_WesternRegion_SD Intenders_Display%' then 'Hotels.com ROS - SD Intenders'
        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Tiles_California_Travel Intenders_Display%' then 'Expedia ROS Search Tiles - Travel Intenders'
        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Tiles_Arizona_Travel Intenders_Display%' then 'Expedia ROS Search Tiles - Travel Intenders'

        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_EBP_Premium Hotels Bundle_WesternRegion_SD Intenders%' then 'EBP Premium Hotels Bundle - SD Intenders'
        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_EBP_Homepage Center Top_Arizona_Travel Intenders%' then 'EBP Homepage Center Top - Travel Intenders'
        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_EBP_Premium Hotels Bundle%' then 'EBP Premium Hotels Bundle Display'

        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Center Top_WesternRegion_SD Intenders_Display%' then 'Expedia ROS Search Center Top - SD Intenders'
        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Center Top_California_Travel Intenders_Display%' then 'Expedia ROS Search Center Top - Travel Intenders'
        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Center Top_Arizona_Travel Intenders_Display%' then 'Expedia ROS Search Center Top - Travel Intenders'

        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Native Marquee+Carousel_California_Travel Intenders_Display%' then 'Expedia ROS Search Native Marquee+Carousel - Travel Intenders'
        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Search Native Marquee+Carousel_Arizona_Travel Intenders_Display%' then 'Expedia ROS Search Native Marquee+Carousel - Travel Intenders'

        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_Expedia_ROS Results Right_WesternRegion_SD Intenders_Display%' then 'Expedia ROS Results Right - SD Intenders'

        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_EBP_WesternRegion_SD Intenders_Display%' then 'EBP Display - SD Intenders'

        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_EBP_Hotels+Vacation Packages_WesternRegion_SD Intenders_Display%' then 'EBP Hotels+Vacation Packages Display - SD Intenders'
        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_EBP_Hotels+Vacation Packages Center Top_WesternRegion_SD Intenders_Display%' then 'EBP Hotels+Vacation Packages Center Top - SD Intenders'

        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_EBP_Homepage Center Top_WesternRegion_SD Intenders_Display%' then 'EBP Homepage Center Top - SD Intenders'
        when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_Intent_EBP_Homepage Center Top_California_Travel Intenders_Display%' then 'EBP Homepage Center Top - Travel Intenders'


        when ${ad} ilike 'VDX Tracker-VDX_FY20 UK Digital_Reach/Storytelling_SD Custom Audience_UK_VDX In-Frame Rectangle%' then 'In-Frame High Impact Video Banners - Rectangle'
        when ${ad} ilike 'VDX Tracker-VDX_FY20 UK Digital_Reach/Storytelling_SD Custom Audience_UK_VDX In-Frame Halfpage%' then 'In-Frame High Impact Video Banners - Halfpage'
        when ${ad} ilike 'VDX Tracker-VDX_FY20 UK Digital_Reach/Storytelling_SD Custom Audience_UK_VDX In-Frame Billboard%' then 'In-Frame High Impact Video Banners - Billboard'

        when ${ad} ilike 'VDX Tracker-VDX_FY20 UK Digital_Reach/Storytelling_SD Custom Audience_UK_VDX Expandable Rectangle%' then 'Expandable High Impact Video Banners - Rectangle'
        when ${ad} ilike 'VDX Tracker-VDX_FY20 UK Digital_Reach/Storytelling_SD Custom Audience_UK_VDX Expandable Halfpage%' then 'Expandable High Impact Video Banners - Halfpage'
        when ${ad} ilike 'VDX Tracker-VDX_FY20 UK Digital_Reach/Storytelling_SD Custom Audience_UK_VDX Expandable Billboard%' then 'Expandable High Impact Video Banners - Billboard'

        when ${ad} ilike 'VDX Tracker-VDX_FY20 UK Digital_Reach/Storytelling_SD Custom Audience_UK_VDX InStream%' then 'InStream High Impact Video Banners'

        when ${ad} ilike 'SDUT_SDTAFY21_RecoveryLocals_Awareness_HPTODisplay%' then 'Homepage Takeover Display'

        when ${ad} ilike 'SDUT_SDTAFY21_RecoveryLocals_Awareness_ROSDisplay%' then 'ROS Display'

        when ${ad} ilike '%Halo_Mobile_1x1%' then 'High Impact Halo Unit (Mobile)'
        when ${ad} ilike '%Halo_Desktop_1x1%' then 'High Impact Halo Unit (Desktop)'

        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_PHX,TUC_NativeVideo_Outdoor' then 'Macro Native Video - Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_PHX,TUC_NativeVideo_Neighborhood' then 'Macro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_PHX,TUC_NativeVideo_Family' then 'Macro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_PHX,TUC_NativeVideo_Culinary' then 'Macro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_PHX,TUC_NativeVideo_Attractions' then 'Macro Native Video - Non-Outdoor'

        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_PHX,TUC_NativeVideo_Outdoor' then 'Micro Native Video - Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_PHX,TUC_NativeVideo_Neighborhood' then 'Micro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_PHX,TUC_NativeVideo_Family' then 'Micro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_PHX,TUC_NativeVideo_Culinary' then 'Micro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_PHX,TUC_NativeVideo_Attractions' then 'Micro Native Video - Non-Outdoor'

        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_LA_NativeVideo_Outdoor' then 'Macro Native Video - Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_LA_NativeVideo_Neighborhood' then 'Macro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_LA_NativeVideo_Family' then 'Macro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_LA_NativeVideo_Culinary' then 'Macro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_LA_NativeVideo_Attractions' then 'Macro Native Video - Non-Outdoor'

        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_LA_NativeVideo_Outdoor' then 'Micro Native Video - Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_LA_NativeVideo_Neighborhood' then 'Micro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_LA_NativeVideo_Family' then 'Micro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_LA_NativeVideo_Culinary' then 'Micro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_LA_NativeVideo_Attractions' then 'Micro Native Video - Non-Outdoor'

        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_CA_NativeVideo_Outdoor' then 'Macro Native Video - Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_CA_NativeVideo_Neighborhood' then 'Macro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_CA_NativeVideo_Family' then 'Macro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_CA_NativeVideo_Culinary' then 'Macro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_CA_NativeVideo_Attractions' then 'Macro Native Video - Non-Outdoor'

        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_CA_NativeVideo_Outdoor' then 'Micro Native Video - Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_CA_NativeVideo_Neighborhood' then 'Micro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_CA_NativeVideo_Family' then 'Micro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_CA_NativeVideo_Culinary' then 'Micro Native Video - Non-Outdoor'
        when ${placement} ilike 'STACKADAPT_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_CA_NativeVideo_Attractions' then 'Micro Native Video - Non-Outdoor'

        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Outdoor_' then 'Macro Native Traffic - Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Neighborhood' then 'Macro Native Traffic - Non-Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Family' then 'Macro Native Traffic - Non-Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Culinary' then 'Macro Native Traffic - Non-Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Attractions' then 'Macro Native Traffic - Non-Outdoor'

        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Outdoor' then 'Micro Native Traffic - Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Neighborhood' then 'Micro Native Traffic - Non-Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Family' then 'Micro Native Traffic - Non-Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Culinary' then 'Micro Native Traffic - Non-Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Attractions' then 'Micro Native Traffic - Non-Outdoor'

        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Nano_RetargetMicro_NativePromo' then 'Nano Native Traffic - Native Promo'

        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Outdoor_IMPRESSION TRACKER' then 'Macro Native Traffic - Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Neighborhood__IMPRESSION TRACKER' then 'Macro Native Traffic - Non-Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Family_IMPRESSION TRACKER' then 'Macro Native Traffic - Non-Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Culinary_IMPRESSION TRACKER' then 'Macro Native Traffic - Non-Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Attractions_IMPRESSION TRACKER' then 'Macro Native Traffic - Non-Outdoor'

        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Outdoor_IMPRESSION TRACKER' then 'Macro Native Traffic - Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Neighborhood_IMPRESSION TRACKER' then 'Macro Native Traffic - Non-Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Family_IMPRESSION TRACKER' then 'Macro Native Traffic - Non-Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Culinary_IMPRESSION TRACKER' then 'Macro Native Traffic - Non-Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Attractions_IMPRESSION TRACKER' then 'Macro Native Traffic - Non-Outdoor'

        when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery_Awareness_RON Video_A25-54_Travelers_Tucson_OTT' then 'OTT :30 Video'
        when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery_Awareness_RON Video_A25-54_Travelers_Tucson_OLV' then 'OLV :30 Video'
        when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery_Awareness_RON Video_A25-54_Travelers_Families_Tucson_OTT' then 'OTT :30 Video'
        when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery_Awareness_RON Video_A25-54_Travelers_Families_Tucson_OLV' then 'OLV :30 Video'

        when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery_Awareness_RON Video_A25-54_Travelers_Phoenix_OTT' then 'OTT :30 Video'
        when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery_Awareness_RON Video_A25-54_Travelers_Phoenix_OLV' then 'OLV :30 Video'
        when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery_Awareness_RON Video_A25-54_Travelers_Families_Phoenix_OTT' then 'OTT :30 Video'
        when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery_Awareness_RON Video_A25-54_Travelers_Families_Phoenix_OLV' then 'OLV :30 Video'

        when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery_Awareness_RON Video_A25-54_Travelers_California_OTT' then 'OTT :30 Video'
        when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery_Awareness_RON Video_A25-54_Travelers_California_OLV' then 'OLV :30 Video'
        when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery_Awareness_RON Video_A25-54_Travelers_Families_California_OTT' then 'OTT :30 Video'
        when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery_Awareness_RON Video_A25-54_Travelers_Families_California_OLV' then 'OLV :30 Video'


          when ${ad} ilike '%Midroll_:30_Spot On%' then 'NBC Spot On Video - MidRoll'
          when ${ad} ilike '%Midroll_:30_FEP%' then 'NBC FEP Video - MidRoll'
          when ${placement} ilike 'HULU_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_CA/PHX/Tucson_Video_1920x1080_AV' then 'Hulu :30 Video Commercial - AV'
          when ${placement} ilike 'HULU_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_3P: In Market for Travel%' then 'Hulu :30 Video Commercial'
          when ${placement} ilike 'Hulu_SDTAFY21_FallDriveMarketRecovery_Awareness%' then 'Hulu :30 Video Commercial'
          when ${placement} ilike 'ABC_SDTAFY21_FallDriveMarketRecovery_Awareness%' then 'ABC :30 Video'
          when ${placement} ilike 'CBS_SDTAFY21_FallDriveMarketRecovery_Awareness%' then 'CBS :30 Video'

          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_California_High Impact_Desktop%' then 'High Impact Desktop Display'
          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_California_High Impact_Mobile%' then 'High Impact Mobile Display'
          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_California_RON%' then 'RON Display'

          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_Phoenix_High Impact_Desktop%' then 'High Impact Desktop Display'
          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_Phoenix_High Impact_Mobile%' then 'High Impact Mobile Display'
          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_Phoenix_RON%' then 'RON Display'

          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_Tucson_High Impact_Desktop%' then 'High Impact Desktop Display'
          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_Tucson_High Impact_Mobile%' then 'High Impact Mobile Display'
          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_Las Vegas_Phase 1_High Impact_Mobile%' then 'High Impact Mobile Display'
          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_Tucson_RON%' then 'RON Display'
          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_US_AV_RON%' then 'RON National Display - AV'

          when ${placement} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery_Awareness_Family Variety Seeker_California_RON%' then 'RON Display - Family Variety Seeker'
          when ${placement} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery_Awareness_Variety Seeker_California_RON%' then 'RON Display - Variety Seeker'

          when ${placement} ilike '%_MobileWelcomeInterstitial%' then 'Pandora Mobile Interstitial Display'
          when ${ad} ilike '%PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Leisure Travelers_California_Companion Banner%' then 'Pandora Audio Companion Banner'
          when ${ad} ilike '%PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Leisure Travelers_Tucson_Companion Banner%' then 'Pandora Audio Companion Banner'
          when ${ad} ilike '%PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Leisure Travelers_Phoenix_Companion Banner%' then 'Pandora Audio Companion Banner'

          when ${placement} ilike 'PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_All Markets_AV_Display' then 'Pandora AV Display'
          when ${placement} ilike 'PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_All Markets_Phase 2 Family_AV_Display' then 'Pandora AV Display'
          when ${placement} ilike '%_AudioXP%' then 'Pandora :30 Audio'

          when ${placement} ilike 'SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Kids/Family_TUCSON_Audio Everywhere' then 'Spotify :30 Audio'
          when ${placement} ilike 'SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Kids/Family_PHX_Audio Everywhere' then 'Spotify :30 Audio'
          when ${placement} ilike 'SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Kids/Family_CALIFORNIA_Audio Everywhere' then 'Spotify :30 Audio'

          when ${placement} ilike '%SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Road Trip/Travel_PHX_Audio Everywhere%' then 'Spotify :30 Audio'
          when ${placement} ilike '%SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Road Trip/Travel_TUCSON_Audio Everywhere%' then 'Spotify :30 Audio'
          when ${placement} ilike '%SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Road Trip/Travel_CALIFORNIA_Audio Everywhere%' then 'Spotify :30 Audio'

          when ${placement} ilike '%SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Road Trip/Travel_PHX_Video Sponsored Session%' then 'Spotify Video Sponsored Session'
          when ${placement} ilike '%SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Road Trip/Travel_TUCSON_Video Sponsored Session%' then 'Spotify Video Sponsored Session'
          when ${placement} ilike '%SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Road Trip/Travel_CALIFORNIA_Video Sponsored Session%' then 'Spotify Video Sponsored Session'

          when ${placement} ilike '%SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Kids/Family_PHX_Video Sponsored Session%' then 'Spotify Video Sponsored Session'
          when ${placement} ilike '%SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Kids/Family_TUCSON_Video Sponsored Session%' then 'Spotify Video Sponsored Session'
          when ${placement} ilike '%SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Kids/Family_CALIFORNIA_Video Sponsored Session%' then 'Spotify Video Sponsored Session'

          when ${placement} ilike '%Travel Intender_OnSiteDisplay%' then 'TripAdvisor OnSite Display'
          when ${placement} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery_Awareness_Variety Seeker_California_Portrait' then 'Portrait Display'

          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_HHIValueTarget_California_Display%' then 'Display Prospecting (HHI Value Target)'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_Intent_HHIValueTarget_California_AVDisplay%' then 'AV - Display Prospecting (HHI Value Target)'

          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_TravelIntent_%_Display%' then 'Travel Intent Display'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_SDTravelIntent_%_Display%' then 'Travel Intent Display'

          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerUS_%_RTGDisplay%' then 'Display Retargeting'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerUS_%_AVDisplay%' then 'AV Display'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerUS_%_Display%' then 'Display Prospecting'

          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_%_RTGDisplay%' then 'Display Retargeting'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_%_AVDisplay%' then 'AV Display'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_%_Display%' then 'Display Prospecting'

          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_%_RTGNative%' then 'Native Retargeting'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_%_AVNative%' then 'AV Native'
          when ${placement} ilike 'ADARA_SDTAFY21_PullThrough_In-marketLeisureTravelerSD_%_Native%' then 'Native Prospecting'

          when ${placement_id} = '294443196' then 'AV Display'
          when ${placement_id} = '294365546' then 'AV Display'
          when ${placement_id} = '294445794' then 'AV Display'
          when ${placement_id} = '294365549' then 'AV Display'

          when ${placement_id} = '294431151' then 'Display Prospecting'
          when ${placement_id} = '294429480' then 'Display Prospecting'
          when ${placement_id} = '294431706' then 'Display Prospecting'
          when ${placement_id} = '294428358' then 'Display Prospecting'

          when ${placement_id} = '294433665' then 'Display Retargeting'
          when ${placement_id} = '294362114' then 'Display Retargeting'
          when ${placement_id} = '294543559' then 'Display Retargeting'
          when ${placement_id} = '294362117' then 'Display Retargeting'
          when ${placement_id} = '294445860' then 'Native Retargeting'

          when ${placement_id} = '294453867' then 'Display Prospecting'
          when ${placement_id} = '294560269' then 'Display Prospecting'
          when ${placement_id} = '294555193' then 'Display Prospecting'
          when ${placement_id} = '294445980' then 'Display Prospecting'
          when ${placement_id} = '294443271' then 'Native Prospecting'

          when ${placement_id} = '294453852' then 'Display Prospecting'
          when ${placement_id} = '294555163' then 'Display Prospecting'
          when ${placement_id} = '294454155' then 'Display Prospecting'
          when ${placement_id} = '294445962' then 'Display Prospecting'

          when ${placement_id} = '294555235' then 'AV Display'
          when ${placement_id} = '294456816' then 'AV Display'
          when ${placement_id} = '294561349' then 'AV Display'
          when ${placement_id} = '294456819' then 'AV Display'
          when ${placement_id} = '294443289' then 'AV Native'

          when ${placement_id} = '294453312' then 'Display Retargeting'
          when ${placement_id} = '294450195' then 'Display Retargeting'
          when ${placement_id} = '294560329' then 'Display Retargeting'
          when ${placement_id} = '294449715' then 'Display Retargeting'

          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Rove_ActiveTravelPlanning_%_Display%' then 'TripAdvisor ROVE Display'
          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Onsite_ActiveTravelPlanning_%_Display%' then 'TripAdvisor Onsite Display'
          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Rove_ActiveTravelPlanning_%_Native%' then 'TripAdvisor ROVE Native'
          when ${placement} ilike 'TRIPADVISOR_SDTAFY21_PullThrough_Onsite_ActiveTravelPlanning_%_Native Boost%' then 'TripAdvisor Native Boost'

          when ${placement} ilike 'HOTELS.COM_SDTAFY21_PullThrough_%_ROS Responsive%' then 'Hotels.com ROS Responsive Display'
          when ${placement} ilike 'HOTELS.COM_SDTAFY21_PullThrough_%_ROS_%' then 'Hotels.com ROS Display'
          when ${placement} ilike 'HOTELS.COM_SDTAFY21_PullThrough_%_Hotels Results Listing%' then 'Hotels.com Destination Results Listing'

          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_%_ROS Search Native Marquee Card%' then 'Expedia.com Marquee Card'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_%_ROS Results Right%' then 'Expedia.com ROS Right Results'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_%_ROS Responsive%' then 'Expedia.com ROS Responsive Display'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_%_ROS_%' then 'Expedia.com ROS Display'

          when ${placement} ilike 'EXPEDIA BRANDS PORTFOLIO_SDTAFY21_PullThrough_%_EBP%' then 'Expedia Brands Portfolio Display'

          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_%_Hotels Results Right Middle Photo Gallery_1x1%' then 'Expedia.com Hotels Photo Gallery Display'
          when ${placement} ilike 'EXPEDIA_SDTAFY21_PullThrough_%_Hotels Infosite/Details Right Middle Photo Gallery_1x1%' then 'Expedia.com Hotels Infosite/Details Display'

        else 'Uncategorized'
      end;;
    }

    dimension: sdt_pillar {
      type: string
      group_label: "Client Dimensions"
      label: "Pillar"
      sql:
        case
          when ${ad_id} = '471612518' then 'N/A'
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

        when ${placement} ilike '%_Outdoor' then 'Outdoor'
        when ${placement} ilike '%_Outdoor_' then 'Outdoor'
        when ${placement} ilike '%_Neighborhood' then 'Neighborhood'
        when ${placement} ilike '%_Family' then 'Family'
        when ${placement} ilike '%_Culinary' then 'Culinary'
        when ${placement} ilike '%_Attractions' then 'Attractions'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Nano_RetargetMicro_NativePromo' then 'N/A'

        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Outdoor_IMPRESSION TRACKER' then 'Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Neighborhood__IMPRESSION TRACKER' then 'Neighborhood'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Family_IMPRESSION TRACKER' then 'Family'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Culinary_IMPRESSION TRACKER' then 'Culinary'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Attractions_IMPRESSION TRACKER' then 'Attractions'

        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Outdoor_IMPRESSION TRACKER' then 'Outdoor'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Neighborhood_IMPRESSION TRACKER' then 'Neighborhood'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Family_IMPRESSION TRACKER' then 'Family'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Culinary_IMPRESSION TRACKER' then 'Culinary'
        when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Attractions_IMPRESSION TRACKER' then 'Attractions'

            ELSE 'Uncategorized'
        END;;
    }

    dimension: creative_name {
      type: string
      group_label: "Client Dimensions"
      label: "Creative Name"
      sql:
        case
          when ${creative} = 'SDT_HICYB_Display_Sunset_PlanNow_970x250' then 'HICYB_Sunset_PlanNow_970x250'
          when ${creative} = 'SDT_HICYB_Display_Sunset_PlanNow_728x90' then 'HICYB_Sunset_PlanNow_728x90'
          when ${creative} = 'SDT_HICYB_Display_Sunset_PlanNow_320x50' then 'HICYB_Sunset_PlanNow_320x50'
          when ${creative} = 'SDT_HICYB_Display_Sunset_PlanNow_300x600' then 'HICYB_Sunset_PlanNow_300x600'
          when ${creative} = 'SDT_HICYB_Display_Sunset_PlanNow_300x250' then 'HICYB_Sunset_PlanNow_300x250'

          when ${ad} ilike 'ABC_SDTAFY21_SpringAwareness_In Market Travel_%_Video_HICYB_1x1' then 'Happiness is Calling You Back (:30)'
          when ${ad} ilike 'VIACOM_SDTAFY21_SpringAwareness_Variety Seeker_Entertainment and Youth_%_Video_HICYB_1x1' then 'Happiness is Calling You Back (:30)'
          when ${ad} ilike 'CBS_SDTAFY21_SpringAwareness_Variety Seeker_%_%_Video_HICYB_1x1' then 'Happiness is Calling You Back (:30)'
          when ${ad} ilike 'HULU_SDTAFY21_SpringAwareness_%_%_Video_HICYB_1x1' then 'Happiness is Calling You Back (:30)'
          when ${ad} ilike 'NBC_SDTAFY21_SpringAwareness_%_%_Video_%_HICYB_1x1' then 'Happiness is Calling You Back (:30)'
          when ${ad} ilike 'PANDORA_SDTAFY21_SpringAwareness_Variety Seeker_%_Video_HICYB_Mobile Video Plus_1x1' then 'Happiness is Calling You Back (:30)'
          when ${ad} ilike 'THEHELM_SDTAFY21_SpringAwareness_Variety Seeker_%_Video_%_1x1' then 'Happiness is Calling You Back (:30)'

          when ${ad} ilike 'PANDORA_SDTAFY21_SpringAwareness_Variety Seeker_%_Audio XP_HICYB_Audio_:30_1x1' then 'Pandora HICYB Audio (:30)'
          when ${ad} ilike 'PANDORA_SDTAFY21_SpringAwareness_Variety Seeker_%_Audio XP_WeekYay_Audio_:30_1x1' then 'Pandora WeekYay Audio (:30)'
          when ${ad} ilike 'PANDORA_SDTAFY21_SpringAwareness_Variety Seeker_%_Audio XP_WeekYay_Companion Banner_WY Hotel_300x250_1x1' then 'WeekYay_Hotel_300x250'
          when ${ad} ilike 'PANDORA_SDTAFY21_SpringAwareness_Variety Seeker_%_Display_HICYB_Mobile Welcome Interstitial_1x1' then 'HICYB Mobile Interstitial'

          when ${ad} ilike 'SEESOURCE_SDTAFY21_Spring Awareness_Variety Seeker_%_Display_160x600_Book Hotel_1x1' then 'BookHotel_160x600'
          when ${ad} ilike 'SEESOURCE_SDTAFY21_Spring Awareness_Variety Seeker_%_Display_300x250_Book Hotel_1x1' then 'BookHotel_300x250'
          when ${ad} ilike 'SEESOURCE_SDTAFY21_Spring Awareness_Variety Seeker_%_Display_300x600_Book Hotel_1x1' then 'BookHotel_300x600'
          when ${ad} ilike 'SEESOURCE_SDTAFY21_Spring Awareness_Variety Seeker_%_Display_728x90_Book Hotel_1x1' then 'BookHotel_728x90'

          when ${ad} ilike 'SEESOURCE_SDTAFY21_Spring Awareness_Variety Seeker_%_Display_160x600_Plan Now_1x1' then 'PlanNow_160x600'
          when ${ad} ilike 'SEESOURCE_SDTAFY21_Spring Awareness_Variety Seeker_%_Display_300x250_Plan Now_1x1' then 'PlanNow_300x250'
          when ${ad} ilike 'SEESOURCE_SDTAFY21_Spring Awareness_Variety Seeker_%_Display_300x600_Plan Now_1x1' then 'PlanNow_300x600'
          when ${ad} ilike 'SEESOURCE_SDTAFY21_Spring Awareness_Variety Seeker_%_Display_728x90_Plan Now_1x1' then 'PlanNow_728x90'

          when ${ad} ilike 'SPOTIFY_SDTAFY21_SpringAwareness_%_%_Audio Everywhere_WeekYay_Companion Banner_WY Hotel_640x640_1x1' then 'WeekYay_Hotel_640x640'
          when ${ad} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_Spire_%_High Impact Crown_HICYB_Plan Now_1x1' then 'HICYB_PlanNow_HIC'
          when ${ad} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_Spire_%_High Impact Crown_HICYB_Creative TBD_1x1' then 'HICYB_TBD_HIC'

          when ${ad} ilike 'CONDE NAST_SDTAFY21_SpringAwareness_Variety Seeker_%_Certified Pre-Roll Video_HICYB' then 'BB: Paragliding (:15)'

          when ${ad} ilike 'Tripadvisor Tracking Ad-TRIPADVISOR_SDTAFY21_SpringAwareness_%_%_%_Native_1x1' then 'TripAdvisor_Native'
          when ${ad} ilike 'Tripadvisor Tracking Ad-TRIPADVISOR_SDTAFY21_SpringAwareness_%_%_%_RTGNative_1x1' then 'TripAdvisor_RTG_Native'
          when ${ad} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Variety Seeker_%_Horizon_1x1' then 'TripAdvisor_Horizon'
          when ${ad} ilike 'TRIPADVISOR_SDTAFY21_SpringAwareness_Onsite_Destination Sponsorship_Horizon_1x1' then 'TripAdvisor_Destination Sponsorship'

          when ${ad_id} = '471612518' then 'Taboola Impression Tracker - Nano Content'
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

          when ${ad} ilike '%Torrey Pines Golf :60' then 'OBI: Torrey Pines Golf (:60)'
          when ${ad} ilike '%Coastal Yoga :60' then 'OBI: Coastal Yoga (:60)'
          when ${ad} ilike '%Coastal Yoga :15' then 'OBI: Coastal Yoga (:15)'
          when ${ad} ilike '%Boardwalk Cruising :60' then 'OBI: Boardwalk Cruising (:60)'
          when ${ad} ilike '%Boardwalk Cruising :15' then 'OBI: Boardwalk Cruising (:15)'
          when ${ad} ilike '%Tiki OBI :60' then 'OBI: Tiki (:60)'
          when ${ad} ilike '%Liberty Station OBI :60' then 'OBI: Liberty Station (:60)'
          when ${ad} ilike '%Barrio Logan G2GS :60' then 'G2GS: Barrio Logan (:60)'
          when ${ad} ilike '%Barrio Dogg Longform' then 'DH: Barrio Dogg Longform'
          when ${ad} ilike '%Animae Longform' then 'DH: Animae Longform'
          when ${ad} ilike '%USS Midway OBI :60' then 'OBI: USS Midway (:60)'
          when ${ad} ilike '%Stuart Collection OBI :60' then 'OBI: Stuart Collection (:60)'
          when ${ad} ilike '%Live Music G2GS :60' then 'G2GS: Live Music (:60)'

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

          when ${ad} ilike '%Video - Lookalike_Alana La Jolla%' then 'G2GS: La Jolla (:60)'
          when ${ad} ilike '%G2GS: La Jolla on the Water :60%' then 'G2GS: La Jolla (:60)'
          when ${ad} ilike '%G2GS: Barrio Logan :60%' then 'G2GS: Barrio Logan (:60)'
          when ${ad} ilike '%Video - Lookalike_Ron Machado%' then 'G2GS: Surfing San Diego (:60)'
          when ${ad} ilike '%G2GS Surfing :60%' then 'G2GS: Surfing San Diego (:60)'
          when ${ad} ilike '%Video - Lookalike_Aaron Picture Perfect%' then 'G2GS: Picture Perfect Spots (:60)'
          when ${ad} ilike '%Video - Lookalike_Alana Mission Bay%' then 'G2GS: Mission Bay (:60)'
          when ${ad} ilike '%G2GS Mission Bay :60%' then 'G2GS: Mission Bay (:60)'
          when ${ad} ilike '%Video - Lookalike_OBI: Old Town Mexican%' then 'OBI: Old Town Mexican (:60)'
          when ${ad} ilike '%Video - Lookalike_OBI: Coastal Yoga%' then 'OBI: Coastal Yoga (:60)'
          when ${ad} ilike '%Co-Branded TripAdvisor Outdoor Pillar Video :60' then 'Co-Branded TripAdvisor Outdoor Pillar Video (:60)'

          when ${ad} ilike '%Bliss Break: Yoga :15' then 'BB: Yoga (:15)'
          when ${ad} ilike '%Bliss Break: Paragliding :15' then 'BB: Paragliding (:15)'
          when ${ad} ilike '%Bliss Break: Paddle Board :15' then 'BB: Paddle Board (:15)'
          when ${ad} ilike '%Bliss Break: Coffee Cup Coastal :15' then 'BB: Coffee Cup Coastal (:15)'
          when ${ad} ilike '%Bliss Break: Beach For 2 :15' then 'BB: Beach For 2 (:15)'

          when ${ad} ilike '%OBI: Tortillas and Margs :60%' then 'OBI: Tortillas and Margs (:60)'
          when ${ad} ilike '%OBI: Tortillas and Margs :15%' then 'OBI: Tortillas and Margs (:15)'
          when ${ad} ilike '%OBI: Liberty Station :15%' then 'OBI: Liberty Station (:15)'
          when ${ad} ilike '%OBI: Liberty Station :60%' then 'OBI: Liberty Station (:60)'
          when ${ad} ilike '%OBI: Convoy Desserts :15%' then 'OBI: Convoy District Desserts (:15)'
          when ${ad} ilike '%OBI: Convoy Desserts :60%' then 'OBI: Convoy District Desserts (:60)'

          when ${ad} ilike '%Socks: Torrey Pines :60%' then 'Socks: Torrey Pines (:60)'
          when ${ad} ilike '%Socks: Torrey Pines :15%' then 'Socks: Torrey Pines (:15)'
          when ${ad} ilike '%Socks: Tidepooling :60%' then 'Socks: Tidepooling (:60)'
          when ${ad} ilike '%Socks: Tidepooling :15%' then 'Socks: Tidepooling (:15)'
          when ${ad} ilike '%Socks: Star of India :60%' then 'Socks: Star of India (:60)'
          when ${ad} ilike '%Socks: Star of India :15%' then 'Socks: Star of India (:15)'
          when ${ad} ilike '%Socks: SeaWorld :60%' then 'Socks: SeaWorld (:60)'
          when ${ad} ilike '%Socks: Safari Park :60%' then 'Socks: Safari Park (:60)'
          when ${ad} ilike '%Socks: LEGOLAND :60%' then 'Socks: LEGOLAND (:60)'

          when ${ad} ilike '%OBI: Safari Park :60%' then 'OBI: Safari Park (:60)'
          when ${ad} ilike '%OBI: Safari Park :15%' then 'OBI: Safari Park (:15)'
          when ${ad} ilike '%OBI: LEGO Submarine :60%' then 'OBI: LEGO Submarine (:60)'
          when ${ad} ilike '%OBI: LEGO Submarine :15%' then 'OBI: LEGO Submarine (:15)'
          when ${ad} ilike '%OBI: Learn to Surf :60%' then 'OBI: Learn to Surf (:60)'
          when ${ad} ilike '%OBI: Learn to Surf :15%' then 'OBI: Learn to Surf (:15)'
          when ${ad} ilike '%OBI: Birch Aquarium :60%' then 'OBI: Birch Aquarium (:60)'
          when ${ad} ilike '%OBI: Birch Aquarium :15%' then 'OBI: Birch Aquarium (:15)'

          when ${ad} ilike '%Dishing Happiness: Realm of the 52 Remedies :30%' then 'DH: Realm of the 52 Remedies (:30)'
          when ${ad} ilike '%Dishing Happiness: Realm of the 52 Remedies :15%' then 'DH: Realm of the 52 Remedies (:15)'

          when ${ad} ilike '%Dishing Happiness: Barrio Dogg :30%' then 'DH: Barrio Dogg (:30)'
          when ${ad} ilike '%Dishing Happiness: Barrio Dogg :15%' then 'DH: Barrio Dogg (:15)'
          when ${ad} ilike '%Dishing Happiness: Barrio Dogg LF%' then 'DH: Barrio Dogg (Longform)'

          when ${ad} ilike '%Dishing Happiness: Azucar :30%' then 'DH: Azucar (:30)'
          when ${ad} ilike '%Dishing Happiness: Azucar :15%' then 'DH: Azucar (:15)'

          when ${ad} ilike '%Dishing Happiness: Animae :30%' then 'DH: Animae (:30)'
          when ${ad} ilike '%Dishing Happiness: Animae :15%' then 'DH: Animae (:15)'

          when ${ad} ilike '%Dishing Happiness Mantra LF%' then 'DH: Mantra (Longform)'

          when ${ad} ilike '%TA: Balboa Park Culture :60%' then 'TripAdvisor: Balboa Park Culture (:60)'

          when ${ad} ilike '%OBI: USS Midway :60%' then 'OBI: USS Midway (:60)'
          when ${ad} ilike '%OBI: USS Midway :15%' then 'OBI: USS Midway (:15)'

          when ${ad} ilike '%OBI: Stuart Collection :60%' then 'OBI: Stuart Collection (:60)'
          when ${ad} ilike '%OBI: Stuart Collection :15%' then 'OBI: Stuart Collection (:15)'

          when ${ad} ilike '%OBI: Africa Rocks :60%' then 'OBI: Africa Rocks (:60)'
          when ${ad} ilike '%OBI: Africa Rocks :15%' then 'OBI: Africa Rocks (:15)'

          when ${ad} ilike '%TripAdvisor Culinary :60%' then 'TripAdvisor Culinary (:60)'

          when ${ad} ilike '%OBI: California Tower :60%' then 'OBI: California Tower (:60)'
          when ${ad} ilike '%OBI: California Tower :15%' then 'OBI: California Tower (:15)'

          when ${ad} ilike '%OBI: Torrey Pines Golf :60%' then 'OBI: Torrey Pines Golf (:60)'
          when ${ad} ilike '%OBI: Torrey Pines Golf :15%' then 'OBI: Torrey Pines Golf (:15)'
          when ${ad} ilike '%OBI Torrey Pines Golf :60%' then 'OBI: Torrey Pines Golf (:60)'
          when ${ad} ilike '%OBI Torrey Pines Golf :15%' then 'OBI: Torrey Pines Golf (:15)'
          when ${ad} ilike '%G2GS: Picture Perfect Spots :60%' then 'G2GS: Picture Perfect Spots (:60)'

          when ${ad} ilike '%Video - Contextual_Alana La Jolla%' then 'G2GS: La Jolla (:60)'
          when ${ad} ilike '%Video - Contextual_Rob Machado%' then 'G2GS: Surfing San Diego (:60)'
          when ${ad} ilike '%Video - Contextual_Aaron Picture Perfect%' then 'G2GS: Picture Perfect Spots (:60)'
          when ${ad} ilike '%Video - Contextual_Alana Mission Bay%' then 'G2GS: Mission Bay (:60)'
          when ${ad} ilike '%Video - Contextual_OBI: Old Town Mexican%' then 'OBI: Old Town Mexican (:60)'
          when ${ad} ilike '%Video - Contextual_OBI: Coastal Yoga%' then 'OBI: Coastal Yoga (:60)'

          when ${ad} ilike '%Video - Behavioral_Alana La Jolla%' then 'G2GS: La Jolla (:60)'
          when ${ad} ilike '%Video - Behavioral_Rob Machado%' then 'G2GS: Surfing San Diego (:60)'
          when ${ad} ilike '%Video - Behavioral_Aaron Picture Perfect%' then 'G2GS: Picture Perfect Spots (:60)'
          when ${ad} ilike '%Video - Behavioral_Alana Mission Bay%' then 'G2GS: Mission Bay (:60)'
          when ${ad} ilike '%Video - Behavioral_OBI: Old Town Mexican%' then 'OBI: Old Town Mexican (:60)'
          when ${ad} ilike '%Video - Behavioral_OBI: Coastal Yoga%' then 'OBI: Coastal Yoga (:60)'

          when ${ad} ilike '%Traffic - Behavioral_Sunsets%' then 'S7: Sunsets'
          when ${ad} ilike '%Traffic - Behavioral_Rooftop Restaurants%' then 'S7: Rooftop Restaurants'
          when ${ad} ilike '%Traffic - Behavioral_Make a splash%' then 'S7: 7 Ways to Make a Splash'
          when ${ad} ilike '%Traffic - Behavioral_BP Hidden Gems%' then 'S7: Balboa Park Hidden Gems'
          when ${ad} ilike '%Traffic - Behavioral_Boat Rides%' then 'S7: Boat Rides'
          when ${ad} ilike '%Traffic - Behavioral_Behind The Scenes%' then 'S7: Behind The Scenes Tours'

          when ${ad} ilike '%Traffic - Contextual_Sunsets%' then 'S7: Sunsets'
          when ${ad} ilike '%Traffic - Contextual_Rooftop Restaurants%' then 'S7: Rooftop Restaurants'
          when ${ad} ilike '%Traffic - Contextual_Make a splash%' then 'S7: 7 Ways to Make a Splash'
          when ${ad} ilike '%Traffic - Contextual_BP Hidden Gems%' then 'S7: Balboa Park Hidden Gems'
          when ${ad} ilike '%Traffic - Contextual_Boat Rides%' then 'S7: Boat Rides'
          when ${ad} ilike '%Traffic - Contextual_Behind The Scenes%' then 'S7: Behind The Scenes Tours'

          when ${ad} ilike '%Traffic - Lookalike_Sunsets%' then 'S7: Sunsets'
          when ${ad} ilike '%Traffic - Lookalike_Rooftop Restaurants%' then 'S7: Rooftop Restaurants'
          when ${ad} ilike '%Traffic - Lookalike_Make a splash%' then 'S7: 7 Ways to Make a Splash'
          when ${ad} ilike '%Traffic - Lookalike_Hidden Gems%' then 'S7: Balboa Park Hidden Gems'
          when ${ad} ilike '%Traffic - Lookalike_Boat Rides%' then 'S7: Boat Rides'
          when ${ad} ilike '%Traffic - Lookalike_Behind The Scenes%' then 'S7: Behind The Scenes Tours'

          when ${placement} ilike 'Global TV_Awareness/Reach_Companion Banner%' then 'Video Companion Banner'
          when ${placement_id} = '252937671' then 'Find Your Smile in San Diego (:30)'

          when ${placement} ilike 'Bell Media_Awareness/Reach_Custom Package%' then 'Find Your Smile in San Diego (:30)'
          when ${placement} ilike 'Bell Media_Awareness/Reach_TSN%' then 'Find Your Smile in San Diego (:30)'

          when ${placement} ilike 'Global TV_Awareness/Reach_Companion Banner%' then 'Video Companion Banner'
          when ${placement} ilike 'Global TV_Awareness/Reach_HGTV.ca%' then 'Find Your Smile in San Diego (:30)'
          when ${placement} ilike 'Global TV_Awareness/Reach_Food Network%' then 'Find Your Smile in San Diego (:30)'
          when ${placement} ilike 'Global TV_Awareness/Reach_GlobalTV.ca%' then 'Find Your Smile in San Diego (:30)'
          when ${placement} ilike 'Global TV_Awareness/Reach_Global Go%' then 'Find Your Smile in San Diego (:30)'

          when ${ad} ilike 'VDX Tracker-VDX_FY20 UK Digital_Reach/Storytelling_SD Custom Audience_UK_VDX Instream%' then 'Find Your Smile in San Diego (:30)'
          when ${ad} ilike 'VDX Tracker-VDX_FY20 UK Digital_Reach/Storytelling_SD Custom Audience_UK_VDX In-Frame%%' then 'Find Your Smile in San Diego (:30)'
          when ${ad} ilike 'VDX Tracker-VDX_FY20 UK Digital_Reach/Storytelling_SD Custom Audience_UK_VDX Expandable%%' then 'Find Your Smile in San Diego (:30)'

          when ${ad} ilike '%010620-033020_Neighborhoods%' then 'Neighborhoods'
          when ${ad} ilike '%010620-033020_Generic%' then 'Generic'
          when ${ad} ilike '%010620-033020_Coastal Happiness%' then 'Coastal Happiness'
          when ${ad} ilike '%010620-033020_5Days%' then '5 Days'

          when ${ad} ilike '%ROSdisplay_StayDiego_728x90%' then 'StayDiego_728x90'
          when ${ad} ilike '%ROSdisplay_StayDiego_300x250%' then 'StayDiego_300x250'
          when ${ad} ilike '%ROSdisplay_StayDiego_300x600%' then 'StayDiego_300x600'
          when ${ad} ilike '%ROSdisplay_StayDiego_970x90%' then 'StayDiego_970x90'

          when ${ad} ilike '%ROSdisplay_StayDiego_StayClose_320x50%' then 'StayClose_320x50'
          when ${ad} ilike '%Pushdown Skin_1x1%' then 'StayDiego_Pushdown'

          when ${ad} ilike '%ROSdisplay_StayDiego_CloseBy_320x50%' then 'CloseBy_320x50'

          when ${ad} ilike '%Rail_Beach_500x1100%' then 'Beach_500x1100'
          when ${ad} ilike '%Rail_BikePath_500x1100%' then 'BikePath_500x1100'

          when ${creative} ilike '%SDT_COVID-19_V1_300x250%' then 'PlanNow_300x250'
          when ${creative} ilike '%SDT_COVID-19_V1_728x90%' then 'PlanNow_728x90'
          when ${ad_id} = '476971125' then 'PlanNow_728x90'
          when ${creative} ilike '%SDT_COVID-19_V1_300x600%' then 'PlanNow_300x600'
          when ${creative} ilike '%SDT_COVID-19_V1_160x600%' then 'PlanNow_160x600'
          when ${creative} ilike '%SDT_COVID-19_V1_300x50%' then 'PlanNow_300x50'

          when ${creative} ilike '%SDT_COVID-19_V2_300x250%' then 'BookHotel_300x250'
          when ${creative} ilike '%SDT_COVID-19_V2_728x90%' then 'BookHotel_728x90'
          when ${creative} ilike '%SDT_HICYB_728x90_v2_STATIC%' then 'BookHotel_728x90'
          when ${creative} ilike '%SDT_COVID-19_V2_300x600%' then 'BookHotel_300x600'
          when ${creative} ilike '%SDT_COVID-19_V2_160x600%' then 'BookHotel_160x600'
          when ${creative} ilike '%SDT_HICYB_160x600_v2_STATIC%' then 'BookHotel_160x600'
          when ${creative} ilike '%SDT_COVID-19_V2_300x50%' then 'BookHotel_300x50'
          when ${creative} ilike '%SDT_HICYB_300x250_v2_STATIC%' then 'BookHotel_300x50'

          when ${creative} ilike '%Surfing_728x90%' then 'Surfing_728x90'
          when ${creative} ilike '%Sunset_728x90%' then 'Sunset_728x90'
          when ${creative} ilike '%Surfing_300x250%' then 'Surfing_300x250'
          when ${creative} ilike '%Surfing_300x600%' then 'Surfing_300x600'
          when ${creative} ilike '%Surfing_160x600%' then 'Surfing_160x600'
          when ${creative} ilike '%Surfing_970x90%' then 'Surfing_970x90'
          when ${creative} ilike '%Surfing_468x60%' then 'Surfing_468x60'
          when ${creative} ilike '%Surfing_300x50%' then 'Surfing_300x50'

          when ${creative} ilike '%Sunset_970x90%' then 'Sunset_970x90'
          when ${creative} ilike '%Sunset_468x60%' then 'Sunset_468x60'
          when ${creative} ilike '%Sunset_300x50%' then 'Sunset_300x50'
          when ${creative} ilike '%Sunset_160x600%' then 'Sunset_160x600'

          when ${creative} ilike '%Family_468x60%' then 'Family_468x60'
          when ${creative} ilike '%Family_300x50%' then 'Family_300x50'
          when ${creative} ilike '%Family_300x250%' then 'Family_300x250'
          when ${creative} ilike '%Family_160x600%' then 'Family_160x600'

          when ${creative} ilike 'WeekYay_Native' then 'WeekYay_Native'
          when ${creative} ilike 'HICYB_Native' then 'HICYB_Native'

          when ${ad} ilike '%Plan Now_300x250%' then 'PlanNow_300x250'
          when ${ad} ilike '%Plan Now_728x90' then 'PlanNow_728x90'
          when ${ad} ilike '%Plan Now_300x600' then 'PlanNow_300x600'
          when ${ad} ilike '%Plan Now_160x600' then 'PlanNow_160x600'
          when ${ad} ilike '%Plan Now_300x50' then 'PlanNow_300x50'
          when ${ad} ilike '%Plan Now_640x640%' then 'PlanNow_640x640'

          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_California_RON_Plan Now_300x600 ' then 'PlanNow_300x600'

          when ${ad} ilike '%Kids-Free_300x250%' then 'KidsFree_300x250'

          when ${ad} ilike '%Book Hotel_300x250%' then 'BookHotel_300x250'
          when ${ad} ilike '%Book Hotel_728x90' then 'BookHotel_728x90'
          when ${ad} ilike '%Book Hotel_300x600' then 'BookHotel_300x600'
          when ${ad} ilike '%Book Hotel_160x600' then 'BookHotel_160x600'
          when ${ad} ilike '%Book Hotel_300x50' then 'BookHotel_300x50'
          when ${ad} ilike '%Book Hotel_640x640%' then 'BookHotel_640x640'

          when ${placement} ilike '%Book Hotel_300x50' then 'BookHotel_300x50'
          when ${placement} ilike '%Book Hotel_300x250%' then 'BookHotel_300x250'
          when ${placement} ilike '%Book Hotel_728x90' then 'BookHotel_728x90'
          when ${placement} ilike '%Book Hotel_300x600' then 'BookHotel_300x600'
          when ${placement} ilike '%Book Hotel_160x600' then 'BookHotel_160x600'

          when ${creative} ilike '%HICYB_728x90_STATIC-5%' then 'HICYB_728x90 (Static Offer)'
          when ${creative} ilike '%HICYB_728x90_STATIC-4%' then 'HICYB_728x90 (Static 4)'
          when ${creative} ilike '%HICYB_728x90_STATIC-3%' then 'HICYB_728x90 (Static 3)'
          when ${creative} ilike '%HICYB_300x600_STATIC-5%' then 'HICYB_300x600 (Static Offer)'
          when ${creative} ilike '%HICYB_300x600_STATIC-3%' then 'HICYB_300x600 (Static 3)'
          when ${creative} ilike '%HICYB_300x600_STATIC-4%' then 'HICYB_300x600 (Static 4)'
          when ${creative} ilike '%HICYB_300x250_STATIC-5%' then 'HICYB_300x250 (Static Offer)'
          when ${creative} ilike '%HICYB_300x250_STATIC-3%' then 'HICYB_300x250 (Static 3)'
          when ${creative} ilike '%HICYB_300x250_STATIC-4%' then 'HICYB_300x250 (Static 4)'
          when ${creative} ilike '%HICYB_160x600_STATIC-5%' then 'HICYB_160x600 (Static Offer)'
          when ${creative} ilike '%HICYB_160x600_STATIC-3%' then 'HICYB_160x600 (Static 3)'
          when ${creative} ilike '%HICYB_160x600_STATIC-4%' then 'HICYB_160x600 (Static 4)'

          when ${ad_id} = '488411149' then 'HICYB_728x90 (Static 4)'
          when ${ad_id} = '487679147' then 'HICYB_160x600 (Static 4)'
          when ${ad_id} = '487967316' then 'HICYB_300x250 (Static 4)'

          when ${ad_id} = '487845862' then 'HICYB_2640x1485'
          when ${ad_id} = '487844650' then 'HICYB_2640x1485'
          when ${ad_id} = '487845853' then 'HICYB_2640x1485'

          when ${ad_id} = '487870245' then 'HICYB_217x114'
          when ${ad_id} = '487587734' then 'HICYB_217x114'
          when ${ad_id} = '487588046' then 'HICYB_217x114'

          when ${placement_id} = '294737080' then 'Expedia_HICYB_400x225'
          when ${placement_id} = '294736822' then 'Expedia_HICYB_400x225'
          when ${placement_id} = '294736012' then 'Expedia_HICYB_400x225'

          when ${creative} ilike '%HICYB_970x250%' then 'HICYB_970x250'
          when ${creative} ilike '%HICYB_728x90%' then 'HICYB_728x90'
          when ${creative} ilike '%HICYB_320x50%' then 'HICYB_320x50'
          when ${creative} ilike '%HICYB_300x600%' then 'HICYB_300x600'
          when ${creative} ilike '%HICYB_160x600%' then 'HICYB_160x600'
          when ${creative} ilike '%HICYB_300x250%' then 'HICYB_300x250'
          when ${creative} ilike '%HICYB_Native%' then 'HICYB_Native'

          when ${ad_id} = '471447447' then 'BookHotel_300x600'

          when ${ad} ilike '%MobileWelcomeInterstitial%' then 'Pandora_750x1400'
          when ${ad} ilike '%Travel Intender_ONsiteDisplay_2560x400%' then 'TripAdvisor_2560x400'

          when ${ad} ilike '%_Audio_Kids-Free%' then 'Pandora Kids Free :30 Audio'
          when ${ad} ilike '%PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Leisure Travelers_Phoenix_Audio_:30_1x1%' then 'Pandora :30 Audio'
          when ${ad} ilike '%PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Leisure Travelers_Tucson_Audio_:30_1x1%' then 'Pandora :30 Audio'
          when ${ad} ilike '%PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Leisure Travelers_California_Audio_:30_1x1%' then 'Pandora :30 Audio'

          when ${ad} ilike '%PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Leisure Family Travelers_Phoenix_Audio_:30_1x1%' then 'Pandora :30 Audio'
          when ${ad} ilike '%PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Leisure Family Travelers_Tucson_Audio_:30_1x1%' then 'Pandora :30 Audio'
          when ${ad} ilike '%PANDORA_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Leisure Family Travelers_California_Audio_:30_1x1%' then 'Pandora :30 Audio'

          when ${ad} ilike '%SPOTIFY_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_Road Trip/Travel_CALIFORNIA_Audio_:30_1x1%' then 'Spotify :30 Audio'

          when ${placement} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery_Awareness_Variety Seeker_California_RON_Plan Now_728x90' then 'PlanNow_728x90'
          when ${placement} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery_Awareness_Family Variety Seeker_California_RON_Plan Now_728x90' then 'PlanNow_728x90'

          when ${placement} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery_Awareness_Family Variety Seeker_California_RON_Kids-Free_728x90' then 'KidsFree_728x90'
          when ${placement} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery_Awareness_Family Variety Seeker_California_RON_Plan Now_300x250' then 'PlanNow_300x250'
          when ${placement} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery_Awareness_Family Variety Seeker_California_RON_Kids-Free_300x250' then 'KidsFree_300x250'
          when ${placement} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery_Awareness_Family Variety Seeker_California_RON_Kids-Free_300x250' then 'KidsFree_300x250'
          when ${placement} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery_Awareness_Variety Seeker_California_RON_Plan Now_300x250' then 'PlanNow_300x250'
          when ${placement} ilike 'CONDENAST_SDTAFY21_FallDriveMarketRecovery_Awareness_California_RON_Plan Now_300x600' then 'PlanNow_300x600'

          when ${creative} ilike '%WeekYay_Hotel_300x250%' then 'WeekYay_Hotels_300x250'
          when ${creative} ilike '%WeekYay_Hotel_728x90%' then 'WeekYay_Hotels_728x90'
          when ${creative} ilike '%WeekYay_Family_728x90%' then 'WeekYay_Family_728x90'
          when ${creative} ilike '%WeekYay_Hotel_300x600%' then 'WeekYay_Hotels_300x600'
          when ${creative} ilike '%WeekYay_Hotel_160x600%' then 'WeekYay_Hotels_160x600'
          when ${creative} ilike '%WeekYay_Hotels_300x250%' then 'WeekYay_Hotels_300x250'
          when ${creative} ilike '%WeekYay_Hotels_640x640%' then 'WeekYay_Hotels_640x640'

          when ${creative} ilike '%WeekYay_Family_300x250%' then 'WeekYay_Family_300x250'
          when ${creative} ilike '%WeekYay_Family_728x90%' then 'WeekYay_Family_728x90'
          when ${creative} ilike '%WeekYay_Family_300x600%' then 'WeekYay_Family_300x600'
          when ${creative} ilike '%WeekYay_Family_160x600%' then 'WeekYay_Family_160x600'
          when ${creative} ilike '%WeekYay_Family_300x250%' then 'WeekYay_Family_300x250'
          when ${creative} ilike '%WeekYay_Family_640x640%' then 'WeekYay_Family_640x640'

          when ${creative} ilike '%SDT_Weekyay_StaticDisplay_300x50%' then 'WeekYay_300x50'
          when ${creative} ilike '%SDT_Weekyay_StaticDisplay_970x90%' then 'WeekYay_970x90'
          when ${creative} ilike '%SDT_Weekyay_StaticDisplay_468x60%' then 'WeekYay_468x60'

          when ${ad} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_%_Active Travel Intenders+Not Booked_OnSiteDisplay_Display_WeekYay_Hotel_300x600%' then 'WeekYay_Hotels_300x600'
          when ${ad} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_%_Active Travel Intenders+Not Booked_OnSiteDisplay_Display_WeekYay_Hotel_728x90%' then 'WeekYay_Hotels_728x90'
          when ${ad} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_%_Active Travel Intenders+Not Booked_OnSiteDisplay_Display_WeekYay_Hotel_160x600%' then 'WeekYay_Hotels_160x600'

          when ${ad} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_%_SD Intenders+Not Booked_OnSiteDisplay_Display_WeekYay_Hotel_300x600%' then 'WeekYay_Hotels_300x600'
          when ${ad} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_%_SD Intenders+Not Booked_OnSiteDisplay_Display_WeekYay_Hotel_728x90%' then 'WeekYay_Hotels_728x90'
          when ${ad} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_%_SD Intenders+Not Booked_OnSiteDisplay_Display_WeekYay_Hotel_160x600%' then 'WeekYay_Hotels_160x600'

          when ${ad} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_%_Active Travel Intenders+Not Booked_OnSiteDisplay_Display_WeekYay_Family_300x600%' then 'WeekYay_Family_300x600'
          when ${ad} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_%_Active Travel Intenders+Not Booked_OnSiteDisplay_Display_WeekYay_Family_728x90%' then 'WeekYay_Family_728x90'
          when ${ad} ilike 'PRICELINE_SDTAFY21_PullThrough_Intent_ROS_%_Active Travel Intenders+Not Booked_OnSiteDisplay_Display_WeekYay_Family_160x600%' then 'WeekYay_Family_160x600'

          when ${ad} ilike '%Kids-Free_640x640%' then 'KidsFree_640x640'
          when ${ad} ilike '%Kids-Free_728x90%' then 'KidsFree_728x90'
          when ${ad} ilike '%WeekYay_Hotels_640x640%' then 'WeekYay_Hotels_640x640'
          when ${ad} ilike '%WeekYay_Hotels_300x250%' then 'WeekYay_Hotels_300x250'
          when ${ad} ilike '%WeekYay_Hotel_300x250%' then 'WeekYay_Hotels_300x250'
          when ${ad} ilike '%PANDORA_%_Audio_WeekYay_Hotels_:30%' then 'Pandora WeekYay Hotels :30 Audio'

          when ${ad} ilike '%Surfing_728x90%' then 'Surfing_728x90'
          when ${ad} ilike '%Surfing_300x250%' then 'Surfing_300x250'
          when ${ad} ilike '%Surfing_300x50%' then 'Surfing_300x50'
          when ${ad} ilike '%Surfing_300x600%' then 'Surfing_300x600'
          when ${ad} ilike '%Surfing_160x600%' then 'Surfing_160x600'
          when ${ad} ilike '%Surfing_970x550%' then 'Surfing_970x550'
          when ${ad} ilike '%Surfing_970x250%' then 'Surfing_970x250'
          when ${ad} ilike '%Surfing_468x60%' then 'Surfing_468x60'
          when ${ad} ilike '%Surfing_970x90%' then 'Surfing_970x90'

          when ${creative} = 'SDT_TA_HICYB_Display_Sunset_PlanNow_970x250' then 'Sunset_970x250'
          when ${creative} = 'SDT_TA_HICYB_Display_Sunset_PlanNow_728x90' then 'Sunset_728x90'
          when ${creative} = 'SDT_TA_HICYB_Display_Sunset_PlanNow_300x250' then 'Sunset_300x250'
          when ${creative} = 'SDT_TA_HICYB_Display_Sunset_PlanNow_300x600' then 'Sunset_300x600'
          when ${creative} = 'SDT_TA_HICYB_Display_Sunset_PlanNow_320x50' then 'Sunset_320x50'

          when ${ad} ilike '%Sunset_1320x742%' then 'Sunset_1320x742'
          when ${ad} ilike '%Sunset_680x320%' then 'Sunset_680x320'
          when ${ad} ilike '%Sunset_728x90%' then 'Sunset_728x90'
          when ${ad} ilike '%Sunset_300x250%' then 'Sunset_300x250'
          when ${ad} ilike '%Sunset_300x50%' then 'Sunset_300x50'
          when ${ad} ilike '%Sunset_300x600%' then 'Sunset_300x600'
          when ${ad} ilike '%Sunset_160x600%' then 'Sunset_160x600'
          when ${ad} ilike '%Sunset_970x550%' then 'Sunset_970x550'
          when ${ad} ilike '%Sunset_468x60%' then 'Sunset_468x60'
          when ${ad} ilike '%Sunset_970x250%' then 'Sunset_970x250'
          when ${ad} ilike '%Sunset_970x90%' then 'Sunset_970x90'

          when ${ad} ilike '%Family_728x90%' then 'Family_728x90'
          when ${ad} ilike '%Family_680x320%' then 'Family_680x320'
          when ${ad} ilike '%Family_1320x742%' then 'Family_1320x742'
          when ${ad} ilike '%Family_300x600%' then 'Family_300x600'
          when ${ad} ilike '%Family_300x250%' then 'Family_300x250'
          when ${ad} ilike '%Family_300x50%' then 'Family_300x50'
          when ${ad} ilike '%Family_160x600%' then 'Family_160x600'
          when ${ad} ilike '%Family_970x550%' then 'Family_970x550'
          when ${ad} ilike '%Family_468x60%' then 'Family_468x60'
          when ${ad} ilike '%Family_970x250%' then 'Family_970x250'
          when ${ad} ilike '%Family_970x90%' then 'Family_970x90'

          when ${ad} ilike '%HICYB_970x250%' then 'HICYB_970x250'
          when ${ad} ilike '%HICYB_728x90%' then 'HICYB_728x90'
          when ${ad} ilike '%HICYB_320x50%' then 'HICYB_320x50'
          when ${ad} ilike '%HICYB_300x600%' then 'HICYB_300x600'
          when ${ad} ilike '%HICYB_160x600%' then 'HICYB_160x600'
          when ${ad} ilike '%HICYB_300x250%' then 'HICYB_300x250'
          when ${ad} ilike '%HICYB_Native%' then 'HICYB_Native'

          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_TravelIntent_%_Display_HICYB_970x250%' then 'HICYB_970x250'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_TravelIntent_%_Display_HICYB_728x90%' then 'HICYB_728x90'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_TravelIntent_%_Display_HICYB_320x50%' then 'HICYB_320x50'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_TravelIntent_%_Display_HICYB_300x600%' then 'HICYB_300x600'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_TravelIntent_%_Display_HICYB_160x600%' then 'HICYB_160x600'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_TravelIntent_%_Display_HICYB_300x250%' then 'HICYB_300x250'

          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_SDTravelIntent_%_Display_HICYB_970x250%' then 'HICYB_970x250'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_SDTravelIntent_%_Display_HICYB_728x90%' then 'HICYB_728x90'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_SDTravelIntent_%_Display_HICYB_320x50%' then 'HICYB_320x50'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_SDTravelIntent_%_Display_HICYB_300x600%' then 'HICYB_300x600'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_SDTravelIntent_%_Display_HICYB_160x600%' then 'HICYB_160x600'
          when ${placement} ilike 'SOJERN_SDTAFY21_PullThrough_SDTravelIntent_%_Display_HICYB_300x250%' then 'HICYB_300x250'

          when ${ad_id} = '487708200' then 'HICYB_300x600'
          when ${ad_id} = '487708197' then 'HICYB_300x250'
          when ${ad_id} = '487708194' then 'HICYB_160x600'
          when ${ad_id} = '487708188' then 'HICYB_728x90'

          when ${ad_id} = '488171158' then 'WeekYay_1200x627'
          when ${ad_id} = '488171155' then 'WeekYay_1200x627'
          when ${ad_id} = '488171152' then 'WeekYay_1200x627'

          when ${ad_id} = '487644664' then 'HICYB_1200x627'
          when ${ad_id} = '487642576' then 'HICYB_1200x627'
          when ${ad_id} = '487640377' then 'HICYB_1200x627'

          when ${ad_id} = '487962873' then 'HICYB_1200x627'
          when ${ad_id} = '487681778' then 'HICYB_1200x627'
          when ${ad_id} = '487707014' then 'HICYB_1200x627'

          when ${ad} ilike '%Outdoor_2_970x250%' then 'Outdoor_v2_970x250'
          when ${ad} ilike '%Outdoor_2_728x90%' then 'Outdoor_v2_728x90'
          when ${ad} ilike '%Outdoor_2_320x50%' then 'Outdoor_v2_320x50'
          when ${ad} ilike '%Outdoor_2_300x600%' then 'Outdoor_v2_300x600'
          when ${ad} ilike '%Outdoor_2_300x250%' then 'Outdoor_v2_300x250'
          when ${ad} ilike '%Outdoor_2_Native%' then 'Outdoor_v2_Native'

          when ${ad} ilike '%Outdoor_1_970x250%' then 'Outdoor_v1_970x250'
          when ${ad} ilike '%Outdoor_1_728x90%' then 'Outdoor_v1_728x90'
          when ${ad} ilike '%Outdoor_1_320x50%' then 'Outdoor_v1_320x50'
          when ${ad} ilike '%Outdoor_1_300x600%' then 'Outdoor_v1_300x600'
          when ${ad} ilike '%Outdoor_1_300x250%' then 'Outdoor_v1_300x250'
          when ${ad} ilike '%Outdoor_1_Native%' then 'Outdoor_v1_Native'

          when ${creative} ilike '%sanDiego_970x250_outdoor_US%' then 'TripAdvisor_Outdoor_970x250'
          when ${ad_id} = '487852806' then 'TripAdvisor_Outdoor_970x250'
          when ${creative} ilike '%sanDiego_728x90_outdoor_US%' then 'TripAdvisor_Outdoor_728x90'
          when ${ad_id} = '487708188' then 'TripAdvisor_Outdoor_728x90'
          when ${creative} ilike '%sanDiego_300x600_outdoor_US%' then 'TripAdvisor_Outdoor_300x600'
          when ${ad_id} = '487708200' then 'TripAdvisor_Outdoor_300x600'
          when ${creative} ilike '%sanDiego_300x250_outdoor_US%' then 'TripAdvisor_Outdoor_300x250'
          when ${ad_id} = '487708197' then 'TripAdvisor_Outdoor_300x250'

          when ${ad_id} = '487708197' then 'TripAdvisor_Outdoor_300x250'

          when ${creative} = 'San Diego_970x250' then 'TripAdvisor_RTG_970x250'
          when ${creative} = 'San Diego_728x90' then 'TripAdvisor_RTG_728x90'
          when ${creative} = 'sanDiego_300x600' then 'TripAdvisor_RTG_300x600'
          when ${creative} = 'sanDiego_300x250' then 'TripAdvisor_RTG_300x250'

          when ${creative} = 'sanDiego_970x250_RTG_970x250' then 'TripAdvisor_RTG_970x250'
          when ${creative} = 'sanDiego_728x90_RTG' then 'TripAdvisor_RTG_728x90'
          when ${creative} = 'sanDiego_300x600_RTG' then 'TripAdvisor_RTG_300x600'
          when ${creative} = 'sanDiego_300x250_RTG' then 'TripAdvisor_RTG_300x250'

          when ${ad_id} = '471092259' then 'Co-Branded_Outdoor_Native'

          when ${ad} ilike '%Halo_Mobile_1x1%' then 'High Impact Halo Unit (Mobile)'
          when ${ad} ilike '%Halo_Desktop_1x1%' then 'High Impact Halo Unit (Desktop)'

          when ${ad} ilike '%Halo_Mobile_1x1%' then 'MobileHalo_768x768'
          when ${ad} ilike '%Halo_Desktop_1x1%' then 'DesktopHalo_1920x480'
          when ${ad} ilike '%Mobile_Book Hotel%' then 'Mobile_Book Hotel'
          when ${ad} ilike '%Mobile_Plan Now%' then 'Mobile_Plan Now'
          when ${ad} ilike '%Desktop_Book Hotel%' then 'Desktop_Book Hotel'
          when ${ad} ilike '%Desktop_Plan Now%' then 'Desktop_Plan Now'

          when ${ad} ilike '%Outdoor_Torrey Pines' then 'WC: Torrey Pines'
          when ${ad} ilike '%Outdoor_Swimming with Leopard Sharks' then 'WC: Swimming with Leopard Sharks'
          when ${ad} ilike '%Outdoor_San Diego''s Tide Pools - Exploring Life%' then 'WC: SD Tide Pools: Exploring Life at the Edge of the Sea'
          when ${ad} ilike '%Outdoor_Sailing in San Diego' then 'WC: Sailing in San Diego'
          when ${ad} ilike '%Outdoor_Mission Bay & Beaches' then 'WC: Mission Bay & Beaches'
          when ${ad} ilike '%Outdoor_Mele Sali''s Surf Faves%' then 'WC: Mele Sali''s Surf Faves'
          when ${ad} ilike '%Outdoor_La Jolla Beaches' then 'WC: La Jolla Beaches'
          when ${ad} ilike '%Outdoor_Historic Highway 101' then 'WC: Historic Highway 101'

          when ${ad} ilike '%Neighborhood_Three beach neighborhoods%' then 'WC: 3 Beach Neighborhoods w/ SoCal Vibe'
          when ${ad} ilike '%Neighborhood_Sunny 7: Mission Valley/Old Town%' then 'S7: Mission Valley/Old Town'
          when ${ad} ilike '%Neighborhood_Sunny 7: Mission Bay%' then 'S7: Mission Bay'
          when ${ad} ilike '%Neighborhood_Sunny 7: North Coastal%' then 'S7: North Coastal'
          when ${ad} ilike '%Neighborhood_Pacific Beach%' then 'WC: Pacific Beach'
          when ${ad} ilike '%Neighborhood_Bird Rock%' then 'WC: Bird Rock'

          when ${ad} ilike '%Family_Sunny 7: Reasons to bring the family' then 'S7: Reasons to Bring the Family'
          when ${ad} ilike '%Family_One-day itinerary' then 'One-Day Itinerary'
          when ${ad} ilike '%Family_Awesome Museums' then 'Awesome Museums'
          when ${ad} ilike '%Family_25 Fun & Free Things to do' then 'WC: 25 Fun & Free Things to do'
          when ${ad} ilike '%Family_15 San Diego Playgrounds' then 'WC: 15 San Diego Playgrounds'
          when ${ad} ilike '%Family_13 Kid-pleasing neighborhoods' then 'WC: 13 Kid-Pleasing Neighborhoods'
          when ${ad} ilike '%Family_The Best Beaches According to Kids' then 'WC: The Best Beaches According to Kids'
          when ${ad} ilike '%Family_Family fun in San Diego' then 'WC: Family Fun in San Diego'
          when ${ad} ilike '%Family_Edutainment' then 'Edutainment'
          when ${ad} ilike '%Family_9 Kid Approved Parks' then 'WC: 9 Kid Approved Parks'

          when ${ad} ilike '%Culinary_Sunny 7: Rooftop Restaurants' then 'S7: Rooftop Restaurants'
          when ${ad} ilike '%Culinary_Sunny 7: Local Markets' then 'S7: Local Markets'
          when ${ad} ilike '%Culinary_Sunny 7: Beachfront Bars' then 'S7: Beachfront Bars'
          when ${ad} ilike '%Culinary_Sunny 7: Award Winning Restaurants & Chefs' then 'S7: Award Winning Restaurants & Chefs'
          when ${ad} ilike '%Culinary_Foodie Finds' then 'WC: Foodie Finds'
          when ${ad} ilike '%Culinary_Food Truck Revolution' then 'Food Truck Revolution'
          when ${ad} ilike '%Culinary_Cross-Border Cuisine' then 'WC: Cross-Border Cuisine'
          when ${ad} ilike '%Culinary_Best Seafood Restaurants' then 'WC: Best Seafood Restaurants'
          when ${ad} ilike '%Culinary_Realm of the 52 Remedies%' then 'WC: Realm of the 52 Remedies'

          when ${ad} ilike '%Attractions_Sunny 7: Natural Wonders' then 'S7: Natural Wonders'
          when ${ad} ilike '%Attractions_Sunny 7: Art Outside the Box' then 'S7: Art Outside the Box'
          when ${ad} ilike '%Attractions_Sunny 7: 7 Botanical Gardens' then 'S7: 7 Botanical Gardens'
          when ${ad} ilike '%Attractions_San Diego''s 59 Mile Scene Drive' then 'WC: San Diego''s 59 Mile Scenic Drive'
          when ${ad} ilike '%Attractions_Sunny 7: Hidden Gems in Balboa Park' then 'S7: Balboa Park Hidden Gems'
          when ${ad} ilike '%Attractions_Sunny 7: Awesome San Diego Viewpoints' then 'S7: Awesome San Diego Viewpoints'
          when ${ad} ilike '%Attractions_Balboa Park - Cultural Heart' then 'WC: Balboa Park - Cultural Heart'

          when ${ad} ilike '%Outdoor_Sunny 7: Ways to make a Splash' then 'S7: Make A Splash'
          when ${ad} ilike '%Outdoor_Sunny 7: Great Spots to Watch the Sunset' then 'S7: Sunsets'
          when ${ad} ilike '%Outdoor_Explore La Jolla on a Kayak Tour' then 'WC: Explore La Jolla on a Kayak Tour'
          when ${ad} ilike '%Outdoor_Bayshore Bikeway' then 'WC: Bayshore Bikeway'
          when ${ad} ilike '%Outdoor_7 Things to Do Along Scenic CA Highway 101' then 'S7: 7 Things to Do Along Scenic CA Highway 101'
          when ${ad} ilike '%Outdoor_7 Star Coastal Hikes' then 'S7: 7 Star Coastal Hikes'

          when ${ad} ilike '%NativePromo_Pull-Through Landing Page' then 'Nano Traffic Driver: Pull-Through Landing Page'
          when ${ad} ilike '%NativePromo_Hotels Landing Page' then 'Nano Traffic Driver: Hotels Landing Page'

          when ${ad} ilike 'MEREDITH_SDTAFY21_FallDriveMarketRecovery_Awareness_Variety Seeker_California_Portrait' then 'Desktop_Portrait'

          when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Outdoor_IMPRESSION TRACKER' then 'Taboola Impression Tracker - Outdoor Content'
          when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Neighborhood__IMPRESSION TRACKER' then 'Taboola Impression Tracker - Neighborhood Content'
          when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Family_IMPRESSION TRACKER' then 'Taboola Impression Tracker - Family Content'
          when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Culinary_IMPRESSION TRACKER' then 'Taboola Impression Tracker - Culinary Content'
          when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Macro_VarietySeeker_NativeTraffic_Attractions_IMPRESSION TRACKER' then 'Taboola Impression Tracker - Attractions Content'

          when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Outdoor_IMPRESSION TRACKER' then 'Taboola Impression Tracker - Outdoor Content'
          when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Neighborhood_IMPRESSION TRACKER' then 'Taboola Impression Tracker - Neighborhood Content'
          when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Family_IMPRESSION TRACKER' then 'Taboola Impression Tracker - Family Content'
          when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Culinary_IMPRESSION TRACKER' then 'Taboola Impression Tracker - Culinary Content'
          when ${placement} ilike 'TABOOLA_SDTAFY21_AlwaysOnRecovery_Micro_RetargetMacro_NativeTraffic_Attractions_IMPRESSION TRACKER' then 'Taboola Impression Tracker - Attractions Content'

          when ${ad} ilike '%Kids-Free_OLV%' then 'Kids Free (:30)'
          when ${ad} ilike '%Kids-Free_OTT%' then 'Kids Free (:30)'
          when ${ad} ilike '%Kids-Free_:30%' then 'Kids Free (:30)'
          when ${ad} ilike 'HULU_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_1P: Parent Watchers_Tucson_Video_1920x1080_Behavioral_Kids-Free_1x1%' then 'Kids Free (:30)'
          when ${ad} ilike 'HULU_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_1P: Parent Watchers_Phoenix_Video_1920x1080_Behavioral_Kids-Free_1x1%' then 'Kids Free (:30)'
          when ${ad} ilike 'HULU_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_1P: Parent Watchers_CA_Video_1920x1080_Behavioral_Kids-Free_1x1%' then 'Kids Free (:30)'

          when ${placement} ilike 'SPOTX_SDTAFY21_FallDriveMarketRecovery_Awareness_RON Video%' then 'Happiness is Calling You Back (:30)'
          when ${placement} ilike 'NBC SpotON_SDTAFY21_FallDriveMarketRecovery_Awareness_DomesticTravelInterest%' then 'Happiness is Calling You Back (:30)'
          when ${placement} ilike 'NBC SpotON_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54%' then 'Happiness is Calling You Back (:30)'
          when ${placement} ilike 'NBC SpotON_SDTAFY21_FallDriveMarketRecovery_Awareness_Children6-17%' then 'Kids Free (:30)'
          when ${ad} ilike 'Hulu_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_3P%' then 'Happiness is Calling You Back (:30)'
          when ${ad} ilike 'Hulu_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_CA/PHX/TUCSON%' then 'Happiness is Calling You Back (:30)'
          when ${ad} ilike 'Hulu_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_1P%_Behavioral_1x1' and ${date_date} BETWEEN '2020-07-27' AND '2020-08-30' then 'Happiness is Calling You Back (:30)'
          when ${ad} ilike 'Hulu_SDTAFY21_FallDriveMarketRecovery_Awareness_A25-54_1P%_Behavioral_1x1' and ${date_date} BETWEEN '2020-08-31' AND '2020-11-30' then 'Kids Free (:30)'
          when ${placement} ilike 'ABC_SDTAFY21_FallDriveMarketRecovery_Awareness%' then 'Happiness is Calling You Back (:30)'
          when ${placement} ilike 'CBS_SDTAFY21_FallDriveMarketRecovery_Awareness%' then 'Happiness is Calling You Back (:30)'

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


  dimension: creative_set {
    type: string
    hidden: yes
    sql: case
            when ${creative_name} ilike '%KidsFree%' then 'Kids Free'
            when ${creative_name} ilike '%Kids-Free%' then 'Kids Free'
            when ${creative_name} ilike '%Kids Free%' then 'Kids Free'
            else 'Uncategorized'
            end
      ;;
  }

  dimension: is_kids_free {
    type: yesno
    hidden: yes
    sql: ${creative_set} = 'Kids Free' ;;
  }


######### All Dimensions Native to Source Table Below #########


  dimension: active_view_eligible_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.active_view_eligible_impressions ;;
  }

  dimension: active_view_measurable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.active_view_measurable_impressions ;;
  }

  dimension: active_view_viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.active_view_viewable_impressions ;;
  }

  dimension: ad {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_id {
    type: string
    group_label: "DCM IDs"
    sql: ${TABLE}.ad_id ;;
  }

  dimension: advertiser {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.advertiser ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: campaign {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "DCM IDs"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: click_through_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.click_through_conversions ;;
  }

  dimension: click_through_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.click_through_revenue ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }

  dimension: creative {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.creative ;;
  }

  dimension: creative_id {
    type: string
    group_label: "DCM IDs"
    sql: ${TABLE}.creative_id ;;
  }

  dimension_group: date {
    group_label: "Date Periods"
    label: ""
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

  dimension: ga_video_starts {
    type: number
    hidden: yes
    sql: ${TABLE}.ga_video_starts ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: newsletter_sign_up {
    type: number
    hidden: yes
    sql: ${TABLE}.newsletter_sign_up ;;
  }

  dimension: newusers {
    type: number
    hidden: yes
    sql: ${TABLE}.newusers ;;
  }

  dimension: pageviews {
    type: number
    hidden: yes
    sql: ${TABLE}.pageviews ;;
  }

  dimension: placement {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.placement ;;
  }

  dimension: placement_id {
    type: number
    group_label: "DCM IDs"
    sql: ${TABLE}.placement_id ;;
  }

  dimension: placement_strategy {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.placement_strategy ;;
  }

  dimension: report_id {
    type: number
    hidden: yes
    group_label: "DCM IDs"
    sql: ${TABLE}.report ;;
  }

  dimension: sessionduration {
    type: number
    hidden: yes
    sql: ${TABLE}.sessionduration ;;
  }

  dimension: sessions {
    type: number
    hidden: yes
    sql: ${TABLE}.sessions ;;
  }

  dimension: site_dcm {
    type: string
    group_label: "DCM Dimensions"
    label: "Site (DCM)"
    sql: ${TABLE}.site_dcm ;;
  }

  dimension: tos_above_120s {
    type: number
    hidden: yes
    sql: ${TABLE}.tos_above_120s ;;
  }

  dimension: tos_above_30s {
    type: number
    hidden: yes
    sql: ${TABLE}.tos_above_30s ;;
  }

  dimension: total_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.total_conversions ;;
  }

  dimension: total_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.total_revenue ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

  dimension: view_through_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.view_through_conversions ;;
  }

  dimension: view_through_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.view_through_revenue ;;
  }

  dimension: wheel_interactions {
    type: number
    hidden: yes
    sql: ${TABLE}.wheel_interactions ;;
  }

  ## Dimensions for GA Events ##

  dimension: discover_sd {
    type: number
    hidden: yes
    sql: ${TABLE}.discover_sd ;;
  }

  dimension: plan_your_vacation {
    type: number
    hidden: yes
    sql: ${TABLE}.plan_your_vacation ;;
  }

  dimension: spin_wheel_button {
    type: number
    hidden: yes
    sql: ${TABLE}.spin_wheel_button ;;
  }

  dimension: wheel_drag {
    type: number
    hidden: yes
    sql: ${TABLE}.wheel_drag ;;
  }

  dimension: wheel_click {
    type: number
    hidden: yes
    sql: ${TABLE}.wheel_click ;;
  }

  dimension: visitor_planning_guide {
    type: number
    hidden: yes
    sql: ${TABLE}.visitor_planning_guide ;;
  }

  dimension: staying_in_touch {
    type: number
    hidden: yes
    sql: ${TABLE}.staying_in_touch ;;
  }

  dimension: hotel_search {
    type: number
    hidden: yes
    sql: ${TABLE}.hotel_search ;;
  }

  dimension: purchases {
    type: number
    hidden: yes
    sql: ${TABLE}.purchases ;;
  }

######### All measures go below ########

  measure: total_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
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
    sql_distinct_key: ${ga_join_id} ;;
    label: "Active View Measureable Impressions"
    sql: ${active_view_measurable_impressions} ;;
  }

  measure: total_active_view_viewable_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
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

  measure: total_cost {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Media Spend"
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: cost_per_click {
    group_label: "3rd Party Measures"
    type: number
    label: "CPC"
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
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
    sql: 1.0*${total_cost}/nullif(${total_active_view_viewable_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    group_label: "3rd Party Measures"
    type: number
    label: "CPM"
    sql: 1.0*${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_views {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Video Views"
    sql: 0 ;;
  }

  measure: total_completes {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Video Completes"
    sql: 0 ;;
  }

  ### GA Measures ###

  measure: total_sessions {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    group_label: "Google Analytics Metrics"
    type: number
    label: "CPS"
    sql: ${total_cost}/nullif(${total_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: total_session_duration {
    hidden: yes
    type: sum_distinct
    label: "Total Session Duration"
    sql_distinct_key: ${ga_join_id};;
    sql: ${sessionduration};;
  }

  measure: avg_time_on_site {
    group_label: "Google Analytics Metrics"
    label: "Avg. TOS"
    type: number
    sql:  (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400  ;;
    value_format: "m:ss"
  }

  measure: total_pageviews {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Pageviews"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${pageviews} ;;
  }

  measure: pages_per_session {
    group_label: "Google Analytics Metrics"
    type: number
    label: "Pages/Session"
    sql: ${total_pageviews}/nullif(${total_sessions}, 0) ;;
    value_format_name: decimal_2
  }

  measure: total_bounces {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Bounces"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${bounces} ;;
  }

  measure: total_bounce_rate  {
    label: "Bounce Rate"
    group_label: "Google Analytics Metrics"
    type: number
    sql: ${total_bounces}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  ## SDT Google Analytics Goals ##

  measure: total_wheel_interactions {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Wheel Interactions"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${wheel_interactions} ;;
  }

  measure: wheel_interaction_rate  {
    label: "Wheel Interaction Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_wheel_interactions}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_ga_video_starts {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Video Starts"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${ga_video_starts} ;;
  }

  measure: ga_video_start_rate  {
    label: "Video Start Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_ga_video_starts}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_newsletter_signups {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Newsletter Sign-Ups"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${newsletter_sign_up} ;;
  }

  measure: newsletter_signups_rate  {
    label: "Newsletter Sign-Up Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_newsletter_signups}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_tos_above_30s {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Avg. TOS >30s"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${tos_above_30s} ;;
  }

  measure: tos_above_30s_rate  {
    label: "Avg. TOS >30s Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_tos_above_30s}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_tos_above_120s {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Avg. TOS >120s"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${tos_above_30s} ;;
  }

  measure: tos_above_120s_rate  {
    label: "Avg. TOS >120s Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_tos_above_120s}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  ## SDT Google Analytics Events ##

  measure: total_discover_sd {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Discover SD Boards"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${discover_sd} ;;
  }

  measure: total_plan_your_vacation {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Plan Your Vacation"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${plan_your_vacation} ;;
  }

  measure: total_spin_wheel_button {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Wheel Spins"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${spin_wheel_button} ;;
  }

  measure: total_wheel_drag {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Wheel Drags"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${wheel_drag} ;;
  }

  measure: total_wheel_click {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Wheel Clicks"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${wheel_click} ;;
  }

  measure: total_visitor_planning_guide {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Visitor Planning Guide"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${visitor_planning_guide} ;;
  }

  measure: total_staying_in_touch {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Staying In Touch"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${staying_in_touch} ;;
  }

  measure: total_hotel_search {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Hotel Searches"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${hotel_search} ;;
  }

  measure: total_purchases {
    group_label: "Google Analytics Events"
    type: sum_distinct
    label: "Purchases"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${purchases} ;;
  }
}
