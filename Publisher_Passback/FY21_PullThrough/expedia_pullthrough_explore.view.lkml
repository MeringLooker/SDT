include: "/Publisher_Passback/**/*.view"

explore: sdt_fy21_pullthrough_expedia {
  hidden: yes
  label: "Expedia FY21 US PullThrough"
  view_label: "Ads"
  group_label: "San Diego Tourism"

    join: sdt_fy21_pullthrough_expedia_bookings {
      view_label: "Bookings"
      sql_on: ${sdt_fy21_pullthrough_expedia.bookings_join_id} = ${sdt_fy21_pullthrough_expedia_bookings.bookings_join_id};;
      relationship: many_to_one
    }
}

# explore: sojern_pt_test_view {
#   hidden: no
#   label: "Sojern 1P Reporting"
#   view_label: "Ads"
#   group_label: "San Diego Tourism"
# }
