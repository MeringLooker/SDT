view: pdt_fy21_pullthrough_expedia_pub {
  derived_table: {
    explore_source: sdt_fy21_pullthrough_expedia {
      column: publisher {field: sdt_fy21_pullthrough_expedia.publisher}
      column: campaign {field: sdt_fy21_pullthrough_expedia.sdt_campaign}
      column: market {field: sdt_fy21_pullthrough_expedia.sdt_market}
      column: layer {field: sdt_fy21_pullthrough_expedia.sdt_layer}
      column: region {field: sdt_fy21_pullthrough_expedia.sdt_region}
      column: placement {field: sdt_fy21_pullthrough_expedia.mering_placement}
      column: creative_name {field: sdt_fy21_pullthrough_expedia.mering_creative}
      column: ad_size {field: sdt_fy21_pullthrough_expedia.ad_size}
      column: date {field: sdt_fy21_pullthrough_expedia.date_date}
      column: week {field: sdt_fy21_pullthrough_expedia.date_week}
      column: month {field: sdt_fy21_pullthrough_expedia.date_month}
      column: quarter {field: sdt_fy21_pullthrough_expedia.date_quarter}
      column: total_impressions {field: sdt_fy21_pullthrough_expedia.total_impressions}
      column: total_clicks {field: sdt_fy21_pullthrough_expedia.total_clicks}
      column: total_cost {field: sdt_fy21_pullthrough_expedia.total_cost}
      column: total_views {field: sdt_fy21_pullthrough_expedia.total_views}
      column: total_completes {field: sdt_fy21_pullthrough_expedia.total_completes}
      column: total_sessions {field: sdt_fy21_pullthrough_expedia.total_sessions}
      column: total_session_duration {field: sdt_fy21_pullthrough_expedia.total_session_duration}
      filters: {
        field: sdt_fy21_pullthrough_expedia.date_date
        value: "2020/07/27 to 2021/07/01"
      }
      filters: {
        field: sdt_fy21_pullthrough_expedia.line_item_id
        value: "-5600652424,-5600893370,-5600893379,-5600893331,-5600892707,-5600652436,-5600893361,-5599355661,-5599355682,-5600891747"
      }
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
