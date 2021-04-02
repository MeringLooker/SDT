view: sdt_gdn_ga_view {
  sql_table_name: public.sdt_gdn_ga_view ;;

###### Primary Key #######

  dimension: ga_join_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.ga_join_id ;;
  }

###### Dimensions added to this table via LookML #######

  dimension: fiscal_year {
    label: "Fiscal Year"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${day_date} BETWEEN '2013-07-01' AND '2014-06-30' THEN 'FY 13/14'
        WHEN ${day_date} BETWEEN '2014-07-01' AND '2015-06-30' THEN 'FY 14/15'
        WHEN ${day_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
        WHEN ${day_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
        WHEN ${day_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${day_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${day_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        WHEN ${day_date} BETWEEN '2020-07-01' AND '2021-06-30' THEN 'FY 20/21'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: advertising_channel {
    type: string
    label: "Channel"
    group_label: "AdWords Dimensions"
    sql: 'Display'
      ;;
  }

  dimension: ad_size {
    type: string
    label: "Ad Size"
    group_label: "AdWords Dimensions"
    sql:
      case
        when ${campaign} = 'SDTA - Balboa - Cultural VS - GDN Responsive' then 'Responsive Display'
        when ${campaign} = 'SDTA - Balboa - Retargeting - GDN Responsive' then 'Responsive Display'
        when ${campaign} = 'SDT_FY20_PullThrough_National' then 'Responsive Display'
        when ${campaign} = 'SDT - FY21 - Locals Recovery - Awareness' then 'Responsive Display'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContentRecovery%' then 'Responsive Display'

        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_GDN_Retargeting%' then 'Responsive Display'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_Discovery_Retargeting%' then 'Responsive Display'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_GDN_FirstTouch%' then 'Responsive Display'
        else null
        end
      ;;
  }

  dimension: publisher {
    type: string
    label: "Publisher"
    group_label: "AdWords Dimensions"
    sql: 'Google Display'
      ;;
  }

  dimension: sdt_market {
    type: string
    label: "Market"
    group_label: "Client Dimensions"
    sql:
      case
        when ${account} = 'SDTA UK GDN' then 'United Kingdom'
        when ${account} = 'SDTA CAN GDN' then 'Canada'
        when ${account} = 'SDTA Pull-Through GDN' then 'United States'
        when ${account} = 'SDTA Content GDN US' then 'United States'
        when ${account} = 'SDTA Content GDN PHX' then 'United States'
        when ${account} = 'SDTA Content GDN LA' then 'United States'
        when ${account} = 'SDTA Balboa Park GDN' then 'United States'
        when ${account} ilike '%Family Content Seaworld' then 'United States'
        when ${account} ilike '%Family Content San Diego Zoo' then 'United States'
        when ${account} ilike '%Family Content San Diego Tourism' then 'United States'
        when ${account} ilike '%Family Content Legoland' then 'United States'

        when ${account} ilike 'SDTA Locals GDN' then 'United States'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_region {
    type: string
    label: "Region"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_GDN_%_California%' then 'California'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_GDN_%_Callifornia%' then 'California'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_Discovery_%_California%' then 'California'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_Discovery_%_Callifornia%' then 'California'

        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_GDN_%_Arizona%' then 'Arizona'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_Discovery_%_Arizona%' then 'Arizona'

        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_GDN_%_LosAngeles%' then 'Los Angeles'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_Discovery_%_LosAngeles%' then 'Los Angeles'

        when ${campaign} ilike '%PHXTUCDMA' then 'Phoenix/Tucson'
        when ${campaign} ilike '%Nano_GDN_PHXTUCDMA%' then 'Phoenix/Tucson'
        when ${campaign} ilike '%LADMA' then 'Los Angeles'
        when ${campaign} ilike '%Nano_GDN_LADMA%' then 'Los Angeles'
        when ${campaign} ilike '%GDN_California' then 'California'
        when ${campaign} ilike '%Nano_GDN_California%' then 'California'

        when ${account} = 'SDTA Content GDN US' then 'National'
        when ${account} = 'SDTA Content GDN PHX' then 'Phoenix'
        when ${account} = 'SDTA Content GDN LA' then 'Los Angeles'

        when ${campaign_id} = '1382958131' then 'National'
        when ${campaign_id} = '1382958149' then 'National'
        when ${campaign_id} = '1382958143' then 'National'
        when ${campaign_id} = '1382957999' then 'National'
        when ${campaign_id} = '1382958137' then 'National'
        when ${campaign_id} = '1382958140' then 'National'
        when ${campaign_id} = '1382958128' then 'National'
        when ${campaign_id} = '1382958125' then 'National'
        when ${campaign_id} = '1382958134' then 'National'
        when ${campaign_id} = '1382958122' then 'National'
        when ${campaign_id} = '1382958146' then 'National'
        when ${campaign_id} = '1382957996' then 'National'

        when ${campaign_id} = '1628518746' then 'National'
        when ${campaign_id} = '1627895647' then 'National'
        when ${campaign_id} = '1627895698' then 'National'
        when ${campaign_id} = '1628246777' then 'National'
        when ${campaign_id} = '1628248697' then 'National'
        when ${campaign_id} = '1628498397' then 'National'

        when ${campaign_id} = '1876499432' then 'National'
        when ${campaign_id} = '1876499438' then 'National'
        when ${campaign_id} = '1876499435' then 'National'
        when ${campaign_id} = '1876499441' then 'National'
        when ${campaign_id} = '1876499447' then 'National'
        when ${campaign_id} = '1876499444' then 'National'
        when ${campaign_id} = '1653845174' then 'National'
        when ${campaign_id} = '1655248509' then 'National'
        when ${campaign} = 'SDT_FY20_PullThrough_National' then 'National'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_campaign {
    type: string
    label: "Campaign"
    group_label: "Client Dimensions"
    sql:
      case
        when ${account} = 'SDTA UK GDN' then 'United Kingdom Digital'
        when ${account} = 'SDTA CAN GDN' then 'Canada Digital'
        when ${campaign} = 'SDT_FY20_PullThrough_National' then 'US Pull-Through'
        when ${account} = 'SDTA Content GDN US' then 'Always On Content'
        when ${account} = 'SDTA Content GDN PHX' then 'Always On Content'
        when ${account} = 'SDTA Content GDN LA' then 'Always On Content'

        when ${campaign} ilike 'SDT - FY21 - Locals Recovery - Awareness%' then 'Locals Recovery'

        when ${campaign_id} = '1628518746' then 'US Pull-Through'
        when ${campaign_id} = '1627895647' then 'US Pull-Through'
        when ${campaign_id} = '1627895698' then 'US Pull-Through'
        when ${campaign_id} = '1628246777' then 'US Pull-Through'
        when ${campaign_id} = '1628248697' then 'US Pull-Through'
        when ${campaign_id} = '1628498397' then 'US Pull-Through'

        when ${campaign_id} = '1876499432' then 'US Pull-Through'
        when ${campaign_id} = '1876499438' then 'US Pull-Through'
        when ${campaign_id} = '1876499435' then 'US Pull-Through'
        when ${campaign_id} = '1876499441' then 'US Pull-Through'
        when ${campaign_id} = '1876499447' then 'US Pull-Through'
        when ${campaign_id} = '1876499444' then 'US Pull-Through'
        when ${campaign_id} = '1653845174' then 'US Pull-Through'
        when ${campaign_id} = '1655248509' then 'US Pull-Through'

        when ${campaign_id} = '1382958131' then 'Always On Content'
        when ${campaign_id} = '1382958149' then 'Always On Content'
        when ${campaign_id} = '1382958143' then 'Always On Content'
        when ${campaign_id} = '1382957999' then 'Always On Content'
        when ${campaign_id} = '1382958137' then 'Always On Content'
        when ${campaign_id} = '1382958140' then 'Always On Content'
        when ${campaign_id} = '1382958128' then 'Always On Content'
        when ${campaign_id} = '1382958125' then 'Always On Content'
        when ${campaign_id} = '1382958134' then 'Always On Content'
        when ${campaign_id} = '1382958122' then 'Always On Content'
        when ${campaign_id} = '1382958146' then 'Always On Content'
        when ${campaign_id} = '1382957996' then 'Always On Content'

        when ${account} ilike '%Family Content Seaworld' then 'Family Content'
        when ${account} ilike '%Family Content San Diego Zoo' then 'Family Content'
        when ${account} ilike '%Family Content San Diego Tourism' then 'Family Content'
        when ${account} ilike '%Family Content Legoland' then 'Family Content'

        when ${account} = 'SDTA Balboa Park GDN' then 'Balboa Park Digital'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_layer {
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign} ilike 'SDTA - UK - Brand - Awareness - FY20%' then 'Amplify Reach'
        when ${campaign_id} = '1655713166' then 'Amplify Reach'
        when ${campaign_id} = '1661582078' then 'Amplify Reach'
        when ${campaign} = 'SDTA - CAN - Conversion - Responsive - FY20' then 'Amplify Reach'
        when ${campaign} = 'SDTA - CAN - Awareness - Static - FY20' then 'Amplify Reach'

        when ${campaign} = 'SDT_FY20_PullThrough_National' then 'Pull-Through Base'

        when ${campaign} ilike '%Consider - Targeting - PT - GDN' then 'Pull-Through Base'
        when ${campaign} ilike '%Active Eval - Retargeting - PT - GDN' then 'Pull-Through Base'


        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Nano%' then 'Nano Traffic'
        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Macro%' then 'Macro Traffic'
        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Micro%' then 'Micro Traffic'

        when ${campaign} ilike 'FY21_SDT_AlwaysOnContentRecovery_Nano%' then 'Nano Traffic'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContentRecovery_Macro%' then 'Macro Traffic'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContentRecovery_Micro%' then 'Micro Traffic'

        when ${campaign} ilike 'SDT_FY20_FamilyContent_Nano%' then 'Nano Traffic'
        when ${campaign} ilike 'SDT_FY20_FamilyContent_Micro%' then 'Micro Traffic'

        when ${campaign} ilike 'SDT - FY21 - Locals Recovery - Awareness%' then 'Awareness'

        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_GDN_Retargeting%' then 'Topical Retargeting'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_Discovery_Retargeting%' then 'Topical Retargeting'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_GDN_FirstTouch%' then 'First Touch Display'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_placement {
    type: string
    label: "Campaign Placement"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_GDN_Retargeting%' then 'GDN Responsive Display - Retargeting'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_Discovery_Retargeting%' then 'GDN Discovery Display - Retargeting'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_GDN_FirstTouch%' then 'GDN Responsive Display - First Touch'

        when ${ad_group_id} = '89533583427' then 'Static Display - Variety Seeker'
        when ${ad_group_id} = '92121636452' then 'Static Display - Variety Seeker'
        when ${ad_group_id} = '92121636852' then 'Static Display - Variety Seeker'
        when ${ad_group_id} = '92121636612' then 'Static Display - Variety Seeker'
        when ${ad_group_id} = '89533583467' then 'Static Display - Variety Seeker'
        when ${ad_group_id} = '92121636892' then 'Static Display - Variety Seeker'

        when ${ad_group_id} = '92121637092' then 'Static Display - Lookalike'
        when ${ad_group_id} = '89533583667' then 'Static Display - Lookalike'
        when ${ad_group_id} = '92121636692' then 'Static Display - Lookalike'

        when ${ad_group_id} = '92121636932' then 'Static Display - Competitive Destinations'
        when ${ad_group_id} = '89533583507' then 'Static Display - Competitive Destinations'
        when ${ad_group_id} = '92121636652' then 'Static Display - Competitive Destinations'


        when ${campaign} = 'SDTA - CAN - Conversion - Responsive - FY20' then 'Responsive Display'
        when ${campaign} = 'SDTA - CAN - Awareness - Static - FY20' then 'Static Display'

        when ${campaign} = 'SDTA - UK - Traffic - GDN Responsive - FY19' then 'Responsive Display'
        when ${campaign} = 'SDTA - UK - Impressions - GDN Display - FY19' then 'Static Display'

        when ${campaign} = 'SDT_FY20_PullThrough_National' then 'Responsive Display'

        when ${campaign} = 'SDTA - Balboa - Cultural VS - GDN Responsive' then 'Responsive Display - Cultural Variety Seeker'
        when ${campaign} = 'SDTA - Balboa - Retargeting - GDN Responsive' then 'Responsive Display - Website Retargeting'

        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Nano_GDN%' then 'Responsive Display - Retargeting'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Outdoor%' then 'Responsive Display - Micro Outdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Neighborhood%' then 'Responsive Display - Micro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Culinary%' then 'Responsive Display - Micro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Attractions%' then 'Responsive Display - Micro NonOutdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_Outdoor%' then 'Responsive Display - Macro Outdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_NonOutdoor%' then 'Responsive Display - Macro NonOutdoor'

        when ${campaign} ilike 'FY21_SDT_AlwaysOnContentRecovery_Macro_Outdoor%' then 'Responsive Display - Macro Outdoor'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContentRecovery_Macro_NonOutdoor%' then 'Responsive Display - Macro NonOutdoor'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContentRecovery_Micro_Outdoor%' then 'Responsive Display - Micro Outdoor'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContentRecovery_Micro_NonOutdoor%' then 'Responsive Display - Micro NonOutdoor'

        when ${campaign} ilike 'FY21_SDT_AlwaysOnContentRecovery_Nano%' then 'Responsive Display - Nano Traffic'

        when ${campaign} ilike 'SDT_FY20_FamilyContent_Micro_GDisco%' then 'Micro - Google Discover Display'
        when ${campaign} ilike 'SDT_FY20_FamilyContent_Nano_GDisco%' then 'Nano - Google Discover Display'
        when ${campaign} ilike 'SDT_FY20_FamilyContent_Nano_GDN%' then 'Micro - GDN Display'

        when ${ad_group} ilike 'SDT - Coast - VS Custom Intent' then 'Responsive Display - Variety Seeker'
        when ${ad_group} ilike 'SDT - Hotel - VS Custom Intent' then 'Responsive Display - Variety Seeker'
        when ${ad_group} ilike 'SDT - Coast - Site LAL' then 'Responsive Display - Site Lookalikes'
        when ${ad_group} ilike 'SDT - Hotel - Site LAL' then 'Responsive Display - Site Lookalikes'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_pillar {
    type: string
    label: "Pillar"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_GDN_Retargeting%' then 'N/A'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_Discovery_Retargeting%' then 'N/A'
        when ${campaign} ilike 'FY21_SDT_AlwaysOnContent_GDN_FirstTouch%' then 'N/A'

        when ${campaign} ilike 'SDT_FY20_AlwaysOnContent_Nano_GDN%' then 'N/A'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Outdoor%' then 'Outdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Neighborhood%' then 'Neighborhood'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Culinary%' then 'Culinary'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Micro_GDN_Attractions%' then 'Attractions'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_Outdoor%' then 'Outdoor'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_NonOutdoor_Neighborhood%' then 'Neighborhood'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_NonOutdoor_Culinary%' then 'Culinary'
        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_NonOutdoor_Attractions%' then 'Attractions'

        when ${ad_group} ilike '%Micro_Outdoor%' then 'Outdoor'
        when ${ad_group} ilike '%Macro_Outdoor%' then 'Outdoor'
        when ${ad_group} ilike '%_Attractions' then 'Attractions'
        when ${ad_group} ilike '%_Neighborhood' then 'Neighborhood'
        when ${ad_group} ilike '%_Culinary' then 'Culinary'
        when ${ad_group} ilike '%_Family' then 'Family'

        when ${ad_group} ilike 'SDT_FY20_AlwaysOnContent_Macro_GDN_NonOutdoor%' then 'Non-Outdoor'

        when ${campaign} ilike 'FY21_SDT_AlwaysOnContentRecovery_Nano%' then 'N/A'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_audience {
    type: string
    label: "Audience"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign} ilike '%SDTA - Static - Competitive%' then 'Competitive Destinations'
        when ${campaign} ilike '%SDTA - Static - LAL%' then 'Lookalike'
        when ${campaign} ilike '%SDTA - Static - VS Custom Intent%' then 'Variety Seeker'

        when ${ad_group_id} = '82341756398' then 'In-Market Travel'
        when ${ad_group_id} = '82341756638' then 'In-Market Travel'
        when ${ad_group_id} = '82341756718' then 'Lookalike'
        when ${ad_group_id} = '82341756478' then 'Lookalike'
        when ${ad_group_id} = '82341756678' then 'Variety Seeker'
        when ${ad_group_id} = '82341756438' then 'Variety Seeker'

        when ${ad_group} ilike 'SDT - Coast - VS Custom Intent' then 'Variety Seeker'
        when ${ad_group} ilike 'SDT - Hotel - VS Custom Intent' then 'Variety Seeker'
        when ${ad_group} ilike 'SDT - Coast - Site LAL' then 'Site Lookalikes'
        when ${ad_group} ilike 'SDT - Hotel - Site LAL' then 'Site Lookalikes'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: creative_name {
    type: string
    label: "Creative Name"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign} ilike 'Surfer Couple - OMN%' then 'Surfer Couple'
        when ${campaign} ilike 'Surfer - Consider%' then 'Surfer Couple'
        when ${campaign} ilike 'Surfer - Active Eval%' then 'Surfer Couple'
        when ${campaign} ilike 'Running to Beach%' then 'Running to Beach'
        when ${campaign} ilike 'Mom Daughter%' then 'Mom Daughter'
        when ${campaign} ilike 'Girls on Van%' then 'Girls on Van'
        when ${campaign} ilike 'Beach Soccer%' then 'Beach Soccer'
        when ${campaign} ilike 'Beach Family%' then 'Beach Family'
        when ${campaign} ilike 'Beach People%' then 'Beach People'

        when ${account} ilike '%Family Content Seaworld' then 'Seaworld Display'
        when ${account} ilike '%Family Content San Diego Zoo' then 'San Diego Zoo Display'
        when ${account} ilike '%Family Content San Diego Tourism' then 'San Diego Tourism Display'
        when ${account} ilike '%Family Content Legoland' then 'Legoland Display'

        when ${ad_group} ilike 'SDT - Coast - VS Custom Intent' then 'Coast Creative'
        when ${ad_group} ilike 'SDT - Hotel - VS Custom Intent' then 'Hotel Creative'
        when ${ad_group} ilike 'SDT - Coast - Site LAL' then 'Coast Creative'
        when ${ad_group} ilike 'SDT - Hotel - Site LAL' then 'Hotel Creative'

        when ${ad_group} ilike '%_TorreyPines%' then 'WC: Torrey Pines'
        when ${ad_group} ilike '%_LeopardSharks%' then 'WC: Swimming with Leopard Sharks'
        when ${ad_group} ilike '%TidePools%' then 'WC: SD Tide Pools: Exploring Life at the Edge of the Sea'
        when ${ad_group} ilike '%_Sailing%' then 'WC: Sailing in San Diego'
        when ${ad_group} ilike '%_MissionBayBeaches%' then 'WC: Mission Bay & Beaches'
        when ${ad_group} ilike '%_MeleSurfFaves%' then 'WC: Mele Sali''s Surf Faves'
        when ${ad_group} ilike '%_LaJollaBeaches%' then 'WC: La Jolla Beaches'
        when ${ad_group} ilike '%_HistoricHighway101%' then 'WC: Historic Highway 101'
        when ${ad_group} ilike '%_GuidetoSDBeaches%' then 'WC: Guide to San Diego Beaches'
        when ${ad_group} ilike '%_GuiddetoSDBeaches' then 'WC: Guide to San Diego Beaches'
          when ${ad_group} ilike '%SocalVibe%' then 'WC: 3 Beach Neighborhoods w/ SoCal Vibe'
          when ${ad_group} ilike '%_Sunny7MissionValleyOldTown%' then 'S7: Mission Valley/Old Town'
          when ${ad_group} ilike '%_Sunny7MissionBay%' then 'S7: Mission Bay'
          when ${ad_group} ilike '%_Sunny7NorthCoastal%' then 'S7: North Coastal'
          when ${ad_group} ilike '%_Sunny7NorthInland%' then 'S7: North Inland'
          when ${ad_group} ilike '%_Sunny7PointLoma%' then 'S7: Point Loma'
          when ${ad_group} ilike '%_Sunny7NaturalWonders%' then 'S7: Natural Wonders'
          when ${ad_group} ilike '%NaturalWonders' then 'S7: Natural Wonders'
          when ${ad_group} ilike '%_Sunny7LocalMarkets%' then 'S7: Local Markets'
          when ${ad_group} ilike '%_Sunny7BotanicalGardens%' then 'S7: Botanical Gardens'
          when ${ad_group} ilike '%_Sunny7RooftopRestaurants%' then 'S7: Rooftop Restaurants'
          when ${ad_group} ilike '%_Sunny7BeachfrontBars%' then 'S7: Beachfront Bars'
          when ${ad_group} ilike '%_Sunny7AwardWinningRestaurants%' then 'S7: Award Winning Restaurants & Chefs'
          when ${ad_group} ilike '%_Sunny7ArtOutsideTheBox%' then 'S7: Art Outside the Box'
          when ${ad_group} ilike '%PacificBeach%' then 'WC: Pacific Beach'
          when ${ad_group} ilike '%BirdRock%' then 'WC: Bird Rock'
          when ${ad_group} ilike '%_Sunny7Reasons%' then 'S7: Reasons to Bring the Family'
          when ${ad_group} ilike '%Onedayitinerary%' then 'One-Day Itinerary'
          when ${ad_group} ilike '%AwesomeMuseums%' then 'Awesome Museums'
          when ${ad_group} ilike '%25FreeFunThings%' then 'WC: 25 Fun & Free Things to do'
          when ${ad_group} ilike '%15SanDiegoPlaygrounds%' then 'WC: 15 San Diego Playgrounds'
          when ${ad_group} ilike '%13Kidneighborhoods%' then 'WC: 13 Kid-Pleasing Neighborhoods'
          when ${ad_group} ilike '%BestBeaches%' then 'WC: The Best Beaches According to Kids'
          when ${ad_group} ilike '%Familyfun%' then 'WC: Family Fun in San Diego'
          when ${ad_group} ilike '%Edutainment%' then 'Edutainment'
          when ${ad_group} ilike '%KidApprovedParks%' then 'WC: 9 Kid Approved Parks'
          when ${ad_group} ilike '%FoodieFinds%' then 'WC: Foodie Finds'
          when ${ad_group} ilike '%Azcuar%' then 'WC: Azucar'
          when ${ad_group} ilike '%ArtFilledDay%' then 'One Perfect Art Filled Day'
          when ${ad_group} ilike '%FoodTruckRevolution%' then 'Food Truck Revolution'
          when ${ad_group} ilike '%CrossBorderCuisine%' then 'WC: Cross-Border Cuisine'
          when ${ad_group} ilike '%SeafoodRestaurants%' then 'WC: Best Seafood Restaurants'
          when ${ad_group} ilike '%Realmof52Remedies%' then 'WC: Realm of the 52 Remedies'
          when ${ad_group} ilike '%59MileScenicDrive%' then 'WC: San Diego''s 59 Mile Scenic Drive'
          when ${ad_group} ilike '%Sunny7HiddenGems%' then 'S7: Balboa Park Hidden Gems'
          when ${ad_group} ilike '%Sunny7Viewpoints%' then 'S7: Awesome San Diego Viewpoints'
          when ${ad_group} ilike '%ScenicViewpoints' then 'S7: Awesome San Diego Viewpoints'
          when ${ad_group} ilike '%BalboaParkCulturalHeart%' then 'WC: Balboa Park - Cultural Heart'
          when ${ad_group} ilike '%Sunny7makeaSplash%' then 'S7: Make A Splash'
          when ${ad_group} ilike '%Sunny7Sunsets%' then 'S7: Sunsets'
          when ${ad_group} ilike '%LaJollaKayak%' then 'WC: Explore La Jolla on a Kayak Tour'
          when ${ad_group} ilike '%BayshoreBikeway%' then 'WC: Bayshore Bikeway'
          when ${ad_group} ilike '%ScenicHighway101%' then 'S7: 7 Things to Do Along Scenic CA Highway 101'
          when ${ad_group} ilike '%CoastalHikes%' then 'S7: 7 Star Coastal Hikes'
          when ${ad_group} ilike '%LocalMarkets' then 'S7: 7 Local Markets'

          when ${ad_group} ilike '%_PlanNow' then 'WC: Plan Now'
          when ${ad_group} ilike '%_OutdoorDining' then 'WC: Outdoor Dining'
          when ${ad_group} ilike '%_BookNow' then 'WC: Book Now'
          when ${ad_group} ilike '%_SafeTravelerContent' then 'WC: Safe Traveler Content'

          when ${ad_group} ilike '%LocalMarkets' then 'S7: 7 Local Markets'

          when ${campaign} ilike '%HotelsLandingPage' then 'Nano Traffic: Hotels LP'
          when ${campaign} ilike '%PullThroughLandingPage' then 'Nano Traffic: PullThrough LP'
          when ${campaign} ilike '%LASpecificLandingPage' then 'Nano Traffic: LA-Specific LP'

        ELSE 'Uncategorized'
        end
        ;;
  }

  dimension: sdt_partner {
    type: string
    group_label: "Client Dimensions"
    label: "SDT Partner (Fam. Content)"
    sql:
    case
      when ${account} ilike '%Family Content Seaworld' then 'SeaWorld'
      when ${account} ilike '%Family Content San Diego Zoo' then 'San Diego Zoo'
      when ${account} ilike '%Family Content San Diego Tourism' then 'San Diego Tourism'
      when ${account} ilike '%Family Content Legoland' then 'LegoLand'

      ELSE null
      END;;
  }

###### All dimensions go below #######

  dimension: account {
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: string
    group_label: "AdWords IDs"
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: ad_group_id_string {
    type: string
    hidden: yes
    group_label: "AdWords IDs"
    sql: ${ad_group_id} ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: campaign {
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "AdWords IDs"
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }

  dimension_group: day {
    label: ""
    group_label: "Date Periods"
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
    sql: ${TABLE}.day ;;
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

  dimension: total_conv_value {
    type: number
    hidden: yes
    sql: ${TABLE}.total_conv_value ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

  dimension: wheel_interactions {
    type: number
    hidden: yes
    sql: ${TABLE}.wheel_interactions ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: 0 ;;
  }

  dimension: completes {
    type: number
    hidden: yes
    sql: 0 ;;
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

  ###### All Measures go Below #######

  measure: total_impressions {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type:  sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql:${cost}/1000000.00  ;;
    value_format_name: usd
  }

  measure: total_conversions {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${conversions} ;;
  }

  measure: click_through_rate  {
    label: "CTR"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    label: "CPC"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand  {
    label: "CPM"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_conversion_rate  {
    label: "CVR"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_conversions}/nullif(${total_clicks}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_conversion {
    label: "CPA"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_conversions} ,0);;
    value_format_name: usd
  }

  measure: total_views {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${completes} ;;
  }

###### All Measures go Below ######

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
