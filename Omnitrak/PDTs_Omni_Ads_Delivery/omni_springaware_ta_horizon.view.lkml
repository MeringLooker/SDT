view: omni_springaware_ta_horizon {
  derived_table: {
    explore_source: sdt_fy21_awareness_tripadv_data {
      column: ad_id {field: sdt_fy21_awareness_tripadv_data.id}
      column: ad_name {field: sdt_fy21_awareness_tripadv_data.creative}
      column: date {field: sdt_fy21_awareness_tripadv_data.date_date}
      column: campaign {field: sdt_fy21_awareness_tripadv_data.sdt_campaign}
      column: placement {field: sdt_fy21_awareness_tripadv_data.sdt_placement}
      column: publisher {field: sdt_fy21_awareness_tripadv_data.publisher}
      column: region {field: sdt_fy21_awareness_tripadv_data.sdt_region}
      column: creative_name {field: sdt_fy21_awareness_tripadv_data.creative_name}
      column: total_impressions {field: sdt_fy21_awareness_tripadv_data.total_impressions}
      column: total_clicks {field: sdt_fy21_awareness_tripadv_data.total_clicks}
      column: total_cost {field: sdt_fy21_awareness_tripadv_data.total_cost}
      column: total_views {field: sdt_fy21_awareness_tripadv_data.total_views}
      filters: {
        field: sdt_fy21_awareness_tripadv_data.sdt_placement
        value: "TripAdvisor Horizon High Impact Display (Variety Seeker)"
      }
      filters: {
        field: sdt_fy21_awareness_tripadv_data.date_date
        value: "2021/03/01 to 2021/07/01"
      }
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
