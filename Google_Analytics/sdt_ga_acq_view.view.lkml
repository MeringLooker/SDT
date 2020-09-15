view: sdt_ga_acq_view {
  sql_table_name: public.sdt_ga_acq_view ;;

## Primary Key ##

  dimension: acq_join_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.acq_join_id ;;
  }

  ## Dimensions joined from Ad Sources Derived Tables Lookup ##

  dimension: publisher {
    type: string
    group_label: "Paid Traffic Info"
    sql: ${sdt_ga_campaigns_lookup.publisher};;
  }

  dimension: campaign {
    type: string
    drill_fields: [publisher]
    group_label: "Paid Traffic Info"
    sql: ${sdt_ga_campaigns_lookup.campaign};;
  }

  ## Dimensions for Graig at SDT ##

  dimension: sdt_medium {
    type: string
    label: "Medium (SDT)"
    group_label: "Google Analytics Dimensions"
    sql:
      case
        when ${medium} ilike '%organic%' then 'Organic'
        when ${medium} ilike '%cpc%' then 'CPC'
        when ${medium} ilike '%campaign%' then 'CPC'
        when ${medium} ilike '%referral%' then 'Referral'
        when ${medium} ilike '%social%' then 'Social'
        when ${medium} ilike '%email%' then 'Email'
        else ${medium}
        end
        ;;
  }

  dimension: sdt_source {
    type: string
    label: "Source (SDT)"
    group_label: "Google Analytics Dimensions"
    sql:
      case
        when ${source} ilike '%pandora%' then 'Pandora'
        when ${source} ilike '%hulu%' then 'Hulu'
        when ${source} ilike '%facebook%' then 'Facebook'
        when ${source} ilike '%instagram%' then 'Instagram'
        when ${source} ilike '%twitter%' then 'twitter'
        when ${source} ilike '%taboola%' then 'Taboola'
        when ${source} ilike '%adara%' then 'Adara'
        when ${source} ilike '%sojern%' then 'Sojern'
        when ${source} ilike '%abc%' then 'ABC'
        when ${source} ilike '%spotx%' then 'Spot X'
        when ${source} ilike '%soje%' then 'Sojern'
        when ${source} ilike '%nbcsports%' then 'NBC Sports'
        when ${source} ilike '%nbcuniversal%' then 'NBC Universal'
        when ${source} ilike '%meredithcorp%' then 'Meredith'
        when ${source} ilike '%adroll%' then 'AdRoll'

        when ${source} ilike '%spotify%' then 'Spotify'
        when ${source} ilike '%cbspublish%' then 'CBS'
        when ${source} ilike '%stackadapt%' then 'StackAdapt'
        when ${source} ilike '%pinterest%' then 'Pinterest'
        when ${source} ilike '%condenast%' then 'Condé Nast'
        when ${source} ilike '%amobee%' then 'Amobee'
        when ${source} ilike '%inpowered%' then 'InPowered'
        when ${source} ilike '%exponential%' then 'Exponential'
        when ${source} ilike '%sunset.com%' then 'Sunset.com'
        when ${source} ilike '%tripadvisor%' then 'Trip Advisor'
        when ${source} ilike '%bellmedia%' then 'Bell Media'
        when ${source} ilike '%globaltv%' then 'Global TV'
        when ${source} ilike '%travelandleisure%' then 'Travel & Leisure'


        when ${source} ilike '%sandiegouniontrib%' then 'SD Union Tribune'
        else ${source}
        end ;;
  }

####### AdRoll Join ID #######

  dimension: adroll_join {
    type: string
    hidden: yes
    sql:
      case
        when ${keyword} = 'PT-Facebook-Single-Image' then 'Pull-Through Audience'
        when ${keyword} = 'PT-Facebook-Single-Image-PT' then 'Pull-Through Audience'
        when ${keyword} = 'Competitve-Facebook-Single-Image-Retargeting' then 'Competitive Conquesting_Audience'
        when ${keyword} = 'LA-Facebook-Single-Image-Retargeting' then 'Los Angeles_Audience'
        when ${keyword} = 'Disneyland-Facebook-Single-Image-Retargeting' then 'Disneyland_Audience'
        when ${keyword} = 'FacebookSingleImageRetargeting' then 'Pull-Through Audience'
        when ${keyword} = 'LAFacebookSingleImageRetargeting' then 'Los Angeles_Audience'
        when ${keyword} = 'CQ-Facebook-Single-Image-Retargeting' then 'Competitive Conquesting_Audience'
        end
    ;;
  }

  dimension: adroll_join_id {
    type: string
    hidden: yes
    sql: ${adroll_join}||'_'||${date_date} ;;
  }

  ## Dimensions added to this Table ##

