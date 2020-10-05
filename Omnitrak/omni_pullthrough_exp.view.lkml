view: omni_pullthrough_exp {
  derived_table: {
    explore_source: sdt_fy21_pullthrough_expedia {
      column: ad_id {field: sdt_fy21_pullthrough_expedia.expedia_join_id}
      column: ad_name {field: sdt_fy21_pullthrough_expedia.expedia_line_creative_name}
      column: date {field: sdt_fy21_pullthrough_expedia.date_date}
      column: campaign {field: sdt_fy21_pullthrough_expedia.sdt_campaign}
      column: publisher {field: sdt_fy21_pullthrough_expedia.publisher}
      column: region {field: sdt_fy21_pullthrough_expedia.sdt_region}
      column: creative_name {field: sdt_fy21_pullthrough_expedia.mering_creative}
      column: total_impressions {field: sdt_fy21_pullthrough_expedia.total_impressions}
      column: total_clicks {field: sdt_fy21_pullthrough_expedia.total_clicks}
      column: total_views {field: sdt_fy21_pullthrough_expedia.total_views}
      column: total_cost {field: sdt_fy21_pullthrough_expedia.total_cost}
    }
    datagroup_trigger: sdt_omnitrak_datagroup
    distribution_style: all
  }
}
