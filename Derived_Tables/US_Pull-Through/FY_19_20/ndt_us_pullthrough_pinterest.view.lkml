view: ndt_us_pullthrough_pinterest {
  derived_table: {
    explore_source: sdt_pinterest {
      column: publisher { field: sdt_pinterest_ga_view.publisher }
      column: campaign { field: sdt_pinterest_ga_view.sdt_campaign }
      column: market { field: sdt_pinterest_ga_view.sdt_market }
      column: layer { field: sdt_pinterest_ga_view.sdt_layer }
      column: placement { field: sdt_pinterest_ga_view.sdt_placement }
      column: ad_size { field: sdt_pinterest_ga_view.ad_size }
      column: date { field: sdt_pinterest_ga_view.date_date }
      column: week { field: sdt_pinterest_ga_view.date_week }
      column: month { field: sdt_pinterest_ga_view.date_month }
      column: quarter { field: sdt_pinterest_ga_view.date_quarter }
      column: total_impressions { field: sdt_pinterest_ga_view.total_impressions }
      column: total_clicks { field: sdt_pinterest_ga_view.total_clicks }
      column: total_cost { field: sdt_pinterest_ga_view.total_spend }
      column: total_sessions { field: sdt_pinterest_ga_view.total_sessions }
      column: total_session_duration { field: sdt_pinterest_ga_view.total_session_duration }
      filters: {
        field: sdt_pinterest_ga_view.sdt_campaign
        value: "US Pull-Through"
      }
      filters: {
        field: sdt_pinterest_ga_view.date_date
        value: "2019/09/16 to 2020/03/14"
      }
    }
    datagroup_trigger: 24hour_cache
    distribution_style: all
  }
}
