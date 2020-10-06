view: ndt_ta_can_homepage_hero {
  derived_table: {
    explore_source: sdt_dcm {
      column: layer {field: sdt_dcm_ga_view.sdt_layer}
      column: placement {field: sdt_dcm_ga_view.sdt_placement}
      column: pillar {field: sdt_dcm_ga_view.sdt_pillar}
      column: ad_size {field: sdt_dcm_ga_view.ad_size}
      column: date {field: sdt_dcm_ga_view.date_date}
      column: week {field: sdt_dcm_ga_view.date_week}
      column: month {field: sdt_dcm_ga_view.date_month}
      column: total_impressions {field: sdt_fy20_ta_can_homepage_hero.total_impressions}
      column: total_clicks {field: sdt_fy20_ta_can_homepage_hero.total_clicks}
      column: total_views {field: sdt_fy20_ta_can_homepage_hero.total_views}
      column: total_completes {field: sdt_fy20_ta_can_homepage_hero.total_completes}
      column: total_cost {field: sdt_fy20_ta_can_homepage_hero.total_cost}
      filters: {
        field: sdt_dcm_ga_view.sdt_campaign
        value: "CAN TripAdvisor Program"
      }
      filters: {
        field: sdt_dcm_ga_view.date_date
        value: "2019/11/01 to 2020/02/01"
      }
    }
    datagroup_trigger: sdt_ta_can_datagroup
    distribution_style: all
  }
}
