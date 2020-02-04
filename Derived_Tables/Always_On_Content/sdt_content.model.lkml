connection: "mc_panoply"

include: "*.view.lkml"
include: "/Facebook/*.view"
include: "/TrueView/*.view"
include: "/AdWords/*.view"
include: "/Pinterest/*.view"

datagroup: sdt_content_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: pdt_content_campaign {
  #persist_with: vca_dream365_datagroup
  label: "Always On Content"
  view_label: "Always On Content"
  group_label: "San Diego Tourism"
  hidden: yes
}

explore: pdt_content_yt {
  #persist_with: vca_dream365_datagroup
  label: "Always On Content - yt"
  view_label: "Always On Content - yt"
  group_label: "San Diego Tourism"
  hidden: yes
}

explore: pdt_content_fb {
  #persist_with: vca_dream365_datagroup
  label: "Always On Content - fb"
  view_label: "Always On Content - fb"
  group_label: "San Diego Tourism"
  hidden: yes
}

explore: pdt_content_gdn {
  #persist_with: vca_dream365_datagroup
  label: "Always On Content - gdn"
  view_label: "Always On Content - gdn"
  group_label: "San Diego Tourism"
  hidden: yes
}
