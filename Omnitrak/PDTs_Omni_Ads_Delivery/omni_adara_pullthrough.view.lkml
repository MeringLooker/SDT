view: omni_adara_pullthrough {
  derived_table: {
    explore_source: sdt_fy21_pt_adara {
      column: ad_id {field: sdt_fy21_pt_adara.ad_id}
      column: ad_name {field: sdt_fy21_pt_adara.ad_name}
      column: date {field: sdt_fy21_pt_adara.date_date}
      column: campaign {field: sdt_fy21_pt_adara.sdt_campaign}
      column: placement {field: sdt_fy21_pt_adara.sdt_placement}
      column: publisher {field: sdt_fy21_pt_adara.publisher}
      column: region {field: sdt_fy21_pt_adara.sdt_region}
      column: creative_name {field: sdt_fy21_pt_adara.creative_name}
      column: total_impressions {field: sdt_fy21_pt_adara.total_impressions}
      column: total_clicks {field: sdt_fy21_pt_adara.total_clicks}
      column: total_views {field: sdt_fy21_pt_adara.total_video_views}
      column: total_cost {field: sdt_fy21_pt_adara.total_media_cost}
    }
    datagroup_trigger: sdt_omnitrak_datagroup
    distribution_style: all
  }
}
