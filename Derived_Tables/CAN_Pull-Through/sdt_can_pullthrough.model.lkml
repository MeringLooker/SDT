connection: "mc_panoply"

# include: "*.view.lkml"
# include: "/Google_Analytics/*.view"
# include: "/DCM/*.view"

# datagroup: sdt_can_pullthrough_datagroup {
#   sql_trigger: SELECT current_date;;
#   max_cache_age: "24 hours"
# }


# explore: ndt_can_pullthrough_campaign {
#   #persist_with: vca_dream365_datagroup
#   label: "CAN Pull-Through"
#   view_label: "CAN Pull-Through"
#   group_label: "San Diego Tourism"
#   hidden: yes
# }
