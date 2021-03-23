view: pdt_fy21_spring_awareness_ta_horizon {
  derived_table: {
    explore_source: sdt_fy21_awareness_tripadv_data {
      column: publisher {field: sdt_fy21_awareness_tripadv_data.publisher}
      column: campaign {field: sdt_fy21_awareness_tripadv_data.sdt_campaign}
      column: market {field: sdt_fy21_awareness_tripadv_data.sdt_market}
      column: region {field: sdt_fy21_awareness_tripadv_data.sdt_region}
      column: placement {field: sdt_fy21_awareness_tripadv_data.sdt_placement}
      column: creative_name {field: sdt_fy21_awareness_tripadv_data.creative_name}
      column: ad_size {field: sdt_fy21_awareness_tripadv_data.ad_size}
      column: date {field: sdt_fy21_awareness_tripadv_data.date_date}
      column: total_impressions {field: sdt_fy21_awareness_tripadv_data.total_impressions}
      column: total_clicks {field: sdt_fy21_awareness_tripadv_data.total_clicks}
      column: total_cost {field: sdt_fy21_awareness_tripadv_data.total_cost}
      column: total_views {field: sdt_fy21_awareness_tripadv_data.total_views}
      column: total_completes {field: sdt_fy21_awareness_tripadv_data.total_completes}
      column: total_sessions {field: sdt_fy21_awareness_tripadv_data.total_sessions}
      column: total_session_duration {field: sdt_fy21_awareness_tripadv_data.total_session_duration}
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
