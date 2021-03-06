view: ndt_ta_us_audext_social {
  derived_table: {
    explore_source: sdt_fy20_ta_us_audext_social {
      column: sdt_layer {}
      column: sdt_placement {}
      column: sdt_pillar {}
      column: ad_size {}
      column: date {field: sdt_fy20_ta_us_audext_social.date_date}
      column: week {field: sdt_fy20_ta_us_audext_social.date_week}
      column: month {field: sdt_fy20_ta_us_audext_social.date_month}
      column: total_impressions {}
      column: total_clicks {}
      column: total_views {}
      column: total_completes {}
      column: total_cost {}
      filters: {
        field: sdt_fy20_ta_us_audext_social.date_date
        value: "2019/09/23 to 2020/04/01"
      }
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
