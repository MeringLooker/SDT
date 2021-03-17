view: pdt_fy21_spring_awareness_snap {
    derived_table: {
      explore_source: sdt_snap {
        column: publisher { field: sdt_snap_ga_view.publisher }
        column: campaign { field: sdt_snap_ga_view.sdt_campaign }
        column: market { field: sdt_snap_ga_view.sdt_market }
        column: region { field: sdt_snap_ga_view.sdt_region }
        column: placement { field: sdt_snap_ga_view.sdt_placement }
        column: creative_name { field: sdt_snap_ga_view.creative_name }
        column: ad_size { field: sdt_snap_ga_view.ad_size }
        column: date { field: sdt_snap_ga_view.date_date }
        column: total_impressions { field: sdt_snap_ga_view.total_impressions }
        column: total_clicks { field: sdt_snap_ga_view.total_clicks }
        column: total_cost { field: sdt_snap_ga_view.total_cost }
        column: total_views { field: sdt_snap_ga_view.total_views_at_25 }
        column: total_completes { field: sdt_snap_ga_view.total_views_at_100 }
        column: total_sessions { field: sdt_snap_ga_view.total_sessions }
        column: total_session_duration { field: sdt_snap_ga_view.total_session_duration }
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
