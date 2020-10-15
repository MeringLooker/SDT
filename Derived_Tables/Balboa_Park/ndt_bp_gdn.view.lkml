view: ndt_bp_gdn {
  derived_table: {
    explore_source: sdt_gdn {
      column: publisher {field: sdt_gdn_ga_view.publisher}
      column: campaign {field: sdt_gdn_ga_view.sdt_campaign}
      column: placement {field: sdt_gdn_ga_view.sdt_placement}
      column: ad_size {field: sdt_gdn_ga_view.ad_size}
      column: date {field: sdt_gdn_ga_view.day_date}
      column: week {field: sdt_gdn_ga_view.day_week}
      column: month {field: sdt_gdn_ga_view.day_month}
      column: total_impressions {field: sdt_gdn_ga_view.total_impressions}
      column: total_clicks {field: sdt_gdn_ga_view.total_clicks}
      column: total_cost {field: sdt_gdn_ga_view.total_cost}
      column: total_sessions {field: sdt_gdn_ga_view.total_sessions}
      column: total_session_duration {field: sdt_gdn_ga_view.total_session_duration}
      filters: {
        field: sdt_gdn_ga_view.sdt_campaign
        value: "Balboa Park Digital"
      }
      filters: {
        field: sdt_gdn_ga_view.day_date
        value: "2020/02/24 to 2020/03/14"
      }
    }
    datagroup_trigger: 24hour_cache
    distribution_style: all
  }
}
