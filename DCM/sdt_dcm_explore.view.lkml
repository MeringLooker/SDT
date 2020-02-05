include: "/DCM/**/*.view"
include: "/Google_Analytics/**/*.view"
include: "/Publisher_Passback/**/*.view"

explore: sdt_dcm {
  view_name: sdt_dcm_view
  hidden: yes
  label: "DoubleClick"
  view_label: "DoubleClick"
  group_label: "San Diego Tourism"

  join: sdt_ga_onsite {
    view_label: "Google Analytics"
    type: left_outer
    fields: []
    sql_on: ${sdt_dcm_view.comp_key} = ${sdt_ga_onsite.join_id} ;;
    relationship: many_to_one
  }

  join: sdt_fy20_digital_video_cbs {
    view_label: "FY20 Digital Video Passback - CBS"
    type: inner
    sql_on: ${sdt_dcm_view.passback_join} = ${sdt_fy20_digital_video_cbs.passback_join} ;;
    relationship: many_to_one
  }

  join: sdt_fy20_digital_video_hulu {
    view_label: "FY20 Digital Video Passback - Hulu"
    type: inner
    sql_on: ${sdt_dcm_view.passback_join} = ${sdt_fy20_digital_video_hulu.passback_join} ;;
    relationship: many_to_one
  }

  join: sdt_fy20_digital_video_amobee {
    view_label: "FY20 Digital Video Passback - Amobee"
    type: inner
    sql_on: ${sdt_dcm_view.passback_join} = ${sdt_fy20_digital_video_amobee.passback_join} ;;
    relationship: many_to_one
  }

  join: sdt_fy20_digital_video_abc {
    view_label: "FY20 Digital Video Passback - ABC"
    type: inner
    sql_on: ${sdt_dcm_view.passback_join} = ${sdt_fy20_digital_video_abc.passback_join} ;;
    relationship: many_to_one
  }

  join: sdt_fy20_digital_video_nbc {
    view_label: "FY20 Digital Video Passback - NBC"
    type: inner
    sql_on: ${sdt_dcm_view.passback_join} = ${sdt_fy20_digital_video_nbc.passback_join} ;;
    relationship: many_to_one
  }

  join: sdt_fy20_content_stackadapt {
    view_label: "FY20 Always On Content Passback - StackAdapt"
    type: inner
    sql_on: ${sdt_dcm_view.passback_join_ad} = ${sdt_fy20_content_stackadapt.passback_join} ;;
    relationship: many_to_one
  }

  join: sdt_fy20_uk_digital_exponential {
    view_label: "FY20 UK Digital Passback - Exponential"
    type: inner
    sql_on: ${sdt_dcm_view.passback_join} = ${sdt_fy20_uk_digital_exponential.passback_join} ;;
    relationship: many_to_one
  }

}
#
# explore: sdt_fy20_digital_video_cbs {
#   join: sdt_dcm_view {
#     sql_on: ${sdt_fy20_digital_video_cbs.passback_join} = ${sdt_dcm_view.passback_join} ;;
#     type: left_outer
#     fields: [sdt_dcm_view.placement,sdt_dcm_view.creative,sdt_dcm_view.publisher]
#     relationship: one_to_many
#   }
# }
