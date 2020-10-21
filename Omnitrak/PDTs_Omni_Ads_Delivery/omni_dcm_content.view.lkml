view: omni_dcm_content {
  derived_table: {
    explore_source: sdt_dcm {
      column: ad_id {field: sdt_dcm_ga_view.ad_id}
      column: ad_name {field: sdt_dcm_ga_view.ad}
      column: date {field: sdt_dcm_ga_view.date_date}
      column: campaign {field: sdt_dcm_ga_view.sdt_campaign}
      column: placement {field: sdt_dcm_ga_view.sdt_placement}
      column: publisher {field: sdt_dcm_ga_view.publisher}
      column: region {field: sdt_dcm_ga_view.sdt_region}
      column: creative_name {field: sdt_dcm_ga_view.creative_name}
      column: total_impressions {field: sdt_fy21_content_view.total_impressions}
      column: total_clicks {field: sdt_fy21_content_view.total_clicks}
      column: total_views {field: sdt_fy21_content_view.total_video_views}
      column: total_cost {field: sdt_fy21_content_view.total_media_cost}
      filters: {
        field: sdt_fy21_content_view.total_impressions
        value: ">0"
      }
      filters: {
        field: sdt_dcm_ga_view.date_date
        value: "after 2020/07/01"
      }
      filters: {
        field: sdt_dcm_ga_view.sdt_campaign
        value: "Always On Content"
      }
    }
    datagroup_trigger: sdt_omnitrak_datagroup
    distribution_style: all
  }
}
