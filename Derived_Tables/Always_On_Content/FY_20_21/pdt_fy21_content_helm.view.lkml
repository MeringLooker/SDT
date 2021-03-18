view: pdt_fy21_content_helm {
  derived_table: {
    explore_source: sdt_helm {
      column: publisher {field: sdt_helm_ga_view.publisher}
      column: campaign {field: sdt_helm_ga_view.sdt_campaign}
      column: market {field: sdt_helm_ga_view.sdt_market}
      column: layer {field: sdt_helm_ga_view.sdt_layer}
      column: region {field: sdt_helm_ga_view.sdt_region}
      column: placement {field: sdt_helm_ga_view.sdt_placement}
      column: creative_name {field: sdt_helm_ga_view.creative_name}
      column: pillar {field: sdt_helm_ga_view.sdt_pillar}
      column: ad_size {field: sdt_helm_ga_view.ad_size}
      column: date {field: sdt_helm_ga_view.date_date}
      column: week {field: sdt_helm_ga_view.date_week}
      column: month {field: sdt_helm_ga_view.date_month}
      column: total_impressions {field: sdt_helm_ga_view.total_impressions}
      column: total_clicks {field: sdt_helm_ga_view.total_clicks}
      column: total_cost {field: sdt_helm_ga_view.total_cost}
      column: total_views {field: sdt_helm_ga_view.total_video_starts}
      column: total_completes {field: sdt_helm_ga_view.total_completes}
      column: total_sessions {field: sdt_helm_ga_view.total_sessions}
      column: total_session_duration {field: sdt_helm_ga_view.total_session_duration}
      filters: {
        field: sdt_helm_ga_view.sdt_campaign
        value: "Always On Content"
      }
      filters: {
        field: sdt_helm_ga_view.date_date
        value: "2021/03/01 to 2021/07/01"
      }
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
