view: omni_hulu_drivemarket {
  derived_table: {
    explore_source: sdt_fy21_dm_hulu {
      column: ad_id {field: sdt_fy21_dm_hulu.ad_id}
      column: ad_name {field: sdt_fy21_dm_hulu.ad_name}
      column: date {field: sdt_fy21_dm_hulu.date_date}
      column: campaign {field: sdt_fy21_dm_hulu.sdt_campaign}
      column: publisher {field: sdt_fy21_dm_hulu.publisher}
      column: region {field: sdt_fy21_dm_hulu.sdt_region}
      column: creative_name {field: sdt_fy21_dm_hulu.creative_name}
      column: total_impressions {field: sdt_fy21_dm_hulu.total_impressions}
      column: total_clicks {field: sdt_fy21_dm_hulu.total_clicks}
      column: total_views {field: sdt_fy21_dm_hulu.total_views}
      column: total_cost {field: sdt_fy21_dm_hulu.total_cost}
    }
    datagroup_trigger: sdt_omnitrak_datagroup
    distribution_style: all
  }
}
