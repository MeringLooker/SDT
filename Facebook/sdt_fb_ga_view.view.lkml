view: sdt_fb_ga_view {
  sql_table_name: public.sdt_fb_ga_view ;;

###### Primary Key #######

  dimension: ga_join_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.ga_join_id ;;
  }

##### Dimensions added to this table via LookML #####

  dimension: publisher {
    type: string
    hidden: yes
    sql: 'Facebook' ;;
  }

  dimension: fiscal_year {
    label: "Fiscal Year"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${date_start_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
        WHEN ${date_start_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
        WHEN ${date_start_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${date_start_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${date_start_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
    drill_fields: [campaign_name]
  }

  dimension: ad_type {
    type: string
    group_label: "Facebook Dimensions"
    label: "Ad Type"
    sql:
      CASE
        WHEN ${ad_name} ilike '%SingleImage%' then 'Single Image'
        WHEN ${ad_name} ilike '%Carousel%' then 'Carousel'
        WHEN ${ad_name} ilike '%Story%' then 'Story'
        WHEN ${ad_name} ilike '%Phase2\\_Single' then 'Single Image'
        WHEN ${ad_name} ilike '%ActivePlanning\\_Phase1' then 'Single Image'
        WHEN ${ad_name} ilike '%FBTarget\\_Phase1' then 'Single Image'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: ad_size {
    type: string
    group_label: "Facebook Dimensions"
    label: "Ad Size"
    sql:
      CASE
        WHEN ${campaign_name} ilike 'SDT_FY20_PullThrough%' then 'Landscape Image'
        when ${ad_name} ilike '%Carousel_7BoatRides%' then 'Carousel'
        when ${ad_name} ilike '%Carousel_7BTS%' then 'Carousel'
        when ${ad_name} ilike '%Carousel_7HiddenGems%' then 'Carousel'
        when ${ad_name} ilike '%Carousel_7Rooftops%' then 'Carousel'
        when ${ad_name} ilike '%Carousel_7Splash%' then 'Carousel'
        when ${ad_name} ilike '%Carousel_7Sunsets%' then 'Carousel'

        when ${ad_name} ilike '%SingleImage_7BoatRides%' then 'Landscape Image'
        when ${ad_name} ilike '%SingleImage_7BTS%' then 'Landscape Image'
        when ${ad_name} ilike '%SingleImage_7HiddenGems%' then 'Landscape Image'
        when ${ad_name} ilike '%SingleImage_7Rooftops%' then 'Landscape Image'
        when ${ad_name} ilike '%SingleImage_7Splash%' then 'Landscape Image'
        when ${ad_name} ilike '%SingleImage_7Sunsets%' then 'Landscape Image'
        when ${ad_name} ilike '%SingleImage_7Wonders%' then 'Landscape Image'

        when ${ad_name} ilike '%SingleImage_DishingHappiness_Animae%' then 'Landscape Image'
        when ${ad_name} ilike '%SingleImage_DishingHappiness_BarioDogg%' then 'Landscape Image'
        when ${ad_name} ilike '%SingleImage_DishingHappiness_BarrioDogg%' then 'Landscape Image'
        when ${ad_name} ilike '%SingleImage_Neighborhoods' then 'Landscape Image'

        when ${ad_name} ilike '%Carousel_DishingHappiness_Animae%' then 'Carousel'
        when ${ad_name} ilike '%Carousel_DishingHappiness_BarioDogg%' then 'Carousel'
        when ${ad_name} ilike '%Carousel_DishingHappiness_BarrioDogg%' then 'Carousel'
        when ${ad_name} ilike '%Carousel_Neighborhoods' then 'Carousel'

        when ${ad_name} ilike '%FY20_UK_Views%' then 'Landscape Video'
        when ${ad_name} ilike '%FY20_CAN_Views%' then 'Landscape Video'

        when ${ad_name} ilike '%FY21_SDT_LocalsRecovery_Awareness_Poolside_Square%' then 'Square Image'
        when ${ad_name} ilike '%FY21_SDT_LocalsRecovery_Awareness_Beach_Square%' then 'Square Image'
        when ${ad_name} ilike '%FY21_SDT_LocalsRecovery_Awareness_Poolside_Horizontal%' then 'Landscape Image'
        when ${ad_name} ilike '%FY21_SDT_LocalsRecovery_Awareness_Beach_Horizontal%' then 'Landscape Image'

        when ${adset_name} ilike '%Macro_NonOutdoor_Video%' then 'Landscape Video'
        when ${adset_name} ilike '%Macro_Outdoor_Video%' then 'Landscape Video'

        when ${adset_name} ilike '%Macro_NonOutdoor_Conversion%' then 'Landscape Image'
        when ${adset_name} ilike '%Micro_NonOutdoor_Conversion%' then 'Landscape Image'
        when ${adset_name} ilike '%Macro_Outdoor_Conversion%' then 'Landscape Image'
        when ${adset_name} ilike '%Micro_Outdoor_Conversion%' then 'Landscape Image'
        WHEN ${campaign_name} ILIKE 'FY21_SDT_AlwaysOnContentRecovery_Nano_Conversion%%' then 'Landscape Image'

        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting%' then 'Landscape Image'
        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_FirstTouch%' then 'Landscape Image'
        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent_VideoViews_FirstTouch%' then 'Landscape Video'

        when ${campaign_name} ilike 'FY21_SDT_SpringAwareness_Conversion_SingleImage%' then 'Landscape Image'
        when ${campaign_name} ilike 'FY21_SDT_SpringAwareness_Awareness_Stories%' then 'Story'
        when ${adset_name} ilike 'FY21_SDT_SpringAwareness_Conversion_SingleImage%' then 'Landscape Image'
        when ${adset_name} ilike 'FY21_SDT_SpringAwareness_Conversion_SingleIamge%' then 'Landscape Image'

        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: sdt_market {
    label: "Market"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE

        WHEN ${campaign_name} ILIKE '%_CAN\\_%' then 'Canada'
        WHEN ${campaign_name} ILIKE '%_MEX\\_%' then 'Mexico'
        WHEN ${campaign_name} ILIKE '%_UK\\_%' then 'United Kingdom'
        WHEN ${campaign_name} ILIKE '%_GER\\_%' then 'Germany'
        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National' then 'United States'
        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National_Adara' then 'United States'
        when ${campaign_name} ilike 'FY19_DigitalVideo%' then 'United States'
        when ${campaign_name} ilike 'FY20_DigitalVideo%' then 'United States'
        WHEN ${campaign_name} ILIKE 'SDT_FY20_FallPromo%' then 'United States'
        WHEN ${campaign_name} ILIKE 'SDT_FY20_AlwaysOnContent%' then 'United States'
        WHEN ${campaign_name} ILIKE 'FY19_Content%' then 'United States'
        WHEN ${campaign_name} ILIKE '1718_Content%' then 'United States'
        WHEN ${campaign_name} ILIKE 'FY19_AAY%' then 'United States'
        WHEN ${campaign_name} ILIKE 'SDT_FY20_FamilyContent%' then 'United States'
        WHEN ${campaign_name} ILIKE 'FY21_SDT_AlwaysOnContent%' then 'United States'
        WHEN ${campaign_name} ILIKE 'FY21_SDT_DriveMarket%' then 'United States'
        WHEN ${campaign_name} ILIKE 'FY21_SDT_LocalsRecovery%' then 'United States'
        WHEN ${campaign_name} ILIKE 'FY21_SDT_SpringAwareness%' then 'United States'


        else 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_region {
    label: "Region"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        when ${campaign_name} ilike '%PHXTUCDMA' then 'Phoenix/Tucson'
        when ${campaign_name} ilike '%PHX%' then 'Phoenix'

        when ${campaign_name} ilike '%_Phoenix\\_%' then 'Phoenix'
        when ${campaign_name} ilike '%_National\\_%' then 'National'
        when ${campaign_name} ilike '%_National%' then 'National'
        when ${campaign_name} ilike '%_LosAngeles\\_%' then 'Los Angeles'
        when ${campaign_name} ilike '%_SanFrancisco\\_%' then 'San Francisco'
        when ${campaign_name} ilike '%_NewYork\\_%' then 'New York'

        when ${campaign_name} ilike 'FY19_DigitalVideo%' then 'National'
        when ${campaign_name} ilike 'FY20_DigitalVideo%' then 'National'

        when ${campaign_name} ilike '%_Traffic\\_LA\\_%' then 'Los Angeles'
        when ${campaign_name} ilike '%_Video\\_LA\\_%' then 'Los Angeles'
        when ${adset_name} ilike '%_Stage3\\_Video\\_LA\\_%' then 'Los Angeles'

        when ${campaign_name} ilike 'PHX\\_%' then 'Phoenix'
        when ${campaign_name} ilike 'National\\_%' then 'National'
        when ${campaign_name} ilike 'LA\\_%' then 'Los Angeles'
        when ${campaign_name} ilike 'Regional\\_%' then 'Regional'

        when ${campaign_name} ilike '%California' then 'California'
        when ${campaign_name} ilike '%PHXTUCDMA' then 'Phoenix/Tucson'
        when ${campaign_name} ilike '%LADMA' then 'Los Angeles'

        when ${campaign_name} ilike '%California' then 'California'
        when ${campaign_name} ilike '%Phoenix' then 'Phoenix'
        when ${campaign_name} ilike '%Tucson' then 'Tucson'

        when ${campaign_name} = 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_Arizona' then 'Arizona'
        when ${campaign_name} = 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_California' then 'California'
        when ${campaign_name} = 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_LosAngeles' then 'Los Angeles'
        when ${campaign_name} = 'FY21_SDT_AlwaysOnContent_VideoViews_FirstTouch_Arizona' then 'Arizona'
        when ${campaign_name} = 'FY21_SDT_AlwaysOnContent_VideoViews_FirstTouch_California' then 'California'
        when ${campaign_name} = 'FY21_SDT_AlwaysOnContent_VideoViews_FirstTouch_LosAngeles' then 'Los Angeles'

        when ${campaign_name} = 'FY21_SDT_SpringAwareness_Conversion_SingleImage_Arizona' then 'Arizona'
        when ${campaign_name} = 'FY21_SDT_SpringAwareness_Awareness_Stories_Arizona' then 'Arizona'

        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_FirstTouch_LosAngeles' then 'Los Angeles'
        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_FirstTouch_Arizona' then 'Arizona'
        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_FirstTouch_California' then 'California'

        else 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_campaign {
    label: "Campaign"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${campaign_name} ILIKE '%AlwaysOnContent%' then 'Always On Content'
        WHEN ${campaign_name} ILIKE 'FY19_Content_Stage%' then 'Always On Content'
        WHEN ${campaign_name} ILIKE 'FY19_Content_Family%' then 'Family Content'
        WHEN ${campaign_name} ILIKE 'SDTA Kids Free%' then 'Kids Free'
        WHEN ${campaign_name} ILIKE '1718_Content%' then 'Always On Content'
        WHEN ${campaign_name} ILIKE '1718_BrandCampaign_\\CAN%' then 'Canada Digital'
        WHEN ${campaign_name} ILIKE '1718_BrandCampaign_\\GER%' then 'Germany Digital'
        WHEN ${campaign_name} ILIKE '1718_BrandCampaign_\\SWZ%' then 'Switzerland Digital'
        WHEN ${campaign_name} ILIKE '1718_BrandCampaign_\\UK%' then 'United Kingdom Digital'

        WHEN ${campaign_name} ILIKE 'SDT_FY20_FallPromo%' then 'Fall Promos'
        WHEN ${campaign_name} ILIKE '%_DigitalVideo\\_%' then 'Brand Digital Video'
        WHEN ${campaign_name} ILIKE '%AAY%' then 'Awesome All Year'
        WHEN ${campaign_name} ILIKE 'FY19_Holiday_%%' then 'SD For The Holidays'
        WHEN ${campaign_name} ILIKE 'SDT_FY20_PullThrough_%' then 'US Pull-Through'
        WHEN ${campaign_name} ILIKE 'SDT_FY20_CAN\\_%' then 'Canada Digital'
        WHEN ${campaign_name} ILIKE 'FY19_CAN\\_%' then 'Canada Digital'
        WHEN ${campaign_name} ILIKE 'FY19_MEX_%' then 'Mexico Digital'
        WHEN ${campaign_name} ILIKE 'SDT_FY20_UK_%' then 'United Kingdom Digital'
        WHEN ${campaign_name} ILIKE 'FY19_UK_%' then 'United Kingdom Digital'
        WHEN ${campaign_name} ILIKE 'FY19_GER_%' then 'Germany Digital'
        WHEN ${campaign_name} ILIKE 'SDT_FY20_FamilyContent%' then 'Family Content'

        WHEN ${campaign_name} ILIKE 'FY21_SDT_DriveMarket%' then 'Fall Drive Market'
        WHEN ${campaign_name} ILIKE 'FY21_SDT_LocalsRecovery%' then 'Locals Recovery'
        when ${campaign_name} ilike 'FY21_SDT_SpringAwareness%' then 'Spring Awareness'

        else 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_layer {
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National' then 'Pull-Through Base'
        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National_Adara' then 'Pull-Through Base'

        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_Conversions%' then 'Macro Traffic'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Conversions%' then 'Micro Traffic'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_VideoViews%' then 'Macro Video'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_VideoViews%' then 'Micro Video'

        when ${campaign_name} ilike '%Macro_Traffic%' then 'Macro Traffic'
        when ${campaign_name} ilike '%Micro_Traffic%' then 'Micro Traffic'
        when ${campaign_name} ilike '%PullThrough_Traffic%' then 'Micro Traffic'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_VideoViews%' then 'Macro Video'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_VideoViews%' then 'Micro Video'

        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Nano_Conversions%' then 'Nano Traffic'

        when ${campaign_name} ilike 'SDT_FY20_UK_Views_Content%' then 'Storytelling'
        when ${campaign_name} ilike 'SDT_FY20_UK_Conversions_Content%' then 'Storytelling'
        when ${campaign_name} ilike 'SDT_FY20_CAN_Views_Content%' then 'Storytelling'
        when ${campaign_name} ilike 'SDT_FY20_CAN_Conversions_Content%' then 'Storytelling'
        when ${campaign_name} = 'FY19_CAN_Clicks' then 'Storytelling'
        when ${campaign_name} = 'FY19_CAN_Views' then 'Storytelling'
        when ${campaign_name} = 'FY19_CAN_Views_Flight2b' then 'Storytelling'
        when ${campaign_name} = 'FY19_CAN_Clicks_Flight2b' then 'Storytelling'

        when ${campaign_name} ilike 'SDT_FY20_CAN_Views_Brand%' then 'Amplify Reach'
        when ${campaign_name} ilike 'SDT_FY20_UK_Views_Brand%' then 'Amplify Reach'
        when ${campaign_name} = 'FY19_UK_BrandVideo' then 'Amplify Reach'

        when ${campaign_name} ilike 'SDT_FY20_FamilyContent_Macro%' then 'Macro Video'
        when ${campaign_name} ilike 'SDT_FY20_FamilyContent_Micro%' then 'Micro Traffic'
        when ${campaign_name} ilike 'SDT_FY20_FamilyContent_Nano%' then 'Nano Traffic'

        when ${adset_name} ilike '%Macro_NonOutdoor_Video%' then 'Macro Video'
        when ${adset_name} ilike '%Macro_Outdoor_Video%' then 'Macro Video'

        when ${adset_name} ilike '%Macro_NonOutdoor_Conversion%' then 'Macro Traffic'
        when ${adset_name} ilike '%Micro_NonOutdoor_Conversion%' then 'Micro Traffic'
        when ${adset_name} ilike '%Macro_Outdoor_Conversion%' then 'Macro Traffic'
        when ${adset_name} ilike '%Micro_Outdoor_Conversion%' then 'Micro Traffic'
        WHEN ${campaign_name} ILIKE 'FY21_SDT_AlwaysOnContentRecovery_Nano_Conversion%%' then 'Nano Traffic'

        WHEN ${campaign_name} ILIKE 'FY21_SDT_DriveMarket%' then 'Display'
        WHEN ${campaign_name} ILIKE 'FY21_SDT_LocalsRecovery%' then 'Awareness'

        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting%' then 'Topical Retargeting'
        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent_VideoViews_FirstTouch%' then 'First Touch Video'
        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_FirstTouch%' then 'First Touch Display'

        else 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_audience {
    label: "Audience"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National' then 'Brand Audience'
        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National_Adara' then 'Adara Audience'

        when ${campaign_name} ilike 'FY20_DigitalVideo_Views_Retargeting%' then 'Retargeting'
        when ${campaign_name} ilike 'FY19_DigitalVideo_Views_Retargeting%' then 'Retargeting'
        when ${campaign_name} ilike 'FY20_DigitalVideo_Views_Brand%' then 'Brand'
        when ${campaign_name} ilike 'FY20_DigitalVideo_Views_Family%' then 'Family'
        when ${adset_name} = 'FY19_DigitalVideo_Views_Brand' then 'Brand'
        when ${adset_name} = 'FY19_DigitalVideo_Views_Family' then 'Family'

        else 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_placement {
    label: "Campaign Placement"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        when ${campaign_name} ilike 'FY21_SDT_SpringAwareness_Conversion_SingleImage%' then 'Facebook/Instagram Single Image'
        when ${adset_name} ilike 'FY21_SDT_SpringAwareness_Conversion_SingleImage%' then 'Facebook/Instagram Single Image'
        when ${adset_name} ilike 'FY21_SDT_SpringAwareness_Conversion_SingleIamge%' then 'Facebook/Instagram Single Image'
        when ${campaign_name} ilike 'FY21_SDT_SpringAwareness_Awareness_Stories%' then 'Facebook/Instagram Stories'

        when ${adset_name} = 'FY20_UK_Views_Content_RT' then 'Video Content - Retargeting'
        when ${adset_name} = 'FY20_UK_Views_Content_VS' then 'Video Content - Variety Seeker'
        when ${adset_name} = 'FY20_UK_Views_Brand_LAL_USContentViewers' then 'Awareness - Lookalikes (Content Viewers)'
        when ${adset_name} = 'FY20_UK_Views_Brand_LAL_SiteVisitors' then 'Awareness - Lookalikes (Site Visitors)'
        when ${adset_name} = 'FY20_UK_Views_Brand_VS' then 'Awareness - Variety Seeker'
        when ${adset_name} = 'FY20_UK_Conversions_Content_RT' then 'Traffic Content - Retargeting'
        when ${adset_name} = 'FY20_UK_Conversions_Content_LAL' then 'Traffic Content - Lookalikes (Site Visitors)'

        when ${adset_name} ilike 'FY20_CAN_Views_Content_RT%' then 'Video Content - Retargeting'
        when ${adset_name} ilike 'FY20_CAN_Views_Content_VS%' then 'Video Content - Variety Seeker'
        when ${adset_name} ilike 'FY20_CAN_Views_Brand_VS%' then 'Awareness - Variety Seeker'
        when ${adset_name} ilike 'FY20_CAN_Views_Brand_RT%' then 'Awareness - Retargeting'
        when ${adset_name} ilike 'FY20_CAN_Views_Brand_LAL%' then 'Awareness - Lookalikes'
        when ${adset_name} ilike 'FY20_CAN_Clicks_Content_RT%' then 'Traffic Content - Retargeting'
        when ${adset_name} ilike 'FY20_CAN_Clicks_Content_LAL%' then 'Traffic Content - Lookalikes (Site Visitors)'

        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National' then 'Social - Adara Audience'
        when ${campaign_name} = 'SDT_FY20_PullThrough_Conversions_National_Adara' then 'Social - Adara Audience'

        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Macro_VideoViews_Legoland_15Video%' then ':15 Video - Family Variety Seeker'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Macro_VideoViews_Legoland_60Video%' then ':60 Video - Family Variety Seeker'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoTourismAuthority_15Video%' then ':15 Video - Family Variety Seeker'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoTourismAuthority_60Video%' then ':60 Video - Family Variety Seeker'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoZoo_15Video%' then ':15 Video - Family Variety Seeker'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoZoo_60Video%' then ':60 Video - Family Variety Seeker'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Macro_VideoViews_SeaWorld_15Video%' then ':15 Video - Family Variety Seeker'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Macro_VideoViews_SeaWorld_60Video%' then ':60 Video - Family Variety Seeker'

        when ${campaign_name} ilike 'SDT_FY20_FamilyContent_Nano%' then 'Single Image - Micro Retargeting'

        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Micro_Conversions_Legoland_Slideshow%' then 'Slideshow - Macro Retargeting'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Micro_Conversions_Legoland_SingleImage%' then 'Single Image - Macro Retargeting'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Micro_Conversions_Legoland_Carousel%' then 'Carousel - Macro Retargeting'

        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Micro_Conversions_SanDiegoTourismAuthority_Slideshow%' then 'Slideshow - Macro Retargeting'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Micro_Conversions_SanDiegoTourismAuthority_SingleImage%' then 'Single Image - Macro Retargeting'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Micro_Conversions_SanDiegoTourismAuthority_Carousel%' then 'Carousel - Macro Retargeting'

        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Micro_Conversions_SanDiegoZoo_Slideshow%' then 'Slideshow - Macro Retargeting'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Micro_Conversions_SanDiegoZoo_SingleImage%' then 'Single Image - Macro Retargeting'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Micro_Conversions_SanDiegoZoo_Carousel%' then 'Carousel - Macro Retargeting'

        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Micro_Conversions_SeaWorld_Slideshow%' then 'Slideshow - Macro Retargeting'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Micro_Conversions_SeaWorld_SingleImage%' then 'Single Image - Macro Retargeting'
        when ${ad_name} ilike 'SDT_FY20_FamilyContent_Micro_Conversions_SeaWorld_Carousel%' then 'Carousel - Macro Retargeting'

        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Nano%' then 'Traffic - Nano'

        when ${adset_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Conversions_Attractions%' then 'Traffic - Micro NonOutdoor'
        when ${adset_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Conversions_Neighborhood%' then 'Traffic - Micro NonOutdoor'
        when ${adset_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Conversions_Culinary%' then 'Traffic - Micro NonOutdoor'
        when ${adset_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Conversions_Outdoor%' then 'Traffic - Micro Outdoor'

        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_VideoViews_Outdoor%' then 'Video - Macro Outdoor'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_VideoViews_NonOutdoor%' then 'Video - Macro NonOutdoor'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_VideoViews_Neighborhood%' then 'Video - Macro NonOutdoor'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_VideoViews_Culinary%' then 'Video - Macro NonOutdoor'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_VideoViews_Attractions%' then 'Video - Macro NonOutdoor'

        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_Conversions_Outdoor%' then 'Traffic - Macro Outdoor'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_Conversions_NonOutdoor%' then 'Traffic - Macro NonOutdoor'

        when ${adset_name} ilike '%Macro_NonOutdoor_Video%' then 'Video - Macro NonOutdoor'
        when ${adset_name} ilike '%Macro_Outdoor_Video%' then 'Video - Macro Outdoor'

        when ${adset_name} ilike '%Macro_NonOutdoor_Conversion%' then 'Traffic - Macro NonOutdoor'
        when ${adset_name} ilike '%Micro_NonOutdoor_Conversion%' then 'Traffic - Micro NonOutdoor'
        when ${adset_name} ilike '%Macro_Outdoor_Conversion%' then 'Traffic - Macro Outdoor'
        when ${adset_name} ilike '%Micro_Outdoor_Conversion%' then 'Traffic - Micro Outdoor'
        WHEN ${campaign_name} ILIKE 'FY21_SDT_AlwaysOnContentRecovery_Nano_Conversion%%' then 'Traffic - Nano'

        when ${campaign_name} ilike '%FY21_SDT_DriveMarket_Awareness_Stories%' then 'FB/IG Stories'
        when ${campaign_name} ilike '%FY21_SDT_DriveMarket_Conversions%' then 'FB Audience Network Single Image'

        WHEN ${campaign_name} ILIKE 'FY21_SDT_LocalsRecovery%' then 'Single Image Ads (FB/IG Feeds/Stories, IG Explore, In-Article)'

        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting%' then 'Topical Retargeting - Single Image'
        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent_VideoViews_FirstTouch%' then 'First Touch - Video'
        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_FirstTouch%' then 'First Touch - Single Image'

        else 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_pillar {
    label: "Pillar"
    group_label: "Client Dimensions"
    type: string
    sql:
    CASE
      when ${campaign_name} = 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_Arizona' then 'N/A'
      when ${campaign_name} = 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_California' then 'N/A'
      when ${campaign_name} = 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_LosAngeles' then 'N/A'
      when ${campaign_name} = 'FY21_SDT_AlwaysOnContent_VideoViews_FirstTouch_Arizona' then 'N/A'
      when ${campaign_name} = 'FY21_SDT_AlwaysOnContent_VideoViews_FirstTouch_California' then 'N/A'
      when ${campaign_name} = 'FY21_SDT_AlwaysOnContent_VideoViews_FirstTouch_LosAngeles' then 'N/A'
      when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_FirstTouch%' then 'N/A'

      when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Nano%' then 'N/A'
      when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_VideoViews_Outdoor%' then 'Outdoor'
      when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_VideoViews_Neighborhood%' then 'Neighborhood'
      when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_VideoViews_Culinary%' then 'Culinary'
      when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_VideoViews_Attractions%' then 'Attractions'
      when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_Conversions_Outdoor%' then 'Outdoor'

      when ${adset_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Conversions_Outdoor%' then 'Outdoor'
      when ${adset_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Conversions_Neighborhood%' then 'Neighborhood'
      when ${adset_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Conversions_Culinary%' then 'Culinary'
      when ${adset_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Conversions_Attractions%' then 'Attractions'

      when ${ad_name} ilike '%Stories_Culinary%' then 'Culinary'
      when ${ad_name} ilike '%Stories_Attractions%' then 'Attractions'
      when ${ad_name} ilike '%InStream_Culinary%' then 'Culinary'
      when ${ad_name} ilike '%InStream_Attractions%' then 'Attractions'

      when ${ad_name} ilike '%Instagram_Attractions%' then 'Attractions'
      when ${ad_name} ilike '%Instagram_Culinary%' then 'Culinary'
      when ${ad_name} ilike '%Instagram_Neighborhood%' then 'Neighborhood'

      when ${ad_name} ilike '%FacebookAudienceNetwork_Attractions%' then 'Attractions'
      when ${ad_name} ilike '%FacebookAudienceNetwork_Culinary%' then 'Culinary'
      when ${ad_name} ilike '%FacebookAudienceNetwork_Neighborhood%' then 'Neighborhood'

      when ${ad_name} ilike '%Slideshow_Attractions%' then 'Attractions'
      when ${ad_name} ilike '%Slideshow_Culinary%' then 'Culinary'
      when ${ad_name} ilike '%Slideshow_Neighborhood%' then 'Neighborhood'

      when ${ad_name} ilike '%Carousel_Attractions%' then 'Attractions'
      when ${ad_name} ilike '%Carousel_Culinary%' then 'Culinary'
      when ${ad_name} ilike '%Carousel_Neighborhood%' then 'Neighborhood'

      when ${ad_name} ilike '%SingleImage_Attractions%' then 'Attractions'
      when ${ad_name} ilike '%SingleImage_Culinary%' then 'Culinary'
      when ${ad_name} ilike '%SingleImage_Neighborhood%' then 'Neighborhood'

      when ${ad_name} ilike '%_Attractions' then 'Attractions'
      when ${ad_name} ilike '%_Family' then 'Family'
      when ${ad_name} ilike '%_Culinary' then 'Culinary'
      when ${ad_name} ilike '%_Neighborhood' then 'Neighborhood'
      when ${adset_name} ilike '%Macro_Outdoor%' then 'Outdoor'
      when ${adset_name} ilike '%Micro_Outdoor%' then 'Outdoor'

      when ${ad_name} ilike '%_Attractions_NationalCopy' then 'Attractions'
      when ${ad_name} ilike '%_Neighborhood_NationalCopy' then 'Neighborhood'

      WHEN ${campaign_name} ILIKE 'FY21_SDT_AlwaysOnContentRecovery_Nano_Conversion%%' then 'N/A'

      else 'Uncategorized'
        end
        ;;

    }


    dimension: creative_name {
      label: "Creative Name"
      group_label: "Client Dimensions"
      type: string
      sql:
      CASE
        when ${ad_id} = '6145540612895' then 'Smiles - Destination (:15)'
        when ${ad_id} = '6145465999895' then 'Happy Today (:15) - Brand'

        when ${ad_id} = '6145468600295' then 'BB: Mister As (:15)'
        when ${ad_id} = '6145472201095' then 'BB: Surfer Couple (:15)'
        when ${ad_id} = '6145471718695' then 'BB: Torrey Pines (:15)'
        when ${ad_id} = '6145471963495' then 'BB: Coffee Cup Coastal (:15)'
        when ${ad_id} = '6145468172895' then 'Happy Today (:15) - Family'
        when ${ad_id} = '6125364617895' then 'BB: Torrey Pines (:15)'
        when ${ad_id} = '6125364617295' then 'BB: Surfer Couple (:15)'
        when ${ad_id} = '6125364619295' then 'BB: Coffee Cup Coastal (:15)'
        when ${ad_id} = '6125364811695' then 'BB: Mister As (:15)'
        when ${ad_id} = '6124965692695' then 'Happy Today (:15) - Family'
        when ${ad_id} = '6161410795695' then 'Happy Today (:15) - Family'
        when ${ad_id} = '6124964015495' then 'Happy Today (:15) - Brand'
        when ${ad_id} = '6161411294495' then 'Smiles - Destination (:15)'
        when ${ad_id} = '6162106088495' then 'Happy Today (:15) - Brand'
        when ${ad_id} = '6161411295095' then 'BB: Mister As (:15)'
        when ${ad_id} = '6161411295295' then 'BB: Surfer Couple (:15)'
        when ${ad_id} = '6161411294695' then 'BB: Torrey Pines (:15)'
        when ${ad_id} = '6161411294095' then 'BB: Coffee Cup Coastal (:15)'

        when ${ad_name} ilike '%Outdoor_OBI_CoastalYoga_15Seconds' then 'OBI: Coastal Yoga (:15)'
        when ${ad_name} ilike '%Outdoor_OBI_CoastalYoga_60Seconds' then 'OBI: Coastal Yoga (:60)'
        when ${ad_name} ilike '%Outdoor_OBI_BoardwalkCruising_15Seconds' then 'OBI: Boardwalk Cruising (:15)'
        when ${ad_name} ilike '%Outdoor_OBI_BoardwalkCruising_60Seconds' then 'OBI: Boardwalk Cruising (:60)'
        when ${ad_name} ilike '%Outdoor_BlissBreak_SunsetYoga_15Seconds' then 'BB: Sunset Yoga (:15)'
        when ${ad_name} ilike '%Outdoor_BlissBreak_Paragliding_15Seconds_Landscape' then 'BB: Paragliding (:15) - Landscape'
        when ${ad_name} ilike '%Outdoor_BlissBreak_CoupleSUP_15Seconds' then 'BB: Couple SUP (:15)'
        when ${ad_name} ilike '%Outdoor_BlissBreak_CoffeeCup_15Seconds_Landscape' then 'BB: Coffee Cup Coastal (:15) - Landscape'
        when ${ad_name} ilike '%Outdoor_BlissBreak_BeachForTwo_15Seconds_Landscape' then 'BB: Beach For Two (:15) - Landscape'
        when ${ad_name} ilike '%Outdoor_TripAdvisor_TAOutdoor_60Seconds' then 'TripAdvisor Outdoor (:60)'
        when ${ad_name} ilike '%Outdoor_G2GS_SurfingSanDiego_60Seconds_Landscape' then 'G2GS: Surfing San Diego (:60) - Landscape'
        when ${ad_name} ilike '%Outdoor_G2GS_MissionBay_60Seconds_Landscape' then 'G2GS: Mission Bay (:60) - Landscape'
        when ${ad_name} ilike '%Outdoor_G2GS_LaJolla_60Seconds_Landscape' then 'G2GS: La Jolla (:60) - Landscape'

        when ${ad_name} ilike '%Neighborhood_OBI_Tiki_15Seconds' then 'OBI: Tiki (:15)'
        when ${ad_name} ilike '%Neighborhood_OBI_Tiki_60Seconds' then 'OBI: Tiki (:60)'
        when ${ad_name} ilike '%Neighborhood_OBI_LibertyStation_15Seconds' then 'OBI: Liberty Station (:15)'
        when ${ad_name} ilike '%Neighborhood_OBI_LibertyStation_60Seconds' then 'OBI: Liberty Station (:60)'
        when ${ad_name} ilike '%Culinary_OBI_OldTownMexican_15Seconds_Vertical' then 'OBI: Old Town Mexican (:15) - Vertical'
        when ${ad_name} ilike '%Culinary_OBI_OldTownMexican_15Seconds_Landscape' then 'OBI: Old Town Mexican (:15) - Landscape'
        when ${ad_name} ilike '%Culinary_OBI_ConvoyDistrict_15Seconds_Vertical' then 'OBI: Convoy District (:15) - Vertical'
        when ${ad_name} ilike '%Culinary_OBI_ConvoyDistrict_15Seconds_Landscape' then 'OBI: Convoy District (:15) - Landscape'
        when ${ad_name} ilike '%Culinary_OBI_OldTownMexican_60Seconds_Vertical' then 'OBI: Old Town Mexican (:60) - Vertical'
        when ${ad_name} ilike '%Culinary_OBI_OldTownMexican_60Seconds_Landscape' then 'OBI: Old Town Mexican (:60) - Landscape'
        when ${ad_name} ilike '%Culinary_OBI_ConvoyDistrict_60Seconds_Vertical' then 'OBI: Convoy District (:60) - Vertical'
        when ${ad_name} ilike '%Culinary_OBI_ConvoyDistrict_60Seconds_Landscape' then 'OBI: Convoy District (:60) - Landscape'
        when ${ad_name} ilike '%Culinary_DH_BarrioDogg_15Seconds' then 'DH: Barrio Dogg (:15)'
        when ${ad_name} ilike '%Culinary_DH_Animae_15Seconds' then 'DH: Animae (:15)'
        when ${ad_name} ilike '%Culinary_DH_BarrioDogg_30Seconds' then 'DH: Barrio Dogg (:30)'
        when ${ad_name} ilike '%Culinary_DH_Animae_30Seconds' then 'DH: Animae (:30)'
        when ${ad_name} ilike '%Attractions_OBI_USSMidway_15Seconds' then 'OBI: USS Midway (:15)'
        when ${ad_name} ilike '%Attractions_OBI_StuartCollection_15Seconds' then 'OBI: Stuart Collection (:15)'
        when ${ad_name} ilike '%Attractions_OBI_USSMidway_60Seconds' then 'OBI: USS Midway (:60)'
        when ${ad_name} ilike '%Attractions_OBI_StuartCollection_60Seconds' then 'OBI: Stuart Collection (:60)'
        when ${ad_name} ilike '%Attractions_G2GS_LiveMusic_60Seconds' then 'G2GS: Live Music (:60)'
        when ${ad_name} ilike '%Neighborhood_G2GS_BarrioLogan_60Seconds' then 'G2GS: Barrio Logan (:60)'

        when ${ad_name} ilike '%Attractions_OBI_Legoland_15Seconds_Vertical' then 'OBI: LegoLand (:15) - Vertical'
        when ${ad_name} ilike '%Attractions_OBI_Legoland_15Seconds_Square' then 'OBI: LegoLand (:15) - Square'
        when ${ad_name} ilike '%Attractions_OBI_Legoland_15Seconds_Landscape' then 'OBI: LegoLand (:15) - Landscape'
        when ${ad_name} ilike '%Attractions_OBI_Legoland_60Seconds_Landscape' then 'OBI: LegoLand (:60) - Landscape'
        when ${ad_name} ilike '%Attractions_OBI_AfricaRocks_15Seconds_Landscape' then 'OBI: Africa Rocks (:15) - Landscape'
        when ${ad_name} ilike '%Attractions_OBI_AfricaRocks_60Seconds_Landscape' then 'OBI: Africa Rocks (:60) - Landscape'
        when ${ad_name} ilike '%Neighborhood_G2GS_AaronCheng_60Seconds_Landscape' then 'G2GS: Picture Perfect Spots (:60) - Landscape'
        when ${ad_name} ilike '%Neighborhood_G2GS_PicturePerfectSpots_60Seconds_Landscape' then 'G2GS: Picture Perfect Spots (:60)'
        when ${ad_name} ilike '%Attractions_G2GS_PicturePerfectSpots_60Seconds_Landscape' then 'G2GS: Picture Perfect Spots (:60)'
        when ${ad_name} ilike '%Attractions_G2GS_PicturePerfectSpots_60Seconds' then 'G2GS: Picture Perfect Spots (:60)'

        when ${ad_name} ilike '%Neighborhood_TA_OldTown_60Seconds_Landscape w/TA' then 'OBI: Old Town Mexican (w/ TA) (:60) - Landscape'
        when ${ad_name} ilike '%Neighborhood_TA_OldTown_60Seconds_Landscape w/oTA' then 'OBI: Old Town Mexican (w/o TA) (:60) - Landscape'

        when ${ad_name} ilike '%Outdoor_OBI_TorreyPinesGolf_15seconds' then 'OBI: Torrey Pines Golf (:15)'
        when ${ad_name} ilike '%Outdoor_OBI_TorreyPinesGolf_60seconds' then 'OBI: Torrey Pines Golf (:60)'
        when ${ad_name} ilike '%Culinary_DH_Azucar_15seconds' then 'DH: Azucar (:15)'
        when ${ad_name} ilike '%Culinary_DH_Azucar_30seconds' then 'DH: Azucar (:30)'

        when ${ad_name} ilike '%Slideshow_Outdoor_WhaleWatching' then 'Whale Watching Slideshow'
        when ${ad_name} ilike '%Slideshow_Outdoor_Sunny7_Sunsets' then 'S7: Sunsets Slideshow'
        when ${ad_name} ilike '%Slideshow_Outdoor_Sunny7_ScenicHighway' then 'S7: Scenic Highway Slideshow'
        when ${ad_name} ilike '%Slideshow_Outdoor_Sunny7_MakeASplash' then 'S7: Make A Splash Slideshow'
        when ${ad_name} ilike '%Slideshow_Outdoor_LaJollaKayak' then 'La Jolla Kayak Slideshow'
        when ${ad_name} ilike '%Slideshow_Outdoor_G2GS_AlanasFavorites' then 'G2GS: Alana''s Favorites Slideshow'
        when ${ad_name} ilike '%Slideshow_Outdoor_EnjoyTheWater' then 'Enjoy The Water Slideshow'
        when ${ad_name} ilike '%Slideshow_Outdoor_CoastalHikes' then 'S7: Coastal Hikes Slideshow'
        when ${ad_name} ilike '%Slideshow_Outdoor_BoatRides' then 'Boat Rides Slideshow'

        when ${ad_name} ilike '%SingleImage_Outdoor_WhaleWatching' then 'Whale Watching Single Image'
        when ${ad_name} ilike '%SingleImage_Outdoor_Sunny7_Sunsets' then 'S7: Sunsets Single Image'
        when ${ad_name} ilike '%SingleImage_Outdoor_Sunny7_ScenicHighway' then 'S7: Scenic Highway Single Image'
        when ${ad_name} ilike '%SingleImage_Outdoor_Sunny7_MakeASplash' then 'S7: Make A Splash Single Image'
        when ${ad_name} ilike '%SingleImage_Outdoor_LaJollaKayak' then 'La Jolla Kayak Single Image'
        when ${ad_name} ilike '%SingleImage_Outdoor_G2GS_AlanasFavorites' then 'G2GS: Alana''s Favorites Single Image'
        when ${ad_name} ilike '%SingleImage_Outdoor_EnjoyTheWater' then 'Enjoy The Water Single Image'
        when ${ad_name} ilike '%SingleImage_Outdoor_CoastalHikes' then 'S7: Coastal Hikes Single Image'
        when ${ad_name} ilike '%SingleImage_Outdoor_BoatRides' then 'Boat Rides Single Image'

        when ${ad_name} ilike '%Carousel_Outdoor_WhaleWatching' then 'Whale Watching Carousel'
        when ${ad_name} ilike '%Carousel_Outdoor_Sunny7_Sunsets' then 'S7: Sunsets Carousel'
        when ${ad_name} ilike '%Carousel_Outdoor_Sunny7_ScenicHighway' then 'S7: Scenic Highway Carousel'
        when ${ad_name} ilike '%Carousel_Outdoor_Sunny7_MakeASplash' then 'S7: Make A Splash Carousel'
        when ${ad_name} ilike '%Carousel_Outdoor_LaJollaKayak' then 'La Jolla Kayak Carousel'
        when ${ad_name} ilike '%Carousel_Outdoor_G2GS_AlanasFavorites' then 'G2GS: Alana''s Favorites Carousel'
        when ${ad_name} ilike '%Carousel_Outdoor_EnjoyTheWater' then 'Enjoy The Water Carousel'
        when ${ad_name} ilike '%Carousel_Outdoor_CoastalHikes' then 'S7: Coastal Hikes Carousel'
        when ${ad_name} ilike '%Carousel_Outdoor_BoatRides' then 'Boat Rides Carousel'

        when ${ad_name} ilike '%Slideshow_Neighborhood_UTC' then 'UTC Slideshow'
        when ${ad_name} ilike '%Slideshow_Neighborhood_Sunny7_PointLoma' then 'S7: Point Loma Slideshow'
        when ${ad_name} ilike '%Slideshow_Neighborhood_Sunny7_Kensington' then 'S7: Kensington Slideshow'
        when ${ad_name} ilike '%Slideshow_Neighborhood_MissionBay' then 'S7: Mission Bay Slideshow'
        when ${ad_name} ilike '%Slideshow_Neighborhood_BarrioLogan' then 'Barrio Logan Slideshow'

        when ${ad_name} ilike '%Slideshow_Culinary_Sunny7_RooftopRestaurants%' then 'S7: Rooftop Restaurants Slideshow'
        when ${ad_name} ilike '%Slideshow_Culinary_Sunny7_FemalePowerhouses%' then 'S7: Female Powerhouses Slideshow'
        when ${ad_name} ilike '%Slideshow_Culinary_Sunny7_ChefsTableDinigExperience' then 'S7: Chef''s Table Slideshow'
        when ${ad_name} ilike '%Slideshow_Culinary_CulinaryEpicenter' then 'Culinary Epicenter Slideshow'
        when ${ad_name} ilike '%Slideshow_Culinary_BarrioDogg' then 'Barrio Dogg Slideshow'
        when ${ad_name} ilike '%Slideshow_Culinary_Animae' then 'Animae Slideshow'
        when ${ad_name} ilike '%Slideshow_Culinary_CulinaryEpicenter' then 'Culinary Epicenter Slideshow'

        when ${ad_name} ilike '%Slideshow_Attractions_Sunny7_BehindTheScenesTours' then 'S7: Behind The Scenes Tours Slideshow'
        when ${ad_name} ilike '%Slideshow_Attractions_Sunny7_BalboaParkHiddenGems' then 'S7: Balboa Park Hidden Gems Slideshow'
        when ${ad_name} ilike '%Slideshow_Attractions_BalboaParkCulturalHeart' then 'Balboa Park Cultural Heart Slideshow'
        when ${ad_name} ilike '%Slideshow_Attractions_7NaturalWonders' then 'S7: 7 Natural Wonders Slideshow'
        when ${ad_name} ilike '%Slideshow_Attractions_59MileScenicDrive' then '59 Mile Scenic Drive Slideshow'

        when ${ad_name} ilike '%SingleImage_Neighborhood_UTC' then 'UTC Single Image'
        when ${ad_name} ilike '%SingleImage_Neighborhood_Sunny7_PointLoma' then 'S7: Point Loma Single Image'
        when ${ad_name} ilike '%SingleImage_Neighborhood_Sunny7_Kensington' then 'S7: Kensington Single Image'
        when ${ad_name} ilike '%SingleImage_Neighborhood_MissionBay' then 'S7: Mission Bay Single Image'
        when ${ad_name} ilike '%SingleImage_Neighborhood_BarrioLogan' then 'Barrio Logan Single Image'
        when ${ad_name} ilike '%SingleImage_Neighborhood_Sunny7_CharismaticNeighborhoods' then 'S7: Charismatic Neighborhoods Single Image'

        when ${ad_name} ilike '%SingleImage_Culinary_Sunny7_RooftopRestaurants%' then 'S7: Rooftop Restaurants Single Image'
        when ${ad_name} ilike '%SingleImage_Culinary_Sunny7_FemalePowerhouses%' then 'S7: Female Powerhouses Single Image'
        when ${ad_name} ilike '%SingleImage_Culinary_Sunny7_ChefsTableDinigExperience' then 'S7: Chef''s Table Single Image'
        when ${ad_name} ilike '%SingleImage_Culinary_CulinaryEpicenter' then 'Culinary Epicenter Single Image'
        when ${ad_name} ilike '%SingleImage_Culinary_BarrioDogg' then 'Barrio Dogg Single Image'
        when ${ad_name} ilike '%SingleImage_Culinary_Animae' then 'Animae Single Image'
        when ${ad_name} ilike '%SingleImage_Culinary_CulinaryEpicenter' then 'Culinary Epicenter Single Image'

        when ${ad_name} ilike '%SingleImage_Attractions_Sunny7_BehindTheScenesTours' then 'S7: Behind The Scenes Tours Single Image'
        when ${ad_name} ilike '%SingleImage_Attractions_Sunny7_BalboaParkHiddenGems' then 'S7: Balboa Park Hidden Gems Single Image'
        when ${ad_name} ilike '%SingleImage_Attractions_BalboaParkCulturalHeart' then 'Balboa Park Cultural Heart Single Image'
        when ${ad_name} ilike '%_NaturalWonders' then 'S7: 7 Natural Wonders Single Image'
        when ${ad_name} ilike '%SingleImage_Attractions_7NaturalWonders' then 'S7: 7 Natural Wonders Single Image'
        when ${ad_name} ilike '%SingleImage_Attractions_59MileScenicDrive' then '59 Mile Scenic Drive Single Image'

        when ${ad_name} ilike '%Carousel_Neighborhood_UTC' then 'UTC Carousel'
        when ${ad_name} ilike '%Carousel_Neighborhood_Sunny7_PointLoma' then 'S7: Point Loma Carousel'
        when ${ad_name} ilike '%Carousel_Neighborhood_Sunny7_Kensington' then 'S7: Kensington Carousel'
        when ${ad_name} ilike '%Carousel_Neighborhood_MissionBay' then 'S7: Mission Bay Carousel'
        when ${ad_name} ilike '%Carousel_Neighborhood_BarrioLogan' then 'Barrio Logan Carousel'

        when ${ad_name} ilike '%Carousel_Culinary_Sunny7_RooftopRestaurants' then 'S7: Rooftop Restaurants Carousel'
        when ${ad_name} ilike '%Carousel_Culinary_Sunny7_FemalePowerhouses' then 'S7: Female Powerhouses Carousel'
        when ${ad_name} ilike '%Carousel_Culinary_Sunny7_ChefsTableDinigExperience' then 'S7: Chef''s Table Carousel'
        when ${ad_name} ilike '%Carousel_Culinary_CulinaryEpicenter' then 'Culinary Epicenter Carousel'
        when ${ad_name} ilike '%Carousel_Culinary_BarrioDogg' then 'Barrio Dogg Carousel'
        when ${ad_name} ilike '%Carousel_Culinary_Animae' then 'Animae Carousel'
        when ${ad_name} ilike '%Carousel_Culinary_CulinaryEpicenter' then 'Culinary Epicenter Carousel'

        when ${ad_name} ilike '%Carousel_Attractions_Sunny7_BehindTheScenesTours' then 'S7: Behind The Scenes Tours Carousel'
        when ${ad_name} ilike '%Carousel_Attractions_Sunny7_BalboaParkHiddenGems' then 'S7: Balboa Park Hidden Gems Carousel'
        when ${ad_name} ilike '%Carousel_Attractions_BalboaParkCulturalHeart' then 'Balboa Park Cultural Heart Carousel'
        when ${ad_name} ilike '%Carousel_Attractions_7NaturalWonders' then 'S7: 7 Natural Wonders Carousel'
        when ${ad_name} ilike '%Carousel_Attractions_59MileScenicDrive' then '59 Mile Scenic Drive Carousel'

        when ${ad_name} ilike '%Slideshow_Outdoor_WhereToSurf' then 'Where To Surf Slideshow'
        when ${ad_name} ilike '%Slideshow_Outdoor_Watersports' then 'Watersports Slideshow'
        when ${ad_name} ilike '%Slideshow_Outdoor_Sailing' then 'Sailing Slideshow'
        when ${ad_name} ilike '%Slideshow_Outdoor_MelesSurfFaves' then 'Mele''s Surf Faves Slideshow'
        when ${ad_name} ilike '%Slideshow_Outdoor_HistoricHighway101' then 'Historic Highway 101 Slideshow'

        when ${ad_name} ilike '%Slideshow_Neighborhood_MissionValleyOldTown' then 'S7: Mission Valley Old Town Slideshow'
        when ${ad_name} ilike '%Slideshow_Neighborhood_LittleItaly' then 'Little Italy Slideshow'
        when ${ad_name} ilike '%Slideshow_Neighborhood_Gaslamp' then 'Gaslamp Slideshow'
        when ${ad_name} ilike '%Slideshow_Neighborhood_3BeachNeighborhoods' then '3 Beach Neighborhoods Slideshow'

        when ${ad_name} ilike '%Slideshow_Culinary_FiresideMeal' then 'S7: Fireside Meal Slideshow'

        when ${ad_name} ilike '%Slideshow_Attractions_HistoryAdventures' then 'History Adventures Slideshow'
        when ${ad_name} ilike '%Slideshow_Attractions_Embarcadero' then 'Embarcadero Slideshow'
        when ${ad_name} ilike '%Slideshow_Attractions_AwesomeViewpoints' then 'S7: Awesome Viewpoints Slideshow'
        when ${ad_name} ilike '%Slideshow_Attractions_ArchitectureWonders' then 'S7: Architecture Wonders Slideshow'

        when ${ad_name} ilike '%SingleImage_Outdoor_WhereToSurf' then 'Where To Surf Single Image'
        when ${ad_name} ilike '%SingleImage_Outdoor_Watersports' then 'Watersports Single Image'
        when ${ad_name} ilike '%SingleImage_Outdoor_Sailing' then 'Sailing Single Image'
        when ${ad_name} ilike '%SingleImage_Outdoor_MelesSurfFaves' then 'Mele''s Surf Faves Single Image'
        when ${ad_name} ilike '%SingleImage_Outdoor_HistoricHighway101' then 'Historic Highway 101 Single Image'
        when ${ad_name} ilike '%SingleImage_Outdoor_BayshoreBikeway' then 'Bayshore Bikeway Single Image'

        when ${ad_name} ilike '%SingleImage_Neighborhood_MissionValleyOldTown' then 'S7: Mission Valley Old Town Single Image'
        when ${ad_name} ilike '%SingleImage_Neighborhood_LittleItaly' then 'S7: Little Italy Single Image'
        when ${ad_name} ilike '%SingleImage_Neighborhood_Gaslamp' then 'Gaslamp Single Image'
        when ${ad_name} ilike '%SingleImage_Neighborhood_3BeachNeighborhoods' then '3 Beach Neighborhoods Single Image'

        when ${ad_name} ilike '%SingleImage_Culinary_FiresideMeal' then 'S7: Fireside Meal Single Image'
        when ${ad_name} ilike '%SingleImage_Culinary_TacoJoints' then 'Taco Joints Single Image'
        when ${ad_name} ilike '%SingleImage_Culinary_BestBurgers' then 'Best Burgers Single Image'

        when ${ad_name} ilike '%SingleImage_Attractions_HistoryAdventures' then 'History Adventures Single Image'
        when ${ad_name} ilike '%SingleImage_Attractions_Embarcadero' then 'Embarcadero Single Image'
        when ${ad_name} ilike '%SingleImage_Attractions_AwesomeViewpoints' then 'S7: Awesome Viewpoints Single Image'
        when ${ad_name} ilike '%SingleImage_Attractions_ArchitectureWonders' then 'S7: Architecture Wonders Single Image'

        when ${ad_name} ilike '%Carousel_Outdoor_WhereToSurf' then 'Where To Surf Carousel'
        when ${ad_name} ilike '%Carousel_Outdoor_Watersports' then 'Watersports Carousel'
        when ${ad_name} ilike '%Carousel_Outdoor_Sailing' then 'Sailing Carousel'
        when ${ad_name} ilike '%Carousel_Outdoor_MelesSurfFaves' then 'Mele''s Surf Faves Carousel'
        when ${ad_name} ilike '%Carousel_Outdoor_HistoricHighway101' then 'Historic Highway 101 Carousel'

        when ${ad_name} ilike '%Carousel_Neighborhood_MissionValleyOldTown' then 'S7: Mission Valley Old Town Carousel'
        when ${ad_name} ilike '%Carousel_Neighborhood_LittleItaly' then 'S7: Little Italy Carousel'
        when ${ad_name} ilike '%Carousel_Neighborhood_Gaslamp' then 'Gaslamp Carousel'
        when ${ad_name} ilike '%Carousel_Neighborhood_3BeachNeighborhoods' then '3 Beach Neighborhoods Carousel'

        when ${ad_name} ilike '%Carousel_Culinary_FiresideMeal' then 'S7: Fireside Meal Carousel'

        when ${ad_name} ilike '%Carousel_Attractions_HistoryAdventures' then 'History Adventures Carousel'
        when ${ad_name} ilike '%Carousel_Attractions_Embarcadero' then 'Embarcadero Carousel'
        when ${ad_name} ilike '%Carousel_Attractions_AwesomeViewpoints' then 'S7: Awesome Viewpoints Carousel'
        when ${ad_name} ilike '%Carousel_Attractions_ArchitectureWonders' then 'S7: Architecture Wonders Carousel'

        when ${ad_name} ilike '%SingleImage_TorreyPinesNaturalReserve' then 'Torrey Pines Natural Reserve Single Image'
        when ${ad_name} ilike '%SingleImage_TidePools' then 'Tide Pools Single Image'
        when ${ad_name} ilike '%SingleImage_SDSurfScene' then 'SD Surf Scene Single Image'
        when ${ad_name} ilike '%SingleImage_MissionBayBikePath' then 'Mission Bay Bike Path Single Image'
        when ${ad_name} ilike '%SingleImage_MissionBay' then 'Mission Bay Single Image'
        when ${ad_name} ilike '%SingleImage_BestKidBeaches' then 'Best Kid Beaches Single Image'

        when ${ad_name} ilike '%Slideshow_NorthInland' then 'S7: North Inland Slideshow'
        when ${ad_name} ilike '%Slideshow_NorthCoastal' then 'S7: North Coastal Slideshow'
        when ${ad_name} ilike '%SingleImage_NorthInland' then 'S7: North Inland Single Image'
        when ${ad_name} ilike '%SingleImage_NorthCoastal' then 'S7: North Coastal Single Image'
        when ${ad_name} ilike '%SingleImage_LaJolla' then 'S7: La Jolla Single Image'

        when ${ad_name} ilike '%Slideshow_CaliBaja' then 'Cali Baja Slideshow'
        when ${ad_name} ilike '%Slideshow_BestSeafood' then 'Best Seafood Slideshow'
        when ${ad_name} ilike '%Slideshow_AwardWinningChefs' then 'S7: Award Winning Chefs Slideshow'

        when ${ad_name} ilike '%SingleImage_Convoy' then 'Convoy Single Image'
        when ${ad_name} ilike '%SingleImage_BestSeafood' then 'Best Seafood Single Image'
        when ${ad_name} ilike '%SingleImage_AwardWinningChefs' then 'S7: Award Winning Chefs Single Image'

        when ${ad_name} ilike '%SingleImage_MaritimeHeritage' then 'Maritime Heritage Single Image'
        when ${ad_name} ilike '%SingleImage_FamilyTravel' then 'Family Travel Single Image'
        when ${ad_name} ilike '%SingleImage_AwesomeAttractions' then 'Awesome Attractions Single Image'
        when ${ad_name} ilike '%SingleImage_OldTown' then 'Old Town Single Image'
        when ${ad_name} ilike '%SingleImage_BalboaPark' then 'Balboa Park Single Image'

        when ${ad_name} ilike '%Carousel_BestSeafood' then 'Best Seafood Carousel'
        when ${ad_name} ilike '%Carousel_AwardWinningChefs' then 'S7: Award Winning Chefs Carousel'

        when ${ad_name} ilike '%SingleImage_SpringVersion%_Plan' then 'Plan Single Image'
        when ${ad_name} ilike '%SingleImage_SpringVersion%_HappinessAwaits' then 'Happiness Awaits Single Image'

        when ${ad_name} ilike '%\\_SingleImage\\_DadDaughter' then 'Dad & Daughter Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_PoolParty' then 'Pool Party Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_FamilyBeach' then 'Beach Family Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_Dinner' then 'Dinner Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_FriendBeach' then 'Beach Friends Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_RollerGirls' then 'Roller Girls Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_KidsFree' then 'Kids Free Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_Holiday' then 'Holiday Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_FallEventsGeneral%' then 'Fall Events Single Image'

        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_Legoland_60Video_OBI_LegoMovieWorld' then 'Lego Movie World (:60)'
        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_Legoland_15Video_OBI_LegoMovieWorld' then 'Lego Movie World (:15)'

        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoTourismAuthority_15Video_OBI_BirchAquarium' then 'Birch Aquarium (:15)'
        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoTourismAuthority_15Video_OBI_LearnToSurf' then 'Learn to Surf (:15)'
        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoTourismAuthority_60Video_OBI_BirchAquarium' then 'Birch Aquarium (:60)'
        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoTourismAuthority_60Video_OBI_LearnToSurf' then 'Learn to Surf (:60)'

        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoZoo_15Video_OBI_CaravanSafari' then 'Caravan Safari (:15)'
        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoZoo_60Video_OBI_CaravanSafari' then 'Caravan Safari (:60)'

        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SeaWorld_60Video_OBI_SeaWorld' then 'SeaWorld (:60)'
        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SeaWorld_15Video_OBI_SeaWorld' then 'SeaWorld (:15)'

        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoTourismAuthority_15Video_Socks_TorreyPines' then 'SFTSD: Torrey Pines (:15)'
        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoTourismAuthority_60Video_OBI_WhaleWatching' then 'OBI: Whale Watching  (:60)'
        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoTourismAuthority_15Video_Socks_TidePools' then 'SFTSD: Tidepools (:15)'
        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoTourismAuthority_15Video_OBI_WhaleWatching' then 'OBI: Whale Watching (:15)'
        when ${ad_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoTourismAuthority_15Video_Socks_StarOfIndia' then 'SFTSD: Star of India (:15)'

        when ${ad_name} ilike '%\\_Slideshow\\_LegoLandListicle%' then 'LegoLand Listicle Slideshow'
        when ${ad_name} ilike '%\\_Carousel\\_LegoLandListicle%' then 'LegoLand Listicle Carousel'
        when ${ad_name} ilike '%\\_SingleImage\\_LegoLandListicle%' then 'LegoLand Listicle Single Image'

        when ${ad_name} ilike '%\\_Slideshow\\_SeaWorldListicle%' then 'SeaWorld Listicle Slideshow'
        when ${ad_name} ilike '%\\_Carousel\\_SeaWorldListicle%' then 'SeaWorld Listicle Carousel'
        when ${ad_name} ilike '%\\_SingleImage\\_SeaWorldListicle%' then 'SeaWorld Listicle Single Image'

        when ${ad_name} ilike '%\\_Slideshow\\_SanDiegoZooListicle%' then 'San Diego Zoo Listicle Slideshow'
        when ${ad_name} ilike '%\\_Carousel\\_SanDiegoZooListicle%' then 'San Diego Zoo Listicle Carousel'
        when ${ad_name} ilike '%\\_SingleImage\\_SanDiegoZooListicle%' then 'San Diego Zoo Listicle Single Image'

        when ${ad_name} ilike '%\\_Slideshow\\_7Reasons%' then 'S7: 7 Reasons Slideshow'
        when ${ad_name} ilike '%\\_Slideshow\\_KidFocused%' then 'Kid Focused Slideshow'
        when ${ad_name} ilike '%\\_Slideshow\\_FamilyFun%' then 'Family Fun Slideshow'
        when ${ad_name} ilike '%\\_Slideshow\\_EducationDisguised%' then 'Education Disguised Slideshow'

        when ${ad_name} ilike '%\\_SingleImage\\_7Reasons%' then 'S7: 7 Reasons Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_KidFocused%' then 'Kid Focused Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_FamilyFun%' then 'Family Fun Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_EducationDisguised%' then 'Education Disguised Single Image'

        when ${ad_name} ilike '%\\_Carousel\\_7Reasons%' then 'S7: 7 Reasons Carousel'
        when ${ad_name} ilike '%\\_Carousel\\_KidFocused%' then 'Kid Focused Carousel'
        when ${ad_name} ilike '%\\_Carousel\\_FamilyFun%' then 'Family Fun Carousel'
        when ${ad_name} ilike '%\\_Carousel\\_EducationDisguised%' then 'Education Disguised Carousel'

        when ${ad_name} ilike '%\\_SingleImage\\_AwesomeAwaits%' then 'Awesome Awaits Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_BuyOnline%' then 'Buy Online Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_Dolphins%' then 'Dolphins Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_SaveOnline%' then 'Save Online Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_LegoMovieWorld%' then 'Lego Movie World Single Image'

        when ${ad_name} ilike '%\\_SingleImage\\_HotelsResorts%' then 'Hotels & Resorts Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_SaveBig%' then 'Save Big Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_CaravanSafari%' then 'Caravan Safari Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_FlightlineSafari%' then 'Flightline Safari Single Image'
        when ${ad_name} ilike '%\\_SingleImage\\_JungleRopesSafari%' then 'Jungle Ropes Safari Single Image'

        when ${ad_name} ilike '%Carousel_7BoatRides%' then 'S7: Boat Rides Carousel'
        when ${ad_name} ilike '%Carousel_7BTS%' then 'S7: Behind The Scenes Tours Carousel'
        when ${ad_name} ilike '%Carousel_7HiddenGems%' then 'S7: Balboa Park Hidden Gems Carousel'
        when ${ad_name} ilike '%Carousel_7Rooftops%' then 'S7: Rooftop Restaurants Carousel'
        when ${ad_name} ilike '%Carousel_7Splash%' then 'S7: Make A Splash Carousel'
        when ${ad_name} ilike '%Carousel_7Sunsets%' then 'S7: Sunsets Carousel'

        when ${ad_name} ilike '%Carousel_DishingHappiness_Animae%' then 'DH: Animae Carousel'
        when ${ad_name} ilike '%Carousel_DishingHappiness_BarioDogg%' then 'DH: Barrio Dogg Carousel'
        when ${ad_name} ilike '%Carousel_DishingHappiness_BarrioDogg%' then 'DH: Barrio Dogg Carousel'
        when ${ad_name} ilike '%Carousel_Neighborhoods' then 'Neighborhoods Carousel'

        when ${ad_name} ilike '%SingleImage_7BoatRides%' then 'S7: Boat Rides Single Image'
        when ${ad_name} ilike '%SingleImage_7BTS%' then 'S7: Behind The Scenes Tours Single Image'
        when ${ad_name} ilike '%SingleImage_7HiddenGems%' then 'S7: Balboa Park Hidden Gems Single Image'
        when ${ad_name} ilike '%SingleImage_7Rooftops%' then 'S7: Rooftop Restaurants Single Image'
        when ${ad_name} ilike '%SingleImage_7Splash%' then 'S7: Make A Splash Single Image'
        when ${ad_name} ilike '%SingleImage_7Sunsets%' then 'S7: Sunsets Single Image'
        when ${ad_name} ilike '%SingleImage_7Wonders%' then 'S7: 7 Wonders Single Image'

        when ${ad_name} ilike '%SingleImage_DishingHappiness_Animae%' then 'DH: Animae Single Image'
        when ${ad_name} ilike '%SingleImage_DishingHappiness_BarioDogg%' then 'DH: Barrio Dogg Single Image'
        when ${ad_name} ilike '%SingleImage_DishingHappiness_BarrioDogg%' then 'DH: Barrio Dogg Single Image'
        when ${ad_name} ilike '%SingleImage_Neighborhoods' then 'Neighborhoods Single Image'

        when ${ad_name} = 'FY20_CAN_Views_Brand_LAL_SomethingToSmileAbout' then 'Something To Smile About (:15)'
        when ${ad_name} = 'FY20_CAN_Views_Brand_VS_SomethingToSmileAbout' then 'Something To Smile About (:15)'

        when ${ad_name} = 'FY20_CAN_Views_Content_RT_OBI_CoastalYoga' then 'OBI: Coastal Yoga (:15)'
        when ${ad_name} = 'FY20_CAN_Views_Content_RT_OBI_OldTown' then 'OBI: Old Town Mexican (:15)'
        when ${ad_name} = 'FY20_CAN_Views_Content_VS_OBI_CoastalYoga' then 'OBI: Coastal Yoga (:15)'
        when ${ad_name} = 'FY20_CAN_Views_Content_VS_OBI_OldTown' then 'OBI: Old Town Mexican (:15)'

        when ${ad_name} = 'FY20_UK_Views_Content_RT_DishingHappiness_Animae_15s' then 'DH: Animae (:15)'
        when ${ad_name} = 'FY20_UK_Views_Content_VS_DishingHappiness_Animae_15s' then 'DH: Animae (:15)'

        when ${ad_name} = 'FY20_UK_Views_Content_RT_DishingHappiness_BarrioDogg_15s' then 'DH: Barrio Dogg (:15)'
        when ${ad_name} = 'FY20_UK_Views_Content_VS_DishingHappiness_BarrioDogg_15s' then 'DH: Barrio Dogg (:15)'

        when ${ad_name} = 'FY20_UK_Views_Content_RT_CoastalYoga' then 'OBI: Coastal Yoga (:15)'
        when ${ad_name} = 'FY20_UK_Views_Content_RT_LibertyStation' then 'OBI: Liberty Station (:15)'
        when ${ad_name} = 'FY20_UK_Views_Content_RT_OldTown' then 'OBI: Old Town Mexican (:15)'
        when ${ad_name} = 'FY20_UK_Views_Content_RT_USSMidway' then 'OBI: USS Midway (:15)'
        when ${ad_name} = 'FY20_UK_Views_Content_VS_CoastalYoga' then 'OBI: Coastal Yoga (:15)'
        when ${ad_name} = 'FY20_UK_Views_Content_VS_LibertyStation' then 'OBI: Liberty Station (:15)'
        when ${ad_name} = 'FY20_UK_Views_Content_VS_OldTown' then 'OBI: Old Town Mexican (:15)'
        when ${ad_name} = 'FY20_UK_Views_Content_VS_USSMidway' then 'OBI: USS Midway (:15)'

        when ${ad_name} = 'FY20_UK_Views_Brand_LAL_SiteVisitors_HappyToday' then 'Happy Today (:15)'
        when ${ad_name} = 'FY20_UK_Views_Brand_VS_HappyToday' then 'Happy Today (:15)'
        when ${ad_name} = 'FY20_UK_Views_Brand_LAL_USContentViewers_HappyToday' then 'Happy Today (:15)'

        when ${ad_name} ilike '%TAOutdoor60' then 'Co-Branded TripAdvisor Outdoor Pillar Video (:60)'
        when ${ad_name} ilike '%OBICoastalYoga60' then 'OBI: Coastal Yoga (:60)'
        when ${ad_name} ilike '%OBIBoardwalk60' then 'OBI: Boardwalk Cruising (:60)'
        when ${ad_name} ilike '%OBIBoardwalk15' then 'OBI: Boardwalk Cruising (:15)'
        when ${ad_name} ilike '%OBI_BoardwalkCruising15' then 'OBI: Boardwalk Cruising (:15)'
        when ${ad_name} ilike '%OBI_BoardwalkCruising60' then 'OBI: Boardwalk Cruising (:60)'

        when ${ad_name} ilike '%G2GSSurfing60' then 'G2GS: Surfing San Diego (:60)'
        when ${ad_name} ilike '%G2GSMissionBay60' then 'G2GS: Mission Bay (:60)'
        when ${ad_name} ilike '%G2GS_MissionBay' then 'G2GS: Mission Bay (:60)'
        when ${ad_name} ilike '%G2GSLaJolla60' then 'G2GS: La Jolla (:60)'
        when ${ad_name} ilike '%G2GS_LaJolla' then 'G2GS: La Jolla (:60)'

        when ${ad_name} ilike '%BBYoga15' then 'BB: Yoga (:15)'
        when ${ad_name} ilike '%BBParagliding30' then 'BB: Paragliding (:30)'
        when ${ad_name} ilike '%BBPaddleBoard15' then 'BB: Paddle Board (:15)'
        when ${ad_name} ilike '%BBCoffee30' then 'BB: Coffee Cup Coastal (:30)'
        when ${ad_name} ilike '%BBCoffee15' then 'BB: Coffee Cup Coastal (:15)'
        when ${ad_name} ilike '%BBBeach30' then 'BB: Beach For 2 (:30)'
        when ${ad_name} ilike '%BBBeach15' then 'BB: Beach For 2 (:15)'

        when ${ad_name} ilike '%TACulinary60%' then 'TripAdvisor Culinary (:60)'
        when ${ad_name} ilike '%TABalboaPark60%' then 'TripAdvisor: Balboa Park Culture (:60)'
        when ${ad_name} ilike '%SocksTorreyPines15%' then 'Socks: Torrey Pines (:15)'
        when ${ad_name} ilike '%SocksTidepools15%' then 'Socks: Tidepooling (:15)'
        when ${ad_name} ilike '%SockStarofIndia60%' then 'Socks: Star of India (:60)'
        when ${ad_name} ilike '%SocksStarofIndia15%' then 'Socks: Star of India (:15)'
        when ${ad_name} ilike '%SocksSeaWorld60%' then 'Socks: SeaWorld (:60)'
        when ${ad_name} ilike '%SocksSafariPark60%' then 'Socks: Safari Park (:60)'
        when ${ad_name} ilike '%SocksLegoland60%' then 'Socks: LEGOLAND (:60)'

        when ${ad_name} ilike '%OBITortillasMargs60%' then 'OBI: Tortillas and Margs (:60)'
        when ${ad_name} ilike '%OBITortillasMargs15%' then 'OBI: Tortillas and Margs (:15)'
        when ${ad_name} ilike '%OBIStuart60%' then 'OBI: Stuart Collection (:60)'
        when ${ad_name} ilike '%OBIMidway60%' then 'OBI: USS Midway (:60)'
        when ${ad_name} ilike '%OBILibertyStation60%' then 'OBI: Liberty Station (:60)'
        when ${ad_name} ilike '%OBILibertyStation15%' then 'OBI: Liberty Station (:15)'
        when ${ad_name} ilike '%OBI_LibertyStation60' then 'OBI: Liberty Station (:60)'
        when ${ad_name} ilike '%OBI_LibertyStation15' then 'OBI: Liberty Station (:15)'
        when ${ad_name} ilike '%OBILegoSub60%' then 'OBI: LEGO Submarine (:60)'
        when ${ad_name} ilike '%OBILearnToSurf60%' then 'OBI: Learn to Surf (:60)'
        when ${ad_name} ilike '%OBILearnToSurf15%' then 'OBI: Learn to Surf (:15)'
        when ${ad_name} ilike '%OBIGolf60%' then 'OBI: Torrey Pines Golf (:60)'
        when ${ad_name} ilike '%OBI_TorreyPinesGolf60' then 'OBI: Torrey Pines Golf (:60)'
        when ${ad_name} ilike '%OBIGolf15%' then 'OBI: Torrey Pines Golf (:15)'
        when ${ad_name} ilike '%OBI_TorreyPinesGolf15%' then 'OBI: Torrey Pines Golf (:15)'
        when ${ad_name} ilike '%OBIConvoyDesserts60%' then 'OBI: Convoy District Desserts (:60)'
        when ${ad_name} ilike '%OBIConvoyDesserts15%' then 'OBI: Convoy District Desserts (:15)'
        when ${ad_name} ilike '%OBICaliforniaTower60%' then 'OBI: California Tower (:60)'
        when ${ad_name} ilike '%OBIBirchAquarium60%' then 'OBI: Birch Aquarium (:60)'
        when ${ad_name} ilike '%OBIAfricaRocks60%' then 'OBI: Africa Rocks (:60)'
        when ${ad_name} ilike '%OBIAfricaRocks15%' then 'OBI: Africa Rocks (:15)'
        when ${ad_name} ilike '%OBI_AfricaRocks60' then 'OBI: Africa Rocks (:60)'
        when ${ad_name} ilike '%OBI_AfricaRocks15' then 'OBI: Africa Rocks (:15)'
        when ${ad_name} ilike '%OBISafariPark60%' then 'OBI: Safari Park (:60)'
        when ${ad_name} ilike '%OBICoastalYoga15' then 'OBI: Coastal Yoga (:15)'
        when ${ad_name} ilike '%OBIMidway15%' then 'OBI: USS Midway (:15)'

        when ${ad_name} ilike '%G2GSPicturePerfect60%' then 'G2GS: Picture Perfect Spots (:60)'
        when ${ad_name} ilike '%G2GSBarrioLogan60%' then 'G2GS: Barrio Logan (:60)'
        when ${ad_name} ilike '%G2GS_Surfing' then 'G2GS: Surfing (:60)'

        when ${ad_name} ilike '%DHRealm30%' then 'DH: Realm of the 52 Remedies (:30)'
        when ${ad_name} ilike '%DHRealm15%' then 'DH: Realm of the 52 Remedies (:15)'
        when ${ad_name} ilike '%DHMantra%' then 'DH: Mantra (Longform)'
        when ${ad_name} ilike '%DHBarrioDogg60%' then 'DH: Barrio Dogg (:60)'
        when ${ad_name} ilike '%DHBarrioDogg30%' then 'DH: Barrio Dogg (:30)'
        when ${ad_name} ilike '%DH_BarrioDogg30' then 'DH: Barrio Dogg (:30)'
        when ${ad_name} ilike '%DH_BarrioDogg15' then 'DH: Barrio Dogg (:15)'
        when ${ad_name} ilike '%DHBarrioDogg15%' then 'DH: Barrio Dogg (:15)'
        when ${ad_name} ilike '%DHAzucar30%' then 'DH: Azucar (:30)'
        when ${ad_name} ilike '%DHAzucar15%' then 'DH: Azucar (:15)'
        when ${ad_name} ilike '%DHAnimae30%' then 'DH: Animae (:30)'
        when ${ad_name} ilike '%Animae15%' then 'DH: Animae (:15)'

        when ${ad_name} ilike '%_TorreyPines' then 'WC: Torrey Pines'
        when ${ad_name} ilike '%_LeopardSharks' then 'WC: Swimming with Leopard Sharks'
        when ${ad_name} ilike '%SDTidePools' then 'WC: SD Tide Pools: Exploring Life at the Edge of the Sea'
        when ${ad_name} ilike '%Socks_TidePools' then 'SFTSD: Tidepools (:15)'
        when ${ad_name} ilike '%_Sailing' then 'WC: Sailing in San Diego'
        when ${ad_name} ilike '%_MissionBayBeaches' then 'WC: Mission Bay & Beaches'
        when ${ad_name} ilike '%_MeleSurfFaves' then 'WC: Mele Sali''s Surf Faves'
        when ${ad_name} ilike '%_LaJollaBeaches' then 'WC: La Jolla Beaches'
        when ${ad_name} ilike '%_HistoricHighway101' then 'WC: Historic Highway 101'
        when ${ad_name} ilike '%_GuidetoSDBeaches' then 'WC: Guide to San Diego Beaches'
          when ${ad_name} ilike '%SocalVibe%' then 'WC: 3 Beach Neighborhoods w/ SoCal Vibe'
          when ${ad_name} ilike '%_Sunny7MissionValleyOldTown%' then 'S7: Mission Valley/Old Town'
          when ${ad_name} ilike '%_Sunny7MissionBay%' then 'S7: Mission Bay'
          when ${ad_name} ilike '%_Sunny7NorthCoastal%' then 'S7: North Coastal'
          when ${ad_name} ilike '%_Sunny7NorthInland%' then 'S7: North Inland'
          when ${ad_name} ilike '%_Sunny7PointLoma%' then 'S7: Point Loma'
          when ${ad_name} ilike '%_Sunny7NaturalWonders%' then 'S7: Natural Wonders'
          when ${ad_name} ilike '%_Sunny7LocalMarkets%' then 'S7: Local Markets'
          when ${ad_name} ilike '%_Sunny7BotanicalGardens%' then 'S7: Botanical Gardens'
          when ${ad_name} ilike '%_Sunny7RooftopRestaurants%' then 'S7: Rooftop Restaurants'
          when ${ad_name} ilike '%_Sunny7BeachfrontBars%' then 'S7: Beachfront Bars'
          when ${ad_name} ilike '%_Sunny7AwardWinningRestaurants%' then 'S7: Award Winning Restaurants & Chefs'
          when ${ad_name} ilike '%_Sunny7ArtOutsideTheBox%' then 'S7: Art Outside the Box'
          when ${ad_name} ilike '%PacificBeach%' then 'WC: Pacific Beach'
          when ${ad_name} ilike '%BirdRock%' then 'WC: Bird Rock'
          when ${ad_name} ilike '%_Sunny7Reasons%' then 'S7: Reasons to Bring the Family'
          when ${ad_name} ilike '%Onedayitinerary%' then 'One-Day Itinerary'
          when ${ad_name} ilike '%AwesomeMuseums%' then 'Awesome Museums'
          when ${ad_name} ilike '%25FreeFunThings%' then 'WC: 25 Fun & Free Things to do'
          when ${ad_name} ilike '%15SanDiegoPlaygrounds%' then 'WC: 15 San Diego Playgrounds'
          when ${ad_name} ilike '%13Kidneighborhoods%' then 'WC: 13 Kid-Pleasing Neighborhoods'
          when ${ad_name} ilike '%BestBeaches%' then 'WC: The Best Beaches According to Kids'
          when ${ad_name} ilike '%Familyfun%' then 'WC: Family Fun in San Diego'
          when ${ad_name} ilike '%Edutainment%' then 'Edutainment'
          when ${ad_name} ilike '%KidApprovedParks%' then 'WC: 9 Kid Approved Parks'
          when ${ad_name} ilike '%FoodieFinds%' then 'WC: Foodie Finds'
          when ${ad_name} ilike '%Azcuar%' then 'WC: Azucar'
          when ${ad_name} ilike '%ArtFilledDay%' then 'One Perfect Art Filled Day'
          when ${ad_name} ilike '%FoodTruckRevolution%' then 'Food Truck Revolution'
          when ${ad_name} ilike '%CrossBorderCuisine%' then 'WC: Cross-Border Cuisine'
          when ${ad_name} ilike '%SeafoodRestaurants%' then 'WC: Best Seafood Restaurants'
          when ${ad_name} ilike '%Realmof52Remedies%' then 'WC: Realm of the 52 Remedies'
          when ${ad_name} ilike '%59MileScenicDrive%' then 'WC: San Diego''s 59 Mile Scenic Drive'
          when ${ad_name} ilike '%Sunny7HiddenGems%' then 'S7: Balboa Park Hidden Gems'
          when ${ad_name} ilike '%Sunny7Viewpoints%' then 'S7: Awesome San Diego Viewpoints'
          when ${ad_name} ilike '%_ScenicViewpoints' then 'S7: Awesome San Diego Viewpoints'
          when ${ad_name} ilike '%_LocalMarkets' then 'S7: 7 Local Markets'
          when ${ad_name} ilike '%BalboaParkCulturalHeart%' then 'WC: Balboa Park - Cultural Heart'
          when ${ad_name} ilike '%Sunny7makeaSplash%' then 'S7: Make A Splash'
          when ${ad_name} ilike '%Sunny7Sunsets%' then 'S7: Sunsets'
          when ${ad_name} ilike '%LaJollaKayak%' then 'WC: Explore La Jolla on a Kayak Tour'
          when ${ad_name} ilike '%BayshoreBikeway%' then 'WC: Bayshore Bikeway'
          when ${ad_name} ilike '%ScenicHighway101%' then 'S7: 7 Things to Do Along Scenic CA Highway 101'
          when ${ad_name} ilike '%CoastalHikes' then 'S7: 7 Star Coastal Hikes'
          when ${ad_name} ilike 'FY21_SDT_AlwaysOnContentRecovery_Macro_Outdoor_Conversion_LADMA_CoastalHikes_NationalCopy' then 'S7: 7 Star Coastal Hikes'
          when ${ad_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_FirstTouch_%_PicnicSpots' then 'S7: Picnic Spots'

          when ${ad_name} = 'FY21_SDT_AlwaysOnContentRecovery_Macro_NonOutdoor_Video_California_OBIBirchAquarium15_Family' then 'OBI: Birch Aquarium (:15)'
          when ${ad_name} = 'FY21_SDT_AlwaysOnContentRecovery_Macro_NonOutdoor_Video_LADMA_OBIBirchAquarium15_Family' then 'OBI: Birch Aquarium (:15)'
          when ${ad_name} = 'FY21_SDT_AlwaysOnContentRecovery_Macro_NonOutdoor_Video_PHXTUCDMA_OBIBirchAquarium15_Family' then 'OBI: Birch Aquarium (:15)'

          when ${ad_name} ilike '%SurferGirl' then 'Surfer Girl Single Image'
          when ${ad_name} ilike '%SurferCoast' then 'Surfer Coast Single Image'
          when ${ad_name} ilike '%Surfers' then 'Surfers Single Image'

          when ${ad_name} ilike 'FY21_SDT_DriveMarket_Awareness_Stories_Tucson_HICYB' then 'Happiness Is Calling You Back (:30)'
          when ${ad_name} ilike 'FY21_SDT_DriveMarket_Awareness_Stories_Phoenix_HICYB' then 'Happiness Is Calling You Back (:30)'
          when ${ad_name} ilike 'FY21_SDT_DriveMarket_Awareness_Stories_California_HICYB' then 'Happiness Is Calling You Back (:30)'

          when ${ad_name} ilike 'FY21_SDT_DriveMarket_Awareness_Stories_Tucson' then 'Drive Market IG Story'
          when ${ad_name} ilike 'FY21_SDT_DriveMarket_Awareness_Stories_Phoenix' then 'Drive Market IG Story'
          when ${ad_name} ilike 'FY21_SDT_DriveMarket_Awareness_Stories_California' then 'Drive Market IG Story'

          when ${ad_name} ilike '%Stories_Tucson_KidsFree_2' then 'Kids Free IG Story v2'
          when ${ad_name} ilike '%Stories_Tucson_KidsFree_1' then 'Kids Free IG Story v1'
          when ${ad_name} ilike '%Stories_Phoenix_KidsFree_2' then 'Kids Free IG Story v2'
          when ${ad_name} ilike '%Stories_Phoenix_KidsFree_1' then 'Kids Free IG Story v1'
          when ${ad_name} ilike '%Stories_California_KidsFree_2' then 'Kids Free IG Story v2'
          when ${ad_name} ilike '%Stories_California_KidsFree_1' then 'Kids Free IG Story v1'

          when ${ad_name} ilike '%Stories_Tucson_Weekyay_Parallax' then 'WeekYay IG Story: Parallax'
          when ${ad_name} ilike '%Stories_Tucson_Weekyay_Animated' then 'WeekYay IG Story: Animated'
          when ${ad_name} ilike '%Stories_Phoenix_Weekyay_Parallax' then 'WeekYay IG Story: Parallax'
          when ${ad_name} ilike '%Stories_Phoenix_Weekyay_Animated' then 'WeekYay IG Story: Animated'
          when ${ad_name} ilike '%Stories_California_Weekyay_Parallax' then 'WeekYay IG Story: Parallax'
          when ${ad_name} ilike '%Stories_California_Weekyay_Animated' then 'WeekYay IG Story: Animated'

          when ${ad_name} ilike '%_PullThroughLandingPage' then 'Nano Traffic: PullThrough LP'
          when ${ad_name} ilike '%_HotelsLandingPage' then 'Nano Traffic: Hotels LP'
          when ${ad_name} ilike '%_LASpecificLandingPage' then 'Nano Traffic: LA-Specific LP'

          when ${ad_name} ilike '%_KidsFree_Safari' then 'Kids Free: Safari Single Image'
          when ${ad_name} ilike '%_KidsFree_Cannonball' then 'Kids Free: Cannonball Single Image'

          when ${ad_name} ilike '%SingleImage_Weekyay_WorkFromHotel' then 'WeekYay: Work From Hotel Single Image'
          when ${ad_name} ilike '%SingleImage_Weekyay_OutdoorDining' then 'WeekYay: Outdoor Dining Single Image'
          when ${ad_name} ilike '%SingleImage_Weekyay_LowerRateHotel' then 'WeekYay: Lower Rate Hotel Single Image'
          when ${ad_name} ilike '%SingleImage_Weekyay_LowerRateActivity' then 'WeekYay: Lower Rate Activity Single Image'
          when ${ad_name} ilike '%SingleImage_Weekyay_LessCrowds' then 'WeekYay: Less Crowds Single Image'
          when ${ad_name} ilike '%SingleImage_Weekyay_HomeSchool' then 'WeekYay: Home School Single Image'

          when ${ad_name} ilike 'FY21_SDT_LocalsRecovery_Awareness_Poolside_Square' then 'Poolside Square Single Image'
          when ${ad_name} ilike 'FY21_SDT_LocalsRecovery_Awareness_Poolside_Horizontal' then 'Poolside Landscape Single Image'
          when ${ad_name} ilike 'FY21_SDT_LocalsRecovery_Awareness_Beach_Square' then 'Beach Square Single Image'
          when ${ad_name} ilike 'FY21_SDT_LocalsRecovery_Awareness_Beach_Horizontal' then 'Beach Landscape Single Image'

          when ${ad_name} ilike '%BlissBreak_PaddleBoard' then 'BB: Paddle Board (:15)'
          when ${ad_name} ilike '%BlissBreak_Paragliding' then 'BB: Paragliding (:15)'
          when ${ad_name} ilike '%BlissBreak_BeachForTwo' then 'BB: Beach For Two (:15)'
          when ${ad_name} ilike '%BlissBreak_SunsetYoga' then 'BB: Sunset Yoga (:15)'
          when ${ad_name} ilike '%BlissBreak_CoffeeCupCoastal' then 'BB: Coffee Cup Coastal (:15)'
          when ${ad_name} ilike '%BlissBreak_PaddleBoard' then 'BB: Paddle Board (:15)'
          when ${ad_name} ilike '%BlissBreak_PaddleBoard' then 'BB: Paddle Board (:15)'

          when ${ad_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_%_PlanNow2' then 'WC: Plan Now v2 Single Image'
          when ${ad_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_%_PlanNow1' then 'WC: Plan Now v1 Single Image'
          when ${ad_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_%_OutdoorDining2' then 'WC: Outdoor Dining v2 Single Image'
          when ${ad_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_%_OutdoorDining1' then 'WC: Outdoor Dining v1 Single Image'
          when ${ad_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_%_BookNow1' then 'WC: Book Now v2 Single Image'
          when ${ad_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_%_BookNow2' then 'WC: Book Now v1 Single Image'
          when ${ad_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_%_SafeTravelerContent1' then 'WC: Safe Traveler Content v2 Single Image'
          when ${ad_name} ilike 'FY21_SDT_AlwaysOnContent_Conversion_Retargeting_%_SafeTravelerContent2' then 'WC: Safe Traveler Content v1 Single Image'

          when ${ad_name} ilike 'FY21_SDT_SpringAwareness_Conversion_SingleIamge_%_HICYB_BookHotel' then 'Book Hotel Single Image'
          when ${ad_name} ilike 'FY21_SDT_SpringAwareness_Conversion_SingleIamge_%_HICYB_PlanNow' then 'Plan Now Single Image'
          when ${ad_name} ilike '%SingleImage_%_WeekYayCreativeTest_WorkFromHotel' then 'WeekYay: Work From Hotel Single Image'
          when ${ad_name} ilike '%SingleImage_%_WeekYayCreativeTest_OutdoorDining' then 'WeekYay: Outdoor Dining Single Image'
          when ${ad_name} ilike '%SingleImage_%_WeekYayCreativeTest_LowerRateHotel' then 'WeekYay: Lower Rate Hotel Single Image'
          when ${ad_name} ilike '%SingleImage_%_WeekYayCreativeTest_LowerRateActivity' then 'WeekYay: Lower Rate Activity Single Image'
          when ${ad_name} ilike '%SingleImage_%_WeekYayCreativeTest_LessCrowds' then 'WeekYay: Less Crowds Single Image'
          when ${ad_name} ilike '%SingleImage_%_WeekYayCreativeTest_HomeSchool' then 'WeekYay: Home School Single Image'

          when ${ad_name} ilike '%WeekYay_WorkFromHotel' then 'WeekYay: Work From Hotel Single Image'
          when ${ad_name} ilike '%WeekYay_OutdoorDining' then 'WeekYay: Outdoor Dining Single Image'
          when ${ad_name} ilike '%WeekYay_LowerRateHotel' then 'WeekYay: Lower Rate Hotel Single Image'
          when ${ad_name} ilike '%WeekYay_LowerRateActivity' then 'WeekYay: Lower Rate Activity Single Image'
          when ${ad_name} ilike '%WeekYay_LessCrowds' then 'WeekYay: Less Crowds Single Image'
          when ${ad_name} ilike '%WeekYay_HomeSchool' then 'WeekYay: Home School Single Image'
          when ${ad_name} ilike '%WeekYay_Animated' then 'WeekYay: Animated Story'
          when ${ad_name} ilike '%WeekYay_Parallax' then 'WeekYay: Parallax Story'

          when ${ad_name} ilike '%Spring_Baycycle' then 'HICYB: Baycycle Single Image'
          when ${ad_name} ilike '%Spring_FamilyHammock' then 'HICYB: Family Hammock Single Image'
          when ${ad_name} ilike '%Spring_windansea' then 'HICYB: Wind & Sea Single Image'
          when ${ad_name} ilike '%Spring_Hotel' then 'HICYB: Hotel Single Image'

          when ${ad_name} ilike 'FY21_SDT_SpringAwareness_Awareness_Stories_%_WeekYayCreativeTest_Parallax' then 'WeekYay: Parallax Story'
          when ${ad_name} ilike 'FY21_SDT_SpringAwareness_Awareness_Stories_%_WeekYayCreativeTest_Animated' then 'WeekYay: Animated Story'
          when ${ad_name} ilike 'FY21_SDT_SpringAwareness_Awareness_Stories_%_HICYB_Video' then 'Happiness Is Calling You Back (:15)'
          when ${ad_name} ilike 'FY21_SDT_SpringAwareness_Awareness_Stories_%_HICYB_Animated' then 'HICYB: Animated Story'

        else 'Uncategorized'
        end
        ;;
    }

    dimension: sdt_partner {
      type: string
      group_label: "Client Dimensions"
      label: "SDT Partner (Fam. Content)"
      sql:
          case
            when ${campaign_name} = 'SDT_FY20_FamilyContent_Nano_Conversions_SeaWorld' then 'SeaWorld'
            when ${campaign_name} = 'SDT_FY20_FamilyContent_Nano_Conversions_SanDiegoZoo' then 'San Diego Zoo'
            when ${campaign_name} = 'SDT_FY20_FamilyContent_Nano_Conversions_SanDiegoTourismAuthority' then 'San Diego Tourism'
            when ${campaign_name} = 'SDT_FY20_FamilyContent_Nano_Conversions_Legoland' then 'LegoLand'

            when ${campaign_name} = 'SDT_FY20_FamilyContent_Micro_Conversions_SeaWorld' then 'SeaWorld'
            when ${campaign_name} = 'SDT_FY20_FamilyContent_Micro_Conversions_SanDiegoZoo' then 'San Diego Zoo'
            when ${campaign_name} = 'SDT_FY20_FamilyContent_Micro_Conversions_SanDiegoTourismAuthority' then 'San Diego Tourism'
            when ${campaign_name} = 'SDT_FY20_FamilyContent_Micro_Conversions_Legoland' then 'LegoLand'

            when ${campaign_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SeaWorld' then 'SeaWorld'
            when ${campaign_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoZoo' then 'San Diego Zoo'
            when ${campaign_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_SanDiegoTourismAuthority' then 'San Diego Tourism'
            when ${campaign_name} = 'SDT_FY20_FamilyContent_Macro_VideoViews_Legoland' then 'LegoLand'

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


##### All Dimensions go below #####

  dimension: account_id {
    type: number
    group_label: "Facebook IDs"
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.account_name ;;
  }

  dimension: ad_id {
    type: string
    group_label: "Facebook IDs"
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.ad_name ;;
  }

  dimension: adset_id {
    type: number
    group_label: "Facebook IDs"
    label: "Ad Set ID"
    sql: ${TABLE}.adset_id ;;
  }

  dimension: adset_name {
    type: string
    group_label: "Facebook Dimensions"
    label: "Ad Set Name"
    sql: ${TABLE}.adset_name ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: buying_type {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.buying_type ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "Facebook IDs"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension_group: date_start {
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
    sql: ${TABLE}.date_start ;;
  }

  dimension_group: date_stop {
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
    sql: ${TABLE}.date_stop ;;
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

  dimension: inline_link_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.inline_link_clicks ;;
  }

  dimension: inline_post_engagement {
    type: number
    hidden: yes
    sql: ${TABLE}.inline_post_engagement ;;
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

  dimension: objective {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.objective ;;
  }

  dimension: pageviews {
    type: number
    hidden: yes
    sql: ${TABLE}.pageviews ;;
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

  dimension: spend {
    type: number
    hidden: yes
    sql: ${TABLE}.spend ;;
  }

  dimension: thruplays {
    type: number
    hidden: yes
    sql: ${TABLE}.thruplays ;;
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

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

  dimension: views_to_100 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_100 ;;
  }

  dimension: views_to_25 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_25 ;;
  }

  dimension: views_to_50 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_50 ;;
  }

  dimension: views_to_75 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_75 ;;
  }

  dimension: views_to_95 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_95 ;;
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


####### Meausures go below ######

  measure: total_impressions {
    type: sum_distinct
    group_label: "Facebook Delivery"
    sql_distinct_key: ${ga_join_id} ;;
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "Facebook Delivery"
    sql_distinct_key: ${ga_join_id} ;;
    label: "Clicks"
    sql: ${inline_link_clicks} ;;
  }

  measure: click_through_rate {
    type: number
    group_label: "Facebook Delivery"
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_spend {
    type: sum_distinct
    group_label: "Facebook Delivery"
    sql_distinct_key: ${ga_join_id} ;;
    label: "Media Spend"
    sql: ${spend};;
    value_format_name: usd
  }

  measure: cost_per_click {
    type: number
    group_label: "Facebook Delivery"
    label: "CPC"
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    type: number
    group_label: "Facebook Delivery"
    label: "CPM"
    sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

#### Video Measures #####

  measure: video_impressions {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql:
        case
        when ${views_to_25} > 0 then ${impressions}
        else null
        end;;
    hidden: yes
  }

  measure: video_spend {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql:
        case
        when ${views_to_25} > 0 then ${impressions}
        else null
        end;;
    hidden: yes
  }

  measure: total_views_to_25 {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Views to 25%"
    group_label: "Video Metrics"
    sql: ${views_to_25};;
  }

  measure: view_to_25_rate {
    type: number
    label: "% Viewed to 25%"
    group_label: "Video Metrics"
    sql: 1.0*${total_views_to_25}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views_to_50 {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Views to 50%"
    group_label: "Video Metrics"
    sql: ${views_to_50};;
  }

  measure: view_to_50_rate {
    type: number
    label: "% Viewed to 50%"
    group_label: "Video Metrics"
    sql: 1.0*${total_views_to_50}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views_to_75 {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Views to 75%"
    group_label: "Video Metrics"
    sql: ${views_to_75};;
  }

  measure: view_to_75_rate {
    type: number
    label: "% Viewed to 75%"
    group_label: "Video Metrics"
    sql: 1.0*${total_views_to_75}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views_to_95 {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Views to 95%"
    group_label: "Video Metrics"
    sql: ${views_to_95};;
  }

  measure: view_to_95_rate {
    type: number
    label: "% Viewed to 95%"
    group_label: "Video Metrics"
    sql: 1.0*${total_views_to_95}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_video_completes {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Views to 100%"
    group_label: "Video Metrics"
    sql: ${views_to_100};;
  }

  measure: video_completion_rate {
    type: number
    label: "Completion Rate"
    group_label: "Video Metrics"
    sql: 1.0*${total_video_completes}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_complete {
    type: number
    label: "CPcV"
    group_label: "Video Metrics"
    sql: 1.0*${video_spend}/nullif(${total_video_completes}, 0) ;;
    value_format_name: usd
  }

  measure: total_thruplays {
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "ThruPlays"
    group_label: "Video Metrics"
    sql: ${thruplays};;
  }

  measure: thruplay_rate {
    type: number
    label: "ThruPlay Rate"
    group_label: "Video Metrics"
    sql: 1.0*${total_thruplays}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_thruplay {
    type: number
    label: "Cost/ThruPlay"
    group_label: "Video Metrics"
    sql: 1.0*${video_spend}/nullif(${total_thruplays}, 0) ;;
    value_format_name: usd
  }

####### Google Analytics Measures #######

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
    sql: ${total_spend}/nullif(${total_sessions}, 0) ;;
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
    sql: ${sessions} ;;
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
