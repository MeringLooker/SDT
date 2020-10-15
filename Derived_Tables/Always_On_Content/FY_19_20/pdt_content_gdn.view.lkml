view: pdt_content_gdn {
  derived_table: {
    explore_source: sdt_gdn {
      column: publisher {field: sdt_gdn_ga_view.publisher}
      column: campaign {field: sdt_gdn_ga_view.sdt_campaign}
      column: market {field: sdt_gdn_ga_view.sdt_market}
      column: region {field: sdt_gdn_ga_view.sdt_region}
      column: layer {field: sdt_gdn_ga_view.sdt_layer}
      column: placement {field: sdt_gdn_ga_view.sdt_placement}
      column: pillar {field: sdt_gdn_ga_view.sdt_pillar}
      column: creative_name {field: sdt_gdn_ga_view.creative_name}
      column: date {field: sdt_gdn_ga_view.day_date}
      column: week {field: sdt_gdn_ga_view.day_week}
      column: month {field: sdt_gdn_ga_view.day_month}
      column: quarter {field: sdt_gdn_ga_view.day_quarter}
      column: total_impressions {field: sdt_gdn_ga_view.total_impressions}
      column: total_clicks {field: sdt_gdn_ga_view.total_clicks}
      column: total_views {field: sdt_gdn_ga_view.total_views}
      column: total_completes {field: sdt_gdn_ga_view.total_completes}
      column: total_cost {field: sdt_gdn_ga_view.total_cost}
      column: total_sessions {field: sdt_gdn_ga_view.total_sessions}
      column: total_session_duration {field: sdt_gdn_ga_view.total_session_duration}
      filters: {
        field: sdt_gdn_ga_view.sdt_campaign
        value: "Always On Content"
      }
      filters: {
        field: sdt_gdn_ga_view.day_date
        value: "2019/09/16 to 2020/03/17"
      }
    }
    datagroup_trigger: 24hour_cache
    distribution_style: all
  }
}
