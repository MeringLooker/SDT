view: pdt_fy21_drivemarket_ta {
  derived_table: {
    explore_source: sdt_dcm {
      column: publisher {field: sdt_dcm_ga_view.publisher}
      column: campaign {field: sdt_dcm_ga_view.sdt_campaign}
      column: market {field: sdt_dcm_ga_view.sdt_market}
      column: layer {field: sdt_dcm_ga_view.sdt_layer}
      column: region {field: sdt_dcm_ga_view.sdt_region}
      column: placement {field: sdt_dcm_ga_view.sdt_placement}
      column: creative_name {field: sdt_dcm_ga_view.creative_name}
      column: date {field: sdt_dcm_ga_view.date_date}
      column: week {field: sdt_dcm_ga_view.date_week}
      column: month {field: sdt_dcm_ga_view.date_month}
      column: total_impressions {field: sdt_dcm_ga_view.total_impressions}
      column: total_clicks {field: sdt_dcm_ga_view.total_clicks}
      column: total_cost {field: sdt_dcm_ga_view.total_cost}
      column: total_views {field: sdt_dcm_ga_view.total_views}
      column: total_completes {field: sdt_dcm_ga_view.total_completes}
      column: total_sessions {field: sdt_dcm_ga_view.total_sessions}
      column: total_session_duration {field: sdt_dcm_ga_view.total_session_duration}
      filters: {
        field: sdt_dcm_ga_view.campaign
        value: "SDT: FY21 Drive Market Recovery"
      }
      filters: {
        field: sdt_dcm_ga_view.publisher
        value: "Trip Advisor"
      }
      filters: {
        field: sdt_dcm_ga_view.ad
        value: "-(not set),-%Default Web Ad%"
      }
      filters: {
        field: sdt_dcm_ga_view.date_date
        value: "2020/07/27 to 2020/12/04"
      }
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
