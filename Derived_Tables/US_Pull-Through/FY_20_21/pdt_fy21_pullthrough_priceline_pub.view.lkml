view: pdt_fy21_pullthrough_priceline_pub {
  derived_table: {
    explore_source: sdt_fy21_pt_priceline_data {
      column: publisher {field: sdt_fy21_pt_priceline_data.publisher}
      column: campaign {field: sdt_fy21_pt_priceline_data.sdt_campaign}
      column: market {field: sdt_fy21_pt_priceline_data.sdt_market}
      column: layer {field: sdt_fy21_pt_priceline_data.sdt_layer}
      column: region {field: sdt_fy21_pt_priceline_data.sdt_region}
      column: placement {field: sdt_fy21_pt_priceline_data.sdt_placement}
      column: creative_name {field: sdt_fy21_pt_priceline_data.creative_name}
      column: ad_size {field: sdt_fy21_pt_priceline_data.ad_size}
      column: date {field: sdt_fy21_pt_priceline_data.date_date}
      column: week {field: sdt_fy21_pt_priceline_data.date_week}
      column: month {field: sdt_fy21_pt_priceline_data.date_month}
      column: quarter {field: sdt_fy21_pt_priceline_data.date_quarter}
      column: total_impressions {field: sdt_fy21_pt_priceline_data.total_impressions}
      column: total_clicks {field: sdt_fy21_pt_priceline_data.total_clicks}
      column: total_cost {field: sdt_fy21_pt_priceline_data.total_cost}
      column: total_views {field: sdt_fy21_pt_priceline_data.total_views}
      column: total_completes {field: sdt_fy21_pt_priceline_data.total_completes}
      column: total_sessions {field: sdt_fy21_pt_priceline_data.total_sessions}
      column: total_session_duration {field: sdt_fy21_pt_priceline_data.total_session_duration}
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
