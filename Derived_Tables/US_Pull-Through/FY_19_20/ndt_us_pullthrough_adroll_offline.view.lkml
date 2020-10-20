view: ndt_us_pullthrough_adroll_offline {
  derived_table: {
    explore_source: sdt_fy20_us_pullthrough_adroll {
      column: publisher {field: sdt_fy20_us_pullthrough_adroll.publisher}
      column: campaign {field: sdt_fy20_us_pullthrough_adroll.sdt_campaign}
      column: market {field: sdt_fy20_us_pullthrough_adroll.sdt_market}
      column: layer {field: sdt_fy20_us_pullthrough_adroll.sdt_layer}
      column: placement {field: sdt_fy20_us_pullthrough_adroll.sdt_placement}
      column: ad_size {field: sdt_fy20_us_pullthrough_adroll.ad_size}
      column: date {field: sdt_fy20_us_pullthrough_adroll.day_date}
      column: week {field: sdt_fy20_us_pullthrough_adroll.day_week}
      column: month {field: sdt_fy20_us_pullthrough_adroll.day_month}
      column: quarter {field: sdt_fy20_us_pullthrough_adroll.day_quarter}
      column: total_impressions {field: sdt_fy20_us_pullthrough_adroll.total_impressions}
      column: total_clicks {field: sdt_fy20_us_pullthrough_adroll.total_clicks}
      column: total_cost {field: sdt_fy20_us_pullthrough_adroll.total_cost}
      column: total_sessions {field: sdt_fy20_us_pullthrough_adroll.ga_sessions}
      column: total_session_duration {field: sdt_fy20_us_pullthrough_adroll.ga_total_session_duration}
      filters: {
        field: sdt_fy20_us_pullthrough_adroll.day_date
        value: "2019/09/16 to 2020/03/14"
      }
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
