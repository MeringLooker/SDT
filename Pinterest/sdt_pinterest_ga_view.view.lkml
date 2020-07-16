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

        when ${campaign_name} ilike 'SDT_FY20_PullThrough_National_DisneylandAnaheim%' then 'Disneyland'
        when ${campaign_name} ilike 'SDT_FY20_PullThrough_National_CompetitiveConquesting%' then 'Competitive Conquest'

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

      else 'Uncategorized'
      end;;
    }

    dimension: sdt_region {
      type: string
      label: "Region"
      group_label: "Client Dimensions"
      sql:
      case
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

                else 'Uncategorized'
              end;;
      }

      dimension: creative_name {
        type: string
        label: "Creative Name"
        group_label: "Client Dimensions"
        sql:
              case
                when ${promoted_pin_name} ilike '%PlanYourEscape' then 'Plan Your Escape'
                when ${promoted_pin_name} ilike '%PlanNowPlan' then 'Plan Now Plan'
                when ${promoted_pin_name} ilike '%PlanNowHappyPlace' then 'Plan Now Happy Place'

                when ${promoted_pin_name} ilike '%BookYourTrip' then 'Book Your Trip'
                when ${promoted_pin_name} ilike '%BookNowPlan' then 'Book Now Plan'
                when ${promoted_pin_name} ilike '%BookNowHappyPlace' then 'Book Now Happy Place'

                when ${promoted_pin_name} ilike '%KidsFree' then 'KidsFree'
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
