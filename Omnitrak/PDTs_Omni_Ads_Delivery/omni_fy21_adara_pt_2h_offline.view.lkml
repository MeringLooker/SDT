view: omni_fy21_adara_pt_2h_offline {
  derived_table: {
    explore_source: sdt_fy21_pt_2h_adara_offline {
      column: ad_id {field: sdt_fy21_pt_2h_adara_offline.id}
      column: ad_name {field: sdt_fy21_pt_2h_adara_offline.omni_ad_name}
      column: date {field: sdt_fy21_pt_2h_adara_offline.date_date}
      column: campaign {field: sdt_fy21_pt_2h_adara_offline.sdt_campaign}
      column: placement {field: sdt_fy21_pt_2h_adara_offline.placement_name}
      column: publisher {field: sdt_fy21_pt_2h_adara_offline.publisher}
      column: region {field: sdt_fy21_pt_2h_adara_offline.region}
      column: creative_name {field: sdt_fy21_pt_2h_adara_offline.creative_name}
      column: total_impressions {field: sdt_fy21_pt_2h_adara_offline.total_impressions}
      column: total_clicks {field: sdt_fy21_pt_2h_adara_offline.total_clicks}
      column: total_cost {field: sdt_fy21_pt_2h_adara_offline.total_cost}
      column: total_views {field: sdt_fy21_pt_2h_adara_offline.total_views}
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
