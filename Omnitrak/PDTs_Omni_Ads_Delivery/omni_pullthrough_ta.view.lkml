view: omni_pullthrough_ta {
  derived_table: {
    explore_source: sdt_fy21_pt_2h_ta {
      column: ad_id {field: sdt_fy21_pt_2h_ta.id}
      column: ad_name {field: sdt_fy21_pt_2h_ta.line_item}
      column: date {field: sdt_fy21_pt_2h_ta.date_date}
      column: campaign {field: sdt_fy21_pt_2h_ta.sdt_campaign}
      column: placement {field: sdt_fy21_pt_2h_ta.sdt_placement}
      column: publisher {field: sdt_fy21_pt_2h_ta.publisher}
      column: region {field: sdt_fy21_pt_2h_ta.sdt_region}
      column: creative_name {field: sdt_fy21_pt_2h_ta.sdt_creative}
      column: total_impressions {field: sdt_fy21_pt_2h_ta.total_impressions}
      column: total_clicks {field: sdt_fy21_pt_2h_ta.total_clicks}
      column: total_cost {field: sdt_fy21_pt_2h_ta.total_cost}
      column: total_views {field: sdt_fy21_pt_2h_ta.total_views}
      filters: {
        field: sdt_fy21_pt_2h_ta.date_date
        value: "2021/02/08 to 2021/07/01"
      }
      filters: {
        field: sdt_fy21_pt_2h_ta.sdt_placement
        value: "TripAdvisor Native Boost"
      }
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
