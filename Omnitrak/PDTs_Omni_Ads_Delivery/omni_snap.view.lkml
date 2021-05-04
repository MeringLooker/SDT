view: omni_snap {
  derived_table: {
    explore_source: sdt_snap {
      column: ad_id { field: sdt_snap_ga_view.ad_id }
      column: ad_name { field: sdt_snap_ga_view.ad_name }
      column: date { field: sdt_snap_ga_view.date_date }
      column: campaign { field: sdt_snap_ga_view.sdt_campaign }
      column: placement { field: sdt_snap_ga_view.sdt_placement }
      column: publisher { field: sdt_snap_ga_view.publisher }
      column: region { field: sdt_snap_ga_view.sdt_region }
      column: creative_name { field: sdt_snap_ga_view.creative_name }
      column: total_impressions { field: sdt_snap_ga_view.total_impressions }
      column: total_clicks { field: sdt_snap_ga_view.total_clicks }
      column: total_cost { field: sdt_snap_ga_view.total_cost }
      column: total_views { field: sdt_snap_ga_view.total_views_at_25 }
      filters: {
        field: sdt_snap_ga_view.date_date
        value: "2021/03/01 to 2021/07/01"
      }
      filters: {
        field: sdt_snap_ga_view.sdt_campaign
        value: "Spring Awareness"
      }
    }
  }
}
