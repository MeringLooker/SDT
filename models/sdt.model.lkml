connection: "mc_panoply"
include: "/Publisher_Passback/TA_Destination_Sponsorship/*.view"

explore: sdt_ta_dest_spon_elements {
  hidden: no
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
