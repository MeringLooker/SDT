view: pdt_fy21_pullthrough_ta_pub {
  derived_table: {
    explore_source: sdt_fy21_pt_2h_ta {
      column: publisher {field: sdt_fy21_pt_2h_ta.publisher}
      column: campaign {field: sdt_fy21_pt_2h_ta.sdt_campaign}
      column: market {field: sdt_fy21_pt_2h_ta.sdt_market}
      column: layer {field: sdt_fy21_pt_2h_ta.sdt_layer}
      column: region {field: sdt_fy21_pt_2h_ta.sdt_region}
      column: placement {field: sdt_fy21_pt_2h_ta.sdt_placement}
      column: creative_name {field: sdt_fy21_pt_2h_ta.sdt_creative}
      column: ad_size {field: sdt_fy21_pt_2h_ta.ad_size}
      column: date {field: sdt_fy21_pt_2h_ta.date_date}
      column: week {field: sdt_fy21_pt_2h_ta.date_week}
      column: month {field: sdt_fy21_pt_2h_ta.date_month}
      column: quarter {field: sdt_fy21_pt_2h_ta.date_quarter}
      column: total_impressions {field: sdt_fy21_pt_2h_ta.total_impressions}
      column: total_clicks {field: sdt_fy21_pt_2h_ta.total_clicks}
      column: total_cost {field: sdt_fy21_pt_2h_ta.total_cost}
      column: total_views {field: sdt_fy21_pt_2h_ta.total_views}
      column: total_completes {field: sdt_fy21_pt_2h_ta.total_completes}
      column: total_sessions {field: sdt_fy21_pt_2h_ta.total_sessions}
      column: total_session_duration {field: sdt_fy21_pt_2h_ta.total_session_duration}
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
