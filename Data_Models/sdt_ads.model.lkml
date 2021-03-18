connection: "mc_panoply"

include: "/AdWords/**/*.view"
include: "/DCM/**/*.view"
include: "/Publisher_Passback/**/*.view"
include: "/Facebook/**/*.view"
include: "/Google_Analytics/**/*.view"
include: "/Omnitrak/**/*.view"
include: "/Pinterest/**/*.view"
include: "/TrueView/**/*.view"
include: "/Snap/**/*.view"
include: "/Helm/**/*.view"

datagroup: sdt_default_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

## Google Display ##

explore: sdt_gdn_extended {
  persist_with: sdt_default_datagroup
  hidden: no
  extends: [sdt_gdn]
}

## Google Search ##

explore: sdt_sem_extended {
  persist_with: sdt_default_datagroup
  hidden: no
  extends: [sdt_sem]
}

## DoubleClick ##

explore: sdt_dcm_extended {
  persist_with: sdt_default_datagroup
  extends: [sdt_dcm]
  hidden: no
}

## Facebook Ads ##

explore: sdt_fb_extended {
  persist_with: sdt_default_datagroup
  extends: [sdt_fb]
  hidden: no
}

## Google Analytics ##

explore: sdt_ga_extended {
  persist_with: sdt_default_datagroup
  hidden: no
  extends: [sdt_ga]
}

## Helm ##

explore: sdt_helm_extended {
  persist_with: sdt_default_datagroup
  extends: [sdt_helm]
  hidden: no
}

## Pinterest Ads ##

explore: sdt_pinterest_extended {
  persist_with: sdt_default_datagroup
  extends: [sdt_pinterest]
  hidden: no
}

## Snap Ads ##

explore: sdt_snapchat_extended {
  persist_with: sdt_default_datagroup
  extends: [sdt_snap]
  hidden: no
}

## YouTube TrueView ##

explore: sdt_yt_extended {
  persist_with: sdt_default_datagroup
  extends: [sdt_yt]
  hidden: no
}

## TripAdvisor Destination Sponsorship ##

explore: sdt_ta_dest_spon_elements {
  persist_with: sdt_default_datagroup
  hidden: yes
  view_label: "Elements Overview"
  label: "TripAdvisor Destination Sponsorship"
  group_label: "San Diego Tourism"

  join: sdt_ta_dest_spon_overview {
    view_label: "Destination Sponsorship Overview"
    type: left_outer
    sql_on: ${sdt_ta_dest_spon_elements.overview_pk} = ${sdt_ta_dest_spon_overview.overview_pk} ;;
    relationship: many_to_one
  }

  join: sdt_ta_dest_spon_content {
    view_label: "Content Overview"
    type: left_outer
    sql_on: ${sdt_ta_dest_spon_overview.overview_pk} = ${sdt_ta_dest_spon_content.overview_pk} ;;
    relationship: many_to_one
  }
}

## TripAdvisor UK Content Hub ##

explore: sdt_fy20_ta_uk_content_hub {
  persist_with: sdt_default_datagroup
  hidden: yes
  label: "TripAdvisor UK - Content Hub"
  view_label: "TripAdvisor - Content Hub"
  group_label: "San Diego Tourism"
}

## TripAdvisor CAN Content Hub ##

explore: sdt_fy20_ta_can_content_hub {
  persist_with: sdt_default_datagroup
  hidden: yes
  label: "TripAdvisor CAN - Content Hub"
  view_label: "TripAdvisor - Content Hub"
  group_label: "San Diego Tourism"
}

## TripAdvisor US Content Hub ##

explore: sdt_fy20_ta_us_content_hub {
  persist_with: sdt_default_datagroup
  hidden: yes
  label: "TripAdvisor US - Content Hub"
  view_label: "TripAdvisor - Content Hub"
  group_label: "San Diego Tourism"
}
