view: pdt_fy21_spring_awareness_fb {
  derived_table: {
    explore_source: sdt_fb {
      column: publisher {field: sdt_fb_ga_view.publisher}
      column: campaign {field: sdt_fb_ga_view.sdt_campaign}
      column: market {field: sdt_fb_ga_view.sdt_market}
      column: region {field: sdt_fb_ga_view.sdt_region}
      column: placement {field: sdt_fb_ga_view.sdt_placement}
      column: creative_name {field: sdt_fb_ga_view.creative_name}
      column: ad_size {field: sdt_fb_ga_view.ad_size}
      column: date {field: sdt_fb_ga_view.date_start_date}
      column: total_impressions {field: sdt_fb_ga_view.total_impressions}
      column: total_clicks {field: sdt_fb_ga_view.total_clicks}
      column: total_cost {field: sdt_fb_ga_view.total_spend}
      column: total_views {field: sdt_fb_ga_view.total_thruplays}
      column: total_completes {field: sdt_fb_ga_view.total_video_completes}
      column: total_sessions {field: sdt_fb_ga_view.total_sessions}
      column: total_session_duration {field: sdt_fb_ga_view.total_session_duration}
      filters: {
        field: sdt_fb_ga_view.campaign_name
        value: "%FY21^_SDT^_SpringAwareness%"
      }
      filters: {
        field: sdt_fb_ga_view.date_start_date
        value: "2021/03/01 to 2021/07/01"
      }
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