#   dimension: traffic_type {
#     type: string
#     hidden: no
#     group_label: "Google Analytics Dimensions"
#     description: "This is determined by the medium of traffic. Includes campaign, cpc and ppc traffic."
#     sql:
#       case
#         when ${sourcemedium} ilike '%campaign%' then 'Paid'
#         when ${sourcemedium} ilike '%cpc%' then 'Paid'
#         when ${sourcemedium} ilike '%ppc%' then 'Paid'
#
#         else 'Not Paid'
#         end
#         ;;
#   }
#
#   dimension: is_paid_traffic {
#     type: yesno
#     group_label: "Paid Traffic Info"
#     description: "This is determined by the medium of traffic. Includes campaign, cpc and ppc traffic."
#     sql: ${traffic_type} = 'Paid' ;;
#   }

  ## Dimensions Native to this Table ##

  dimension: adwordsadgroupid {
    type: string
    hidden: yes
    group_label: "zz - Data Join IDs"
    label: "AdWords Ad Group ID"
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension_group: date {
    label: ""
    group_label: "Date Periods"
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      day_of_month,
      month_name,
      month_num,
      week_of_year,
      day_of_year,
    ]
    sql: ${TABLE}.date ;;
  }


  dimension: devicecategory {
    type: string
    group_label: "Google Analytics Dimensions"
    label: "Device Category"
    sql: ${TABLE}.devicecategory ;;
  }

  dimension: ga_ads_lookup_id {
    type: string
    hidden: yes
    group_label: "zz - Data Join IDs"
    sql: ${TABLE}.ga_ads_lookup_id ;;
  }

  dimension: keyword {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.keyword ;;
  }

  dimension: medium {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.medium ;;
  }

  dimension: member_interactions {
    type: number
    hidden: yes
    sql: ${TABLE}.member_interactions ;;
  }

  dimension: newsletter_sign_ups {
    type: number
    hidden: yes
    sql: ${TABLE}.newsletter_sign_ups ;;
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

  dimension: source {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.source ;;
  }

  dimension: sourcemedium {
    type: string
    group_label: "Google Analytics Dimensions"
    label: "Source / Medium"
    sql: ${TABLE}.sourcemedium ;;
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

  dimension: two_plus_pages_viewed {
    type: number
    hidden: yes
    sql: ${TABLE}.two_plus_pages_viewed ;;
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

  dimension: visitor_guide_digital {
    type: number
    hidden: yes
    sql: ${TABLE}.visitor_guide_digital ;;
  }

  dimension: visitor_guide_print {
    type: number
    hidden: yes
    sql: ${TABLE}.visitor_guide_print ;;
  }

  dimension: wheel_interaction {
    type: number
    hidden: yes
    sql: ${TABLE}.wheel_interaction ;;
  }

  ### All Measures go Below ###

  measure: total_sessions {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    sql: ${sessions} ;;
    label: "Sessions"
    group_label: "Traffic Metrics"
  }

  measure: total_session_duration {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    hidden: yes
    sql: ${sessionduration} ;;
    group_label: "Traffic Metrics"
  }

  measure: avg_time_on_site {
    label: "Avg. TOS"
    type: number
    sql: (${total_session_duration}/nullif(${total_sessions},0))::float/86400 ;;
    value_format: "m:ss"
    group_label: "Traffic Metrics"
  }

  measure: total_users {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    sql: ${users} ;;
    label: "Users"
    group_label: "Traffic Metrics"
  }

  measure: total_new_users {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    sql: ${newusers} ;;
    label: "New Users"
    group_label: "Traffic Metrics"
  }

  measure: percent_new_users {
    label: "New User Rate"
    group_label: "Traffic Metrics"
    type: number
    sql: 1.0*${total_new_users}/nullif(${total_users}, 0);;
    value_format_name: percent_0
  }

  measure: total_pageviews {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    group_label: "Traffic Metrics"
    sql: ${pageviews} ;;
    label: "Pageviews"
  }

  measure: pages_per_session {
    label: "Pages per Session"
    group_label: "Traffic Metrics"
    type: number
    sql: ${total_pageviews}/nullif(${total_sessions}, 0);;
    value_format_name: decimal_2
  }

  measure: total_bounces {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    group_label: "Traffic Metrics"
    sql: ${bounces} ;;
    label: "Bounces"
  }

  measure: bounce_rate {
    label: "Bounce Rate"
    group_label: "Traffic Metrics"
    type: number
    sql: 1.0*${total_bounces}/nullif(${total_sessions}, 0);;
    value_format_name: percent_0
  }

  ### GA Goals ###

  measure: total_video_starts {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    sql: ${video_starts} ;;
    label: "Video Starts"
    group_label: "Website Goals"
  }

  measure: video_start_rate {
    label: "Video Start Rate"
    group_label: "Website Goals"
    type: number
    sql: 1.0*${total_video_starts}/nullif(${total_sessions}, 0);;
    value_format_name: percent_0
  }

  measure: total_tos_above30s {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    sql: ${tos_above_30s} ;;
    label: "TOS >30s"
    group_label: "Website Goals"
  }

  measure: tos_above_30s_rate {
    label: "TOS >30s Rate"
    group_label: "Website Goals"
    type: number
    sql: 1.0*${total_tos_above30s}/nullif(${total_sessions}, 0);;
    value_format_name: percent_1
  }

  measure: total_tos_above120s {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    sql: ${tos_above_120s} ;;
    label: "TOS >120s"
    group_label: "Website Goals"
  }

  measure: tos_above_120s_rate {
    label: "TOS >120s Rate"
    group_label: "Website Goals"
    type: number
    sql: 1.0*${total_tos_above120s}/nullif(${total_sessions}, 0);;
    value_format_name: percent_1
  }

  measure: total_member_interactions {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    sql: ${member_interactions} ;;
    label: "Member Interactions"
    group_label: "Website Goals"
  }

  measure: member_interaction_rate {
    label: "Member Interaction Rate"
    group_label: "Website Goals"
    type: number
    sql: 1.0*${total_member_interactions}/nullif(${total_sessions}, 0);;
    value_format_name: percent_1
  }

  measure: total_two_plus_pages_viewed {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    sql: ${two_plus_pages_viewed} ;;
    label: "+2 Pageviews"
    group_label: "Website Goals"
  }

  measure: two_plus_pages_viewed_rate {
    label: "+2 Pageviews Rate"
    group_label: "Website Goals"
    type: number
    sql: 1.0*${total_two_plus_pages_viewed}/nullif(${total_sessions}, 0);;
    value_format_name: percent_1
  }

  measure: total_wheel_interactions {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    sql: ${wheel_interaction} ;;
    label: "Wheel Interactions"
    group_label: "Website Goals"
  }

  measure: wheel_interaction_rate {
    label: "Wheel Interaction Rate"
    group_label: "Website Goals"
    type: number
    sql: 1.0*${total_wheel_interactions}/nullif(${total_sessions}, 0);;
    value_format_name: percent_1
  }

  measure: total_newsletter_sign_ups {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    sql: ${newsletter_sign_ups} ;;
    label: "Newsletter Sign-Ups"
    group_label: "Website Goals"
  }

  measure: newsletter_sign_up_rate {
    label: "Newsletter Sign-Up Rate"
    group_label: "Website Goals"
    type: number
    sql: 1.0*${total_newsletter_sign_ups}/nullif(${total_sessions}, 0);;
    value_format_name: percent_1
  }

  measure: total_visitor_guide_digital {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    sql: ${visitor_guide_digital} ;;
    label: "Visitor Guide Digital"
    group_label: "Website Goals"
  }

  measure: visitor_guide_digital_rate {
    label: "Visitor Guide Digital Rate"
    group_label: "Website Goals"
    type: number
    sql: 1.0*${total_visitor_guide_digital}/nullif(${total_sessions}, 0);;
    value_format_name: percent_1
  }

  measure: total_visitor_guide_print {
    type: sum_distinct
    sql_distinct_key: ${acq_join_id} ;;
    sql: ${visitor_guide_print} ;;
    label: "Visitor Guide Print"
    group_label: "Website Goals"
  }

  measure: visitor_guide_print_rate {
    label: "Visitor Guide Print Rate"
    group_label: "Website Goals"
    type: number
    sql: 1.0*${total_visitor_guide_print}/nullif(${total_sessions}, 0);;
    value_format_name: percent_1
  }

}
