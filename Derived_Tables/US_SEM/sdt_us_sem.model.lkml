connection: "mc_panoply"

include: "*.view.lkml"
include: "/AdWords/*.view"

datagroup: sdt_us_sem_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: pdt_us_sem_campaign {
  label: "FY21 US SEM"
  view_label: "FY21 US SEM"
  group_label: "San Diego Tourism"
  hidden: no
}
