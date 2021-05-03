view: omni_pullthrough_priceline {
  derived_table: {
    explore_source: sdt_fy21_pt_priceline_data {
      column: ad_id {field: sdt_fy21_pt_priceline_data.line_item_id}
      column: ad_name {field: sdt_fy21_pt_priceline_data.line_item}
      column: date {field: sdt_fy21_pt_priceline_data.date_date}
      column: campaign {field: sdt_fy21_pt_priceline_data.sdt_campaign}
      column: placement {field: sdt_fy21_pt_priceline_data.sdt_placement}
      column: publisher {field: sdt_fy21_pt_priceline_data.publisher}
      column: region {field: sdt_fy21_pt_priceline_data.sdt_region}
      column: creative_name {field: sdt_fy21_pt_priceline_data.creative_name}
      column: total_impressions {field: sdt_fy21_pt_priceline_data.total_impressions}
      column: total_clicks {field: sdt_fy21_pt_priceline_data.total_clicks}
      column: total_cost {field: sdt_fy21_pt_priceline_data.total_cost}
      column: total_views {field: sdt_fy21_pt_priceline_data.total_views}
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
