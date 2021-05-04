view: omni_dcm_springaware {
  derived_table: {
    explore_source: sdt_dcm {
      column: ad_id {field: sdt_dcm_ga_view.ad_id}
      column: ad_name {field: sdt_dcm_ga_view.ad}
      column: date {field: sdt_dcm_ga_view.date_date}
      column: campaign {field: sdt_dcm_ga_view.sdt_campaign}
      column: placement {field: sdt_dcm_ga_view.sdt_placement}
      column: publisher {field: sdt_dcm_ga_view.publisher}
      column: region {field: sdt_dcm_ga_view.sdt_region}
      column: creative_name {field: sdt_dcm_ga_view.creative_name}
      column: total_impressions {field: sdt_dcm_ga_view.total_impressions}
      column: total_clicks {field: sdt_dcm_ga_view.total_clicks}
      column: total_cost {field: sdt_dcm_ga_view.total_cost}
      column: total_views {field: sdt_dcm_ga_view.total_views}
      filters: {
        field: sdt_dcm_ga_view.campaign
        value: "SDT: FY21 Spring Awareness - 005867_01"
      }
      filters: {
        field: sdt_dcm_ga_view.publisher
        value: "Pandora,Trip Advisor,Travelzoo,See Source"
      }
      filters: {
        field: sdt_dcm_ga_view.sdt_placement
        value: "-Pandora Mobile Video Plus,-TripAdvisor Horizon High Impact Display (Variety Seeker)"
      }
      filters: {
        field: sdt_dcm_ga_view.date_date
        value: "2021/03/01 to 2021/07/01"
      }
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
