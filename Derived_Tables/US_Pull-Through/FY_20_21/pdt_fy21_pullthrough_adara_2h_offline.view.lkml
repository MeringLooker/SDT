view: pdt_fy21_pullthrough_adara_2h_offline {
  derived_table: {
    explore_source: sdt_fy21_pt_2h_adara_offline {
      column: publisher {field: sdt_fy21_pt_2h_adara_offline.publisher}
      column: campaign {field: sdt_fy21_pt_2h_adara_offline.sdt_campaign}
      column: market {field: sdt_fy21_pt_2h_adara_offline.sdt_market}
      column: layer {field: sdt_fy21_pt_2h_adara_offline.sdt_layer}
      column: region {field: sdt_fy21_pt_2h_adara_offline.region}
      column: placement {field: sdt_fy21_pt_2h_adara_offline.placement_name}
      column: creative_name {field: sdt_fy21_pt_2h_adara_offline.creative_name}
      column: ad_size {field: sdt_fy21_pt_2h_adara_offline.ad_size}
      column: date {field: sdt_fy21_pt_2h_adara_offline.date_date}
      column: week {field: sdt_fy21_pt_2h_adara_offline.date_week}
      column: month {field: sdt_fy21_pt_2h_adara_offline.date_month}
      column: quarter {field: sdt_fy21_pt_2h_adara_offline.date_quarter}
      column: total_impressions {field: sdt_fy21_pt_2h_adara_offline.total_impressions}
      column: total_clicks {field: sdt_fy21_pt_2h_adara_offline.total_clicks}
      column: total_cost {field: sdt_fy21_pt_2h_adara_offline.total_cost}
      column: total_views {field: sdt_fy21_pt_2h_adara_offline.total_views}
      column: total_completes {field: sdt_fy21_pt_2h_adara_offline.total_completes}
      column: total_sessions {field: sdt_fy21_pt_2h_adara_offline.total_sessions}
      column: total_session_duration {field: sdt_fy21_pt_2h_adara_offline.total_session_duration}
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
