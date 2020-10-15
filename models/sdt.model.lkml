connection: "mc_panoply"

# include: "/Publisher_Passback/TA_Destination_Sponsorship/*.view"
# include: "/Publisher_Passback/**/*.view"

# explore: sdt_ta_dest_spon_elements {
#   hidden: yes
#   view_label: "Elements Overview"
#   label: "TripAdvisor Destination Sponsorship"
#   group_label: "San Diego Tourism"

#   join: sdt_ta_dest_spon_overview {
#     view_label: "Destination Sponsorship Overview"
#     type: left_outer
#     sql_on: ${sdt_ta_dest_spon_elements.overview_pk} = ${sdt_ta_dest_spon_overview.overview_pk} ;;
#     relationship: many_to_one
#   }

#   join: sdt_ta_dest_spon_content {
#     view_label: "Content Overview"
#     type: left_outer
#     sql_on: ${sdt_ta_dest_spon_overview.overview_pk} = ${sdt_ta_dest_spon_content.overview_pk} ;;
#     relationship: many_to_one
#   }
# }

# explore: sdt_fy20_ta_uk_content_hub {
#   hidden: yes
#   label: "TripAdvisor UK - Content Hub"
#   view_label: "TripAdvisor - Content Hub"
#   group_label: "San Diego Tourism"
# }

# explore: sdt_fy20_ta_can_content_hub {
#   hidden: yes
#   label: "TripAdvisor CAN - Content Hub"
#   view_label: "TripAdvisor - Content Hub"
#   group_label: "San Diego Tourism"
# }
