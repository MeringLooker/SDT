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

explore: sdt_fy21_pt_priceline_bookings {
  hidden: yes
  label: "Priceline FY21 US PullThrough"
  view_label: "Bookings"
  group_label: "San Diego Tourism"
}

explore: sdt_fy21_pt_priceline_data {
  hidden: yes
  label: "Priceline FY21 US PullThrough Rptg"
  view_label: "Native Data"
  group_label: "San Diego Tourism"
}

explore: sdt_fy21_pt_2h_adara_offline {
  hidden: yes
  label: "Adara FY21 US PullThrough Rptg"
  view_label: "Adara"
  group_label: "San Diego Tourism"
}
