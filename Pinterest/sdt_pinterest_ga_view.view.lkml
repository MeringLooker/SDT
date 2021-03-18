view: sdt_pinterest_ga_view {
  sql_table_name: public.sdt_pinterest_ga_view ;;

  #### Primary Key ####

  dimension: comp_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.ga_join_id ;;
  }

#### Dimensions Added to this table via LookML ####

  dimension: publisher {
    type: string
    group_label: "Pinterest Dimensions"
    sql: 'Pinterest' ;;
  }

  dimension: ad_size {
    type: string
    group_label: "Pinterest Dimensions"
    label: "Pin Size"
    sql:
      CASE
        WHEN ${campaign_name} ilike 'SDT_FY20_PullThrough_National_DisneylandAnaheim_Standard%' then 'Standard Pin'
        WHEN ${campaign_name} ilike 'SDT_FY20_PullThrough_National_DisneylandAnaheim_Carousels%' then 'Carousel Pin'

        WHEN ${campaign_name} ilike 'SDT_FY20_PullThrough_National_CompetitiveConquesting_Carousels%' then 'Carousel Pin'
        WHEN ${campaign_name} ilike 'SDT_FY20_PullThrough_National_CompetitiveConquesting_Standard%' then 'Standard Pin'

        when ${campaign_name} ilike '%Macro_NonOutdoor_Traffic%' then 'Standard Pin'
        when ${campaign_name} ilike '%Macro_Outdoor_Traffic%' then 'Standard Pin'
        when ${campaign_name} ilike '%Micro_NonOutdoor_Traffic%' then 'Standard Pin'
        when ${campaign_name} ilike '%Micro_Outdoor_Traffic%' then 'Standard Pin'
        when ${campaign_name} ilike '%Macro_NonOutdoor_Video%' then 'Video Pin'
        when ${campaign_name} ilike '%Macro_Outdoor_Video%' then 'Video Pin'
        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContentRecovery_Nano_Traffic%' then 'Standard Pin'
        when ${campaign_name} ilike 'FY21_SDT_SpringAwareness%' then 'Standard Pin'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: fiscal_year {
    type:  string
    group_label: "Date Periods"
    sql:
      CASE
      WHEN ${date_date} BETWEEN '2013-07-01' AND '2014-06-30' THEN 'FY 13/14'
      WHEN ${date_date} BETWEEN '2014-07-01' AND '2015-06-30' THEN 'FY 14/15'
      WHEN ${date_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
      WHEN ${date_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
      WHEN ${date_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
      WHEN ${date_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
      WHEN ${date_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
      WHEN ${date_date} BETWEEN '2020-07-01' AND '2021-06-30' THEN 'FY 20/21'
      ELSE 'Uncategorized'
      END
    ;;
  }

  dimension: sdt_campaign {
    type: string
    label: "Campaign Name"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign_name} ilike 'SDTA_FY19_Holiday%' then 'SD For The Holidays'
        when ${campaign_name} ilike 'SDT_FY20_PullThrough_National%' then 'US Pull-Through'
        when ${campaign_name} ilike 'SDT_FY20_FallPromo%' then 'Fall Promo'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent%' then 'Always On Content'
        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent%' then 'Always On Content'
        when ${campaign_name} ilike 'FY21_SDT_DriveMarket%' then 'Fall Drive Market'
        when ${campaign_name} ilike 'FY21_SDT_SpringAwareness%' then 'Spring Awareness'
        else 'Uncategorized'
        end;;

    }

    dimension: sdt_layer {
      type: string
      label: "Campaign Layer"
      group_label: "Client Dimensions"
      sql:
      case
        when ${campaign_name} ilike '%Nano_Traffic_%' then 'Nano Traffic'
        when ${campaign_name} ilike '%Micro_Traffic_%' then 'Micro Traffic'
        when ${campaign_name} ilike '%Macro_Traffic_%' then 'Macro Traffic'

        when ${campaign_name} ilike '%Macro_NonOutdoor_Traffic%' then 'Macro Traffic'
        when ${campaign_name} ilike '%Macro_Outdoor_Traffic%' then 'Macro Traffic'
        when ${campaign_name} ilike '%Macro_NonOutdoor_Video%' then 'Macro Video'
        when ${campaign_name} ilike '%Macro_Outdoor_Video%' then 'Macro Video'

        when ${campaign_name} ilike '%Micro_NonOutdoor_Traffic%' then 'Micro Traffic'
        when ${campaign_name} ilike '%Micro_Outdoor_Traffic%' then 'Micro Traffic'

        when ${campaign_name} ilike 'SDT_FY20_PullThrough_National_DisneylandAnaheim%' then 'Disneyland'
        when ${campaign_name} ilike 'SDT_FY20_PullThrough_National_CompetitiveConquesting%' then 'Competitive Conquest'

        when ${campaign_name} ilike 'FY21_SDT_DriveMarket%' then 'Display'

      else 'Uncategorized'
      end;;
    }

    dimension: sdt_market {
      type: string
      label: "Market"
      group_label: "Client Dimensions"
      sql:
      case
        when ${campaign_name} ilike 'SDTA_FY19_Holiday%' then 'United States'
        when ${campaign_name} ilike 'SDT_FY20_PullThrough_National%' then 'United States'
        when ${campaign_name} ilike 'SDT_FY20_FallPromo%' then 'United States'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent%' then 'United States'
        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContent%' then 'United States'

        when ${campaign_name} ilike 'FY21_SDT_DriveMarket%' then 'United States'
        when ${campaign_name} ilike 'FY21_SDT_SpringAwareness%' then 'United States'

      else 'Uncategorized'
      end;;
    }

    dimension: sdt_region {
      type: string
      label: "Region"
      group_label: "Client Dimensions"
      sql:
      case

        when ${campaign_name} ilike 'FY21_SDT_DriveMarket_Traffic_StandardPins_California%' then 'California'
        when ${campaign_name} ilike 'FY21_SDT_DriveMarket_Traffic_StandardPins_PHXTUCDMA%' then 'Phoenix/Tucson'

        when ${campaign_name} ilike 'FY21_SDT_SpringAwareness_Consideration_California' then 'California'
        when ${campaign_name} ilike 'FY21_SDT_SpringAwareness_Consideration_Arizona' then 'Arizona'

        when ${campaign_name} ilike '%Nano_Traffic_Phoenix%' then 'Phoenix'
        when ${campaign_name} ilike '%Nano_Traffic_LosAngeles%' then 'Los Angeles'
        when ${campaign_name} ilike '%Nano_Traffic_National%' then 'Phoenix'

        when ${campaign_name} ilike '%Micro_Traffic_Phoenix%' then 'Phoenix'
        when ${campaign_name} ilike '%Micro_Traffic_LosAngeles%' then 'Los Angeles'
        when ${campaign_name} ilike '%Micro_Traffic_National%' then 'National'

        when ${campaign_name} ilike '%Macro_Traffic_Phoenix%' then 'Phoenix'
        when ${campaign_name} ilike '%Macro_Traffic_LosAngeles%' then 'Los Angeles'
        when ${campaign_name} ilike '%Macro_Traffic_National%' then 'National'

        when ${campaign_name} ilike 'SDT_FY20_PullThrough_National%' then 'National'

        when ${ad_group_name} ilike '%VarietySeeker_LosAngeles%' then 'Los Angeles'
        when ${ad_group_name} ilike '%LookalikeAudience_LosAngeles%' then 'Los Angeles'

        when ${ad_group_name} ilike '%VarietySeeker_Phoenix%' then 'Phoenix'
        when ${ad_group_name} ilike '%LookalikeAudience_Phoenix%' then 'Phoenix'

        when ${ad_group_name} ilike '%VarietySeeker_NewYork%' then 'New York'
        when ${ad_group_name} ilike '%LookalikeAudience_NewYork%' then 'New York'

        when ${ad_group_name} ilike '%VarietySeeker_SanFrancisco%' then 'San Francisco'
        when ${ad_group_name} ilike '%LookalikeAudience_SanFrancisco%' then 'San Francisco'

        when ${campaign_name} ilike '%_California' then 'California'
        when ${campaign_name} ilike '%_PHXTUCDMA' then 'Phoenix/Tucson'

        else 'Uncategorized'
      end;;
    }

    dimension: sdt_placement {
      type: string
      label: "Campaign Placement"
      group_label: "Client Dimensions"
      sql:
      case
        when ${campaign_name} ilike 'SDT_FY20_PullThrough_National_CompetitiveConquesting_Carousels%' then 'Carousel Pins'
        when ${campaign_name} ilike 'SDT_FY20_PullThrough_National_CompetitiveConquesting_Standard%' then 'Standard Pins'

        when ${campaign_name} ilike 'SDT_FY20_PullThrough_National_DisneylandAnaheim_Carousels%' then 'Carousel Pins'
        when ${campaign_name} ilike 'SDT_FY20_PullThrough_National_DisneylandAnaheim_Standard%' then 'Standard Pins'

        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent_Nano_Traffic%' then 'Standard Pins - Nano Traffic'

        when ${ad_group_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Traffic_Outdoor%' then 'Standard Pins - Micro Outdoor Traffic'
        when ${ad_group_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Traffic_Neighborhood%' then 'Standard Pins - Micro NonOutdoor Traffic'
        when ${ad_group_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Traffic_Attractions%' then 'Standard Pins - Micro NonOutdoor Traffic'
        when ${ad_group_name} ilike 'SDT_FY20_AlwaysOnContent_Micro_Traffic_Culinary%' then 'Standard Pins - Micro NonOutdoor Traffic'

        when ${ad_group_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_Traffic_Outdoor%' then 'Standard Pins - Macro Outdoor Traffic'
        when ${ad_group_name} ilike 'SDT_FY20_AlwaysOnContent_Macro_Traffic_NonOutdoor%' then 'Standard Pins - Macro NonOutdoor Traffic'

        when ${campaign_name} ilike '%Macro_NonOutdoor_Traffic%' then 'Standard Pins - Macro NonOutdoor Traffic'
        when ${campaign_name} ilike '%Macro_Outdoor_Traffic%' then 'Standard Pins - Macro Outdoor Traffic'
        when ${campaign_name} ilike '%Macro_NonOutdoor_Video%' then 'Standard Pins - Macro NonOutdoor Video'
        when ${campaign_name} ilike '%Macro_Outdoor_Video%' then 'Standard Pins - Macro Outdoor Video'

        when ${campaign_name} ilike '%Micro_NonOutdoor_Traffic%' then 'Standard Pins - Micro NonOutdoor Traffic'
        when ${campaign_name} ilike '%Micro_Outdoor_Traffic%' then 'Standard Pins - Micro Outdoor Traffic'

        when ${campaign_name} ilike 'FY21_SDT_DriveMarket_Traffic_StandardPins%' then 'Standard Pins - Traffic Driving'
        when ${campaign_name} ilike 'FY21_SDT_AlwaysOnContentRecovery_Nano_Traffic%' then 'Standard Pins - Nano Traffic'
        when ${campaign_name} ilike 'FY21_SDT_SpringAwareness%' then 'Standard Pins - Traffic Driving'

      else 'Uncategorized'
    end;;

      }

      dimension: sdt_pillar {
        type: string
        label: "Pillar"
        group_label: "Client Dimensions"
        sql:
              case
                when ${sdt_layer} = 'Nano Traffic' then 'N/A'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor%' then 'Outdoor'
                when ${promoted_pin_name} ilike '%Flight1_Culinary%' then 'Culinary'
                when ${promoted_pin_name} ilike '%Flight1_Attractions%' then 'Attractions'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood%' then 'Neighborhood'

                when ${campaign_name} ilike '%Macro_Outdoor_Traffic%' then 'Outdoor'
                when ${campaign_name} ilike '%Macro_Outdoor_Video%' then 'Outdoor'
                when ${campaign_name} ilike '%Micro_Outdoor_Traffic%' then 'Outdoor'
                when ${campaign_name} ilike '%Micro_Outdoor_Video%' then 'Outdoor'
                when ${promoted_pin_name} ilike '%_Neighborhood' then 'Neighborhood'
                when ${promoted_pin_name} ilike '%_Culinary' then 'Culinary'
                when ${promoted_pin_name} ilike '%_Attractions' then 'Attractions'
                when ${promoted_pin_name} ilike '%_Family' then 'Family'

                else 'Uncategorized'
              end;;
      }

      dimension: creative_name {
        type: string
        label: "Creative Name"
        group_label: "Client Dimensions"
        sql:
              case
                when ${promoted_pin_name} ilike '%PullThroughLandingPage' then 'Nano Traffic: PullThrough LP'
                when ${promoted_pin_name} ilike '%HotelsLandingPage' then 'Nano Traffic: Hotels LP'

                when ${promoted_pin_name} ilike '%PlanYourEscape' then 'Plan Your Escape'
                when ${promoted_pin_name} ilike '%PlanNowPlan' then 'Plan Now Plan'
                when ${promoted_pin_name} ilike '%PlanNowHappyPlace' then 'Plan Now Happy Place'

                when ${promoted_pin_name} ilike '%BookYourTrip' then 'Book Your Trip'
                when ${promoted_pin_name} ilike '%BookNowPlan' then 'Book Now Plan'
                when ${promoted_pin_name} ilike '%BookNowHappyPlace' then 'Book Now Happy Place'

                when ${promoted_pin_name} ilike '%KidsFree' then 'Kids Free Pin'
                when ${promoted_pin_name} ilike '%Flight1_Holidays' then 'Holidays'
                when ${promoted_pin_name} ilike '%Flight1_GeneralEvents' then 'General Events'
                when ${promoted_pin_name} ilike '%Flight1_CarouselNextGetaway' then 'Next Getaway Carousel'

                when ${promoted_pin_name} ilike '%Flight1_Outdoor_WhereToSurf%' then 'Where To Surf'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_WhaleWatching%' then 'Whale Watching'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_WaterSports%' then 'Water Sports'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_Sunny7_Sunsets%' then 'S7: Sunsets'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_Sunsets%' then 'S7: Sunsets'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_Splash%' then 'S7: Make A Splash'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_Sunny7_ScenicHighway%' then 'S7: Scenic Highway'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_ScenicHighway%' then 'S7: Scenic Highway'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_Sailing%' then 'Sailing'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_Play%' then 'Play'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_MelesFaves%' then 'Mele''s Faves'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_Sunny7_MakeASplash%' then 'S7: Make A Splash'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_MakeASplash%' then 'S7: Make A Splash'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_LaJollaKayak%' then 'La Jolla Kayak'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_HistoricHighway101%' then 'Historic Highway 101'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_Explore%' then 'Explore'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_EnjoyWater%' then 'Enjoy Water'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_DiveIn%' then 'Dive In'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_Discover%' then 'Discover'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_Cruise%' then 'Cruise'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_CoastalHikes%' then 'S7: Coastal Hikes'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_BoatRides%' then 'Boat Rides'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_BayshoreBikeway%' then 'Bayshore Bikeway'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_G2GS_AlanasFaves%' then 'G2GS: Alana''s Faves'
                when ${promoted_pin_name} ilike '%Flight1_Outdoor_AlanasFaves%' then 'G2GS: Alana''s Faves'

                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_UTC%' then 'UTC'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_SoCalVibe%' then 'SoCal Vibe'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_NorthInland%' then 'S7: North Inland'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_NorthCoastal%' then 'S7: North Coastal'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_MissionValleyOldTown%' then 'S7: Mission Valley Old Town'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_MissionBay%' then 'S7: Mission Bay'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_LittleItaly%' then 'Little Italy'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_Kensington%' then 'S7: Kensington'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_Sunny7_Kensignton%' then 'S7: Kensington'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_Sunny7_Kensington%' then 'S7: Kensington'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_Gaslamp%' then 'Gaslamp'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_DiveIne%' then 'Dive In'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_CharasmaticNeighborhoods%' then 'S7: Charismatic Neighborhoods'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_Sunny7_CharasmaticNeighborhoods%' then 'S7: Charismatic Neighborhoods'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_CharismaticNeighborhoods%' then 'S7: Charismatic Neighborhoods'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_BarrioLogan%' then 'Barrio Logan'
                when ${promoted_pin_name} ilike '%Flight1_Neighborhood_LaJolla%' then 'S7: La Jolla'

                when ${promoted_pin_name} ilike '%Flight1_Culinary_TacoJoints%' then 'Taco Joints'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_FiresideMeal%' then 'S7: Fireside Meal'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_DigIn%' then 'Dig In'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_Explore%' then 'Explore'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_CulinaryEpicenter%' then 'Culinary Epicenter'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_BestSeafood%' then 'Best Seafood'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_BestBurgers%' then 'Best Burgers'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_BarrioDogg%' then 'Barrio Dogg'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_AwardWinningChefs%' then 'S7: Award-Winning Chefs'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_AwardWinning%' then 'S7: Award-Winning Chefs'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_Animae%' then 'Animae'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_Sunny7_RooftopRestaurants%' then 'S7: Rooftop Restaurants'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_Sunny7_FemalePowerhouses%' then 'S7: Female Powerhouses'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_Sunny7_DiningExperiences%' then 'S7: Dining Experiences'
                when ${promoted_pin_name} ilike '%Flight1_Culinary_KillerTacos%' then 'Killer Tacos'

                when ${promoted_pin_name} ilike '%Flight1_Attractions_Learn%' then 'Learn'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_HistoryAdventures%' then 'History Adventures'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_HiddenGems%' then 'S7: Hidden Gems'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_Sunny7_HiddenGems%' then 'S7: Hidden Gems'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_GoBig%' then 'Go Big'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_OldTown%' then 'OldTown'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_FamilyTravel%' then 'Family Travel'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_Escape%' then 'Escape'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_Embark%' then 'Embark'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_Embarcadero%' then 'Embarcadero'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_BehindTheScenesTours%' then 'S7: Behind The Scenes Tours'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_Sunny7_BehindTheScenesTours%' then 'S7: Behind The Scenes Tours'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_BalboaParkCulturalHeart%' then 'Balboa Park Cultural Heart'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_AwesomeViewpoints%' then 'S7: Awesome Viewpoints'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_ArchitectureWonders%' then 'S7: Architecture Wonders'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_7NaturalWonders%' then 'S7: 7 Natural Wonders'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_MaritimeHeritage%' then 'Maritime Heritage'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_AwesomeAttractions%' then 'Awesome Attractions'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_59MileScenicDrive%' then '59 Mile Scenic Drive'
                when ${promoted_pin_name} ilike '%Flight1_Attractions_BalboaParkTours%' then 'Balboa Park Tours'

                when ${promoted_pin_name} ilike '%_OBIBoardwalk15' then 'OBI: Boardwalk Cruising (:15)'
                when ${promoted_pin_name} ilike '%_BBYoga15' then 'BB: Yoga (:15)'
                when ${promoted_pin_name} ilike '%_BBParagliding15' then 'BB: Paragliding (:15)'
                when ${promoted_pin_name} ilike '%_BBBeach15' then 'BB: Beach For 2 (:15)'
                when ${promoted_pin_name} ilike '%_BBCoffee15' then 'BB: Coffee Cup Coastal (:15)'
                when ${promoted_pin_name} ilike '%_BBPaddleBoard15' then 'BB: Paddle Board (:15)'

                when ${promoted_pin_name} ilike '%_Sunny7Sunsets' then 'S7: Sunsets'
                when ${promoted_pin_name} ilike '%_Sunny7MakeASplash' then 'S7: Make A Splash'
                when ${promoted_pin_name} ilike '%_ScenicHighway101' then 'S7: Scenic Highway'
                when ${promoted_pin_name} ilike '%_LaJollaKayak' then 'WC: La Jolla Kayak'
                when ${promoted_pin_name} ilike '%_CoastalHikes' then 'S7: Coastal Hikes'
                when ${promoted_pin_name} ilike '%_BayshoreBikeway' then 'WC: Bayshore Bikeway'

                when ${promoted_pin_name} ilike '%SocksTorreyPines_Family' then 'Socks: Torrey Pines (:15)'
                when ${promoted_pin_name} ilike '%SocksTidepools_Family' then 'Socks: Tidepooling (:15)'
                when ${promoted_pin_name} ilike '%SocksStarOfIndia_Family' then 'Socks: Star of India (:15)'
                when ${promoted_pin_name} ilike '%OBILibertyStation15_Neighborhood' then 'OBI: Liberty Station (:15)'
                when ${promoted_pin_name} ilike '%OBILearnToSurf_Family' then 'OBI: Learn to Surf (:15)'
                when ${promoted_pin_name} ilike '%OBIGolf15_Attractions' then 'OBI: Torrey Pines Golf (:15)'
                when ${promoted_pin_name} ilike '%OBIConvoyDesserts15_Neighborhood' then 'OBI: Convoy District Desserts (:15)'
                when ${promoted_pin_name} ilike '%OBIBirchAquarium_Family' then 'OBI: Birch Aquarium (:15)'
                when ${promoted_pin_name} ilike '%OBIAfricaRocks15_Attractions' then 'OBI: Africa Rocks (:15)'

                when ${promoted_pin_name} ilike '%DHRealm15_Culinary' then 'DH: Realm (:15)'
                when ${promoted_pin_name} ilike '%DHBarrioDogg15_Culinary' then 'DH: Barrio Dogg (:15)'
                when ${promoted_pin_name} ilike '%DHAzucar15_Culinary' then 'DH: Azucar (:15)'
                when ${promoted_pin_name} ilike '%DHAnimae15_Culinary' then 'DH: Animae (:15)'

                when ${promoted_pin_name} ilike '%Flight1_Outdoor_Sunny7_MakeASplash%' then 'S7: Make A Splash'
                when ${promoted_pin_name} ilike '%Sunny7Viewpoints_Attractions' then 'S7: Awesome Viewpoints'
                when ${promoted_pin_name} ilike '%Sunny7NorthCoastal_Neighborhood' then 'S7: North Coastal'
                when ${promoted_pin_name} ilike '%Sunny7HiddenGems_Attractions' then 'S7: Hidden Gems'
                when ${promoted_pin_name} ilike '%RealmOf52Remedies_Culinary' then 'WC: Realm of the 52 Remedies'
                when ${promoted_pin_name} ilike '%FamilyFun_Family' then 'WC: Family Fun in SD'
                when ${promoted_pin_name} ilike '%PacificBeach_Neighborhood' then 'WC: Pacific Beach'
                when ${promoted_pin_name} ilike '%KidApprovedParks_Family' then 'WC: Kid-Approved Parks'
                when ${promoted_pin_name} ilike '%BestBeaches_Family' then 'WC: Best Beaches According to Kids'
                when ${promoted_pin_name} ilike '%BirdRock_Neighborhood' then 'WC: Bird Rock'
                when ${promoted_pin_name} ilike '%Azcuar%' then 'WC: Azucar'
                when ${promoted_pin_name} ilike '%FY21_SDT_AlwaysOnContentRecovery_Macro_NonOutdoor_Traffic_PHXTUCDMA_Azucar_Culinary%' then 'WC: Azucar'
                when ${promoted_pin_name} ilike '%FY21_SDT_AlwaysOnContentRecovery_Macro_NonOutdoor_Traffic_California_Azucar_Culinary%' then 'WC: Azucar'

                when ${promoted_pin_name} ilike '%59MileScenicDrive_Attractions' then 'WC: SD''s 59 Mile Scenic Drive'

                when ${promoted_pin_name} ilike '%_TorreyPines' then 'WC: Torrey Pines'
        when ${promoted_pin_name} ilike '%_LeopardSharks' then 'WC: Swimming with Leopard Sharks'
        when ${promoted_pin_name} ilike '%TidePools' then 'WC: SD Tide Pools: Exploring Life at the Edge of the Sea'
        when ${promoted_pin_name} ilike '%_Sailing' then 'WC: Sailing in San Diego'
        when ${promoted_pin_name} ilike '%_MissionBayBeaches' then 'WC: Mission Bay & Beaches'
        when ${promoted_pin_name} ilike '%_MeleSurfFaves' then 'WC: Mele Sali''s Surf Faves'
        when ${promoted_pin_name} ilike '%_LaJollaBeaches' then 'WC: La Jolla Beaches'
        when ${promoted_pin_name} ilike '%_HistoricHighway101' then 'WC: Historic Highway 101'
        when ${promoted_pin_name} ilike '%_GuidetoSDBeaches' then 'WC: Guide to San Diego Beaches'
          when ${promoted_pin_name} ilike '%SocalVibe%' then 'WC: 3 Beach Neighborhoods w/ SoCal Vibe'
          when ${promoted_pin_name} ilike '%_Sunny7MissionValleyOldTown%' then 'S7: Mission Valley/Old Town'
          when ${promoted_pin_name} ilike '%_Sunny7MissionBay%' then 'S7: Mission Bay'
          when ${promoted_pin_name} ilike '%_Sunny7NorthCoastal%' then 'S7: North Coastal'
          when ${promoted_pin_name} ilike '%_Sunny7NorthInland%' then 'S7: North Inland'
          when ${promoted_pin_name} ilike '%_Sunny7PointLoma%' then 'S7: Point Loma'
          when ${promoted_pin_name} ilike '%_Sunny7NaturalWonders%' then 'S7: Natural Wonders'
          when ${promoted_pin_name} ilike '%_Sunny7LocalMarkets%' then 'S7: Local Markets'
          when ${promoted_pin_name} ilike '%_Sunny7BotanicalGardens%' then 'S7: Botanical Gardens'
          when ${promoted_pin_name} ilike '%_Sunny7RooftopRestaurants%' then 'S7: Rooftop Restaurants'
          when ${promoted_pin_name} ilike '%_Sunny7BeachfrontBars%' then 'S7: Beachfront Bars'
          when ${promoted_pin_name} ilike '%_Sunny7AwardWinningRestaurants%' then 'S7: Award Winning Restaurants & Chefs'
          when ${promoted_pin_name} ilike '%_Sunny7ArtOutsideTheBox%' then 'S7: Art Outside the Box'
          when ${promoted_pin_name} ilike '%PacificBeach%' then 'WC: Pacific Beach'
          when ${promoted_pin_name} ilike '%BirdRock%' then 'WC: Bird Rock'
          when ${promoted_pin_name} ilike '%_Sunny7Reasons%' then 'S7: Reasons to Bring the Family'
          when ${promoted_pin_name} ilike '%Onedayitinerary%' then 'One-Day Itinerary'
          when ${promoted_pin_name} ilike '%AwesomeMuseums%' then 'Awesome Museums'
          when ${promoted_pin_name} ilike '%25ThingsToDo%' then 'WC: 25 Fun & Free Things to do'
          when ${promoted_pin_name} ilike '%15SanDiegoPlaygrounds%' then 'WC: 15 San Diego Playgrounds'
          when ${promoted_pin_name} ilike '%13Kidneighborhoods%' then 'WC: 13 Kid-Pleasing Neighborhoods'
          when ${promoted_pin_name} ilike '%BestBeaches%' then 'WC: The Best Beaches According to Kids'
          when ${promoted_pin_name} ilike '%Familyfun%' then 'WC: Family Fun in San Diego'
          when ${promoted_pin_name} ilike '%Edutainment%' then 'Edutainment'
          when ${promoted_pin_name} ilike '%KidApprovedParks%' then 'WC: 9 Kid Approved Parks'
          when ${promoted_pin_name} ilike '%FoodieFinds%' then 'WC: Foodie Finds'

          when ${promoted_pin_name} ilike '%ArtFilledDay%' then 'One Perfect Art Filled Day'
          when ${promoted_pin_name} ilike '%FoodTruckRevolution%' then 'Food Truck Revolution'
          when ${promoted_pin_name} ilike '%CrossBorderCuisine%' then 'WC: Cross-Border Cuisine'
          when ${promoted_pin_name} ilike '%SeafoodRestaurants%' then 'WC: Best Seafood Restaurants'
          when ${promoted_pin_name} ilike '%Realmof52Remedies%' then 'WC: Realm of the 52 Remedies'
          when ${promoted_pin_name} ilike '%59MileScenicDrive%' then 'WC: San Diego''s 59 Mile Scenic Drive'
          when ${promoted_pin_name} ilike '%Sunny7HiddenGems%' then 'S7: Balboa Park Hidden Gems'
          when ${promoted_pin_name} ilike '%Sunny7Viewpoints%' then 'S7: Awesome San Diego Viewpoints'
          when ${promoted_pin_name} ilike '%BalboaParkCulturalHeart%' then 'WC: Balboa Park - Cultural Heart'
          when ${promoted_pin_name} ilike '%Sunny7makeaSplash%' then 'S7: Make A Splash'
          when ${promoted_pin_name} ilike '%Sunny7Sunsets%' then 'S7: Sunsets'
          when ${promoted_pin_name} ilike '%LaJollaKayak%' then 'WC: Explore La Jolla on a Kayak Tour'
          when ${promoted_pin_name} ilike '%BayshoreBikeway%' then 'WC: Bayshore Bikeway'
          when ${promoted_pin_name} ilike '%ScenicHighway101%' then 'S7: 7 Things to Do Along Scenic CA Highway 101'
          when ${promoted_pin_name} ilike '%CoastalHikes' then 'S7: 7 Star Coastal Hikes'

          when ${promoted_pin_name} ilike '%SurferCoast' then 'Surfer Coast Pin'
          when ${promoted_pin_name} ilike '%FY21_SDT_DriveMarket_Traffic_StandardPins_PHXTUCDMA_Family' then 'Family Pin'
          when ${promoted_pin_name} ilike '%FY21_SDT_DriveMarket_Traffic_StandardPins_California_Family' then 'Family Pin'

          when ${promoted_pin_name} ilike '%Weekyay_HomeSchool' then 'WeekYay: HomeSchool Pin'
          when ${promoted_pin_name} ilike '%Weekyay_OutdoorDining' then 'WeekYay: Outdoor Dining Pin'
          when ${promoted_pin_name} ilike '%Weekyay_LowerRateHotel' then 'WeekYay: Lower Rate Hotel Pin'
          when ${promoted_pin_name} ilike '%Weekyay_LessCrowds' then 'WeekYay: Less Crowds Pin'
          when ${promoted_pin_name} ilike '%Weekyay_LowerRateActivity' then 'WeekYay: Lower Rate Activity Pin'
          when ${promoted_pin_name} ilike '%Weekyay_WorkFromHotel' then 'WeekYay: Work From Hotel Pin'

          when ${promoted_pin_name} ilike '%WeekyayCreativeTest_HomeSchool' then 'WeekYay: HomeSchool Pin'
          when ${promoted_pin_name} ilike '%WeekyayCreativeTest_OutdoorDining' then 'WeekYay: Outdoor Dining Pin'
          when ${promoted_pin_name} ilike '%WeekyayCreativeTest_LowerRateHotel' then 'WeekYay: Lower Rate Hotel Pin'
          when ${promoted_pin_name} ilike '%WeekyayCreativeTest_LessCrowds' then 'WeekYay: Less Crowds Pin'
          when ${promoted_pin_name} ilike '%WeekyayCreativeTest_LowerRateActivity' then 'WeekYay: Lower Rate Activity Pin'
          when ${promoted_pin_name} ilike '%WeekyayCreativeTest_WorkFromHotel' then 'WeekYay: Work From Hotel Pin'
          when ${promoted_pin_name} ilike '%HICYB_PlanNow' then 'HICYB: Plan Now Pin'
          when ${promoted_pin_name} ilike '%HICYB_Spring%' then 'HICYB: Plan Now Pin'

                else 'Uncategorized'
              end;;
      }


      ### Dimensions native to this table ###

      dimension: ad_group_id {
        type: string
        group_label: "Pinterest IDs"
        sql: ${TABLE}.ad_group_id ;;
      }

      dimension: ad_group_name {
        type: string
        group_label: "Pinterest Dimensions"
        sql: ${TABLE}.ad_group_name ;;
      }

      dimension: bounces {
        type: number
        hidden: yes
        sql: ${TABLE}.bounces ;;
      }

      dimension: campaign_id {
        type: string
        group_label: "Pinterest IDs"
        sql: ${TABLE}.campaign_id ;;
      }

      dimension: campaign_name {
        type: string
        group_label: "Pinterest Dimensions"
        sql: ${TABLE}.campaign_name ;;
      }

      dimension: campaign_objective {
        type: string
        group_label: "Pinterest Dimensions"
        sql: ${TABLE}.campaign_objective ;;
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

      dimension_group: date {
        type: time
        label: ""
        group_label: "Date Periods"
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

      dimension: earned_clicks {
        type: number
        hidden: yes
        sql: ${TABLE}.earned_clicks ;;
      }

      dimension: earned_impressions {
        type: number
        hidden: yes
        sql: ${TABLE}.earned_impressions ;;
      }

      dimension: earned_saves {
        type: number
        hidden: yes
        sql: ${TABLE}.earned_saves ;;
      }

      dimension: earned_video_views {
        type: number
        hidden: yes
        sql: ${TABLE}.earned_video_views ;;
      }

      dimension: earned_views_at_100 {
        type: number
        hidden: yes
        sql: ${TABLE}.earned_views_at_100 ;;
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

      dimension: paid_clicks {
        type: number
        hidden: yes
        sql: ${TABLE}.paid_clicks ;;
      }

      dimension: paid_impressions {
        type: number
        hidden: yes
        sql: ${TABLE}.paid_impressions ;;
      }

      dimension: paid_saves {
        type: number
        hidden: yes
        sql: ${TABLE}.paid_saves ;;
      }

      dimension: paid_video_views {
        type: number
        hidden: yes
        sql: ${TABLE}.paid_video_views ;;
      }

      dimension: paid_views_at_100 {
        type: number
        hidden: yes
        sql: ${TABLE}.paid_views_at_100 ;;
      }

      dimension: pin_description {
        type: string
        group_label: "Pinterest Dimensions"
        sql: ${TABLE}.pin_description ;;
      }

      dimension: pin_id {
        type: string
        group_label: "Pinterest IDs"
        sql: ${TABLE}.pin_id ;;
      }

      dimension: promoted_pin_id {
        type: string
        group_label: "Pinterest IDs"
        sql: ${TABLE}.promoted_pin_id ;;
      }

      dimension: promoted_pin_name {
        type: string
        group_label: "Pinterest Dimensions"
        sql: ${TABLE}.promoted_pin_name ;;
      }

      dimension: saves {
        type: number
        hidden: yes
        sql: ${TABLE}.saves ;;
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

      dimension: users {
        type: number
        hidden: yes
        sql: ${TABLE}.users ;;
      }

      dimension: video_starts {
        type: number
        hidden: yes
        sql: ${TABLE}.video_starts ;;
      }

      dimension: video_views {
        type: number
        hidden: yes
        sql: ${TABLE}.video_views ;;
      }

      dimension: views_at_100 {
        type: number
        hidden: yes
        sql: ${TABLE}.views_at_100 ;;
      }

      dimension: views_at_25 {
        type: number
        hidden: yes
        sql: ${TABLE}.views_at_25 ;;
      }

      dimension: views_at_50 {
        type: number
        hidden: yes
        sql: ${TABLE}.views_at_50 ;;
      }

      dimension: views_at_75 {
        type: number
        hidden: yes
        sql: ${TABLE}.views_at_75 ;;
      }

      dimension: views_at_95 {
        type: number
        hidden: yes
        sql: ${TABLE}.views_at_95 ;;
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

#### All Measures go Below ###

      measure: total_spend {
        type: sum_distinct
        group_label: "Total Delivery"
        sql_distinct_key: ${comp_key} ;;
        sql: ${cost} ;;
        value_format_name: usd
      }

      measure: total_impressions {
        type: sum_distinct
        group_label: "Total Delivery"
        sql_distinct_key: ${comp_key} ;;
        sql: ${impressions} ;;
      }

      measure: total_clicks {
        type: sum_distinct
        group_label: "Total Delivery"
        sql_distinct_key: ${comp_key} ;;
        sql: ${clicks} ;;
      }

      measure: click_through_rate  {
        label: "CTR"
        type: number
        group_label: "Total Delivery"
        sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
        value_format_name: percent_2
      }

      measure: cost_per_click {
        label: "CPC"
        type: number
        group_label: "Total Delivery"
        sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
        value_format_name: usd
      }

      measure: cost_per_thousand  {
        label: "CPM"
        type: number
        group_label: "Total Delivery"
        sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
        value_format_name: usd
      }

      measure: total_conversions {
        type: sum_distinct
        group_label: "Total Delivery"
        sql_distinct_key: ${comp_key} ;;
        sql: ${conversions} ;;
      }

      measure: total_saves {
        group_label: "Total Delivery"
        type: sum_distinct
        sql_distinct_key: ${comp_key} ;;
        sql: ${saves} ;;
      }

      measure: total_video_starts {
        type: sum_distinct
        group_label: "Total Video Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${video_starts} ;;
      }

      measure: total_video_views {
        type: sum_distinct
        group_label: "Total Video Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${video_views} ;;
      }

      measure: total_view_rate  {
        label: "View Rate"
        type: number
        group_label: "Total Video Metrics"
        sql: ${total_video_views}/nullif(${total_impressions}, 0) ;;
        value_format_name: percent_2
      }

      measure: total_completion_rate  {
        label: "VCR"
        type: number
        group_label: "Total Video Metrics"
        sql: ${total_views_at_100}/nullif(${total_impressions}, 0) ;;
        value_format_name: percent_2
      }

      measure: total_views_at_100 {
        type: sum_distinct
        group_label: "Total Video Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${views_at_100} ;;
      }

      measure: content_video_views {
        type: sum_distinct
        hidden: yes
        group_label: "Total Video Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${views_at_100} ;;
      }

      measure: total_views_at_25 {
        type: sum_distinct
        group_label: "Total Video Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${views_at_25} ;;
      }

      measure: total_views_at_50 {
        type: sum_distinct
        group_label: "Total Video Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${views_at_50} ;;
      }

      measure: total_views_at_75 {
        type: sum_distinct
        group_label: "Total Video Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${views_at_75} ;;
      }

      measure: total_views_at_95 {
        type: sum_distinct
        group_label: "Total Video Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${views_at_95} ;;
      }

      ### Paid Measures ###

      measure: total_paid_impressions {
        type: sum_distinct
        group_label: "Paid Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${paid_impressions} ;;
      }

      measure: total_paid_clicks {
        type: sum_distinct
        group_label: "Paid Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${paid_clicks} ;;
      }

      measure: paid_ctr  {
        label: "Paid CTR"
        type: number
        group_label: "Paid Metrics"
        sql: ${total_paid_clicks}/nullif(${total_paid_impressions}, 0) ;;
        value_format_name: percent_2
      }

      measure: total_paid_saves {
        type: sum_distinct
        group_label: "Paid Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${paid_saves} ;;
      }

      measure: total_paid_views_at_100 {
        type: sum_distinct
        group_label: "Paid Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${paid_views_at_100} ;;
      }

      measure: total_paid_video_views {
        type: sum_distinct
        group_label: "Paid Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${paid_video_views} ;;
      }

      measure: paid_cpc {
        label: "Paid CPC"
        type: number
        group_label: "Paid Metrics"
        sql: ${total_spend}/nullif(${total_paid_clicks}, 0) ;;
        value_format_name: usd
      }

      measure: paid_cpm  {
        label: "Paid CPM"
        type: number
        group_label: "Paid Metrics"
        sql: ${total_spend}/nullif(${total_paid_impressions}/1000, 0) ;;
        value_format_name: usd
      }

      measure: total_paid_view_rate  {
        type: number
        group_label: "Paid Metrics"
        sql: ${total_paid_video_views}/nullif(${total_paid_impressions}, 0) ;;
        value_format_name: percent_2
      }

      measure: total_paid_completion_rate  {
        label: "Paid VCR"
        type: number
        group_label: "Paid Metrics"
        sql: ${total_earned_video_views}/nullif(${total_paid_impressions}, 0) ;;
        value_format_name: percent_2
      }

      ### Earned Measures ###

      measure: total_earned_impressions {
        type: sum_distinct
        group_label: "Earned Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${earned_impressions} ;;
      }

      measure: total_earned_clicks {
        type: sum_distinct
        group_label: "Earned Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${earned_clicks} ;;
      }

      measure: earned_ctr  {
        label: "Earned CTR"
        type: number
        group_label: "Earned Metrics"
        sql: ${total_earned_clicks}/nullif(${total_earned_impressions}, 0) ;;
        value_format_name: percent_2
      }

      measure: total_earned_saves {
        type: sum_distinct
        group_label: "Earned Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${earned_saves} ;;
      }

      measure: total_earned_views_at_100 {
        type: sum_distinct
        group_label: "Earned Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${earned_views_at_100} ;;
      }

      measure: total_earned_video_views {
        type: sum_distinct
        group_label: "Earned Metrics"
        sql_distinct_key: ${comp_key} ;;
        sql: ${earned_video_views} ;;
      }

      measure: total_earned_view_rate  {
        type: number
        group_label: "Earned Metrics"
        sql: ${total_earned_video_views}/nullif(${total_earned_impressions}, 0) ;;
        value_format_name: percent_2
      }

      measure: total_earned_completion_rate  {
        label: "Earned VCR"
        type: number
        group_label: "Earned Metrics"
        sql: ${total_earned_video_views}/nullif(${total_earned_impressions}, 0) ;;
        value_format_name: percent_2
      }

####### Google Analytics Measures #######

      measure: total_sessions {
        group_label: "Google Analytics Metrics"
        type: sum_distinct
        label: "Sessions"
        sql_distinct_key: ${comp_key} ;;
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
        sql_distinct_key: ${comp_key};;
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
        sql_distinct_key: ${comp_key} ;;
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
        sql_distinct_key: ${comp_key} ;;
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
        sql_distinct_key: ${comp_key} ;;
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
        sql_distinct_key: ${comp_key} ;;
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
        sql_distinct_key: ${comp_key} ;;
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
        sql_distinct_key: ${comp_key} ;;
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
        sql_distinct_key: ${comp_key} ;;
        sql: ${tos_above_30s} ;;
      }

      measure: tos_above_120s_rate  {
        label: "Avg. TOS >120s Rate"
        group_label: "Google Analytics Goals"
        type: number
        sql: ${total_tos_above_120s}/nullif(${total_sessions}, 0) ;;
        value_format_name: percent_2
      }
    }
