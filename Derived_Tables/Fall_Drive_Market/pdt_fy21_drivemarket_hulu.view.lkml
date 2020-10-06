view: pdt_fy21_drivemarket_hulu {
  derived_table: {
    explore_source: sdt_fy21_dm_hulu {
      column: publisher {field: sdt_fy21_dm_hulu.publisher}
      column: campaign {field: sdt_fy21_dm_hulu.sdt_campaign}
      column: market {field: sdt_fy21_dm_hulu.sdt_market}
      column: layer {field: sdt_fy21_dm_hulu.sdt_layer}
      column: region {field: sdt_fy21_dm_hulu.sdt_region}
      column: placement {field: sdt_fy21_dm_hulu.sdt_placement}
      column: creative_name {field: sdt_fy21_dm_hulu.creative_name}
      column: date {field: sdt_fy21_dm_hulu.date_date}
      column: week {field: sdt_fy21_dm_hulu.date_week}
      column: month {field: sdt_fy21_dm_hulu.date_month}
      column: total_impressions {field: sdt_fy21_dm_hulu.total_impressions}
      column: total_clicks {field: sdt_fy21_dm_hulu.total_clicks}
      column: total_cost {field: sdt_fy21_dm_hulu.total_cost}
      column: total_views {field: sdt_fy21_dm_hulu.total_views}
      column: total_completes {field: sdt_fy21_dm_hulu.total_completes}
      column: total_sessions {field: sdt_fy21_dm_hulu.total_sessions}
      column: total_session_duration {field: sdt_fy21_dm_hulu.total_session_duration}
      filters: {
        field: sdt_fy21_dm_hulu.date_date
        value: "2020/07/27 to 2020/11/16"
      }
    }
    datagroup_trigger: sdt_falldrivemarket_datagroup
    distribution_style: all
  }
}
