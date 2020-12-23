view: pdt_fy21_pullthrough_adara {
  derived_table: {
    explore_source: sdt_fy21_pt_adara {
      column: publisher {field: sdt_fy21_pt_adara.publisher}
      column: campaign {field: sdt_fy21_pt_adara.sdt_campaign}
      column: market {field: sdt_fy21_pt_adara.sdt_market}
      column: layer {field: sdt_fy21_pt_adara.sdt_layer}
      column: region {field: sdt_fy21_pt_adara.sdt_region}
      column: placement {field: sdt_fy21_pt_adara.sdt_placement}
      column: creative_name {field: sdt_fy21_pt_adara.creative_name}
      column: ad_size {field: sdt_fy21_pt_adara.ad_size}
      column: date {field: sdt_fy21_pt_adara.date_date}
      column: week {field: sdt_fy21_pt_adara.date_week}
      column: month {field: sdt_fy21_pt_adara.date_month}
      column: quarter {field: sdt_fy21_pt_adara.date_quarter}
      column: total_impressions {field: sdt_fy21_pt_adara.total_impressions}
      column: total_clicks {field: sdt_fy21_pt_adara.total_clicks}
      column: total_cost {field: sdt_fy21_pt_adara.total_media_cost}
      column: total_views {field: sdt_fy21_pt_adara.total_video_views}
      column: total_completes {field: sdt_fy21_pt_adara.total_video_completes}
      column: total_sessions {field: sdt_fy21_pt_adara.total_sessions}
      column: total_session_duration {field: sdt_fy21_pt_adara.total_session_duration}
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
