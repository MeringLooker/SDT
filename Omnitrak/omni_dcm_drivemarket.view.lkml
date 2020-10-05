view: omni_dcm_drivemarket {
  derived_table: {
    explore_source: sdt_dcm {
      column: ad_id {field: sdt_dcm_ga_view.ad_id}
      column: ad_name {field: sdt_dcm_ga_view.ad}
      column: date {field: sdt_dcm_ga_view.date_date}
      column: campaign {field: sdt_dcm_ga_view.sdt_campaign}
      column: publisher {field: sdt_dcm_ga_view.publisher}
      column: region {field: sdt_dcm_ga_view.sdt_region}
      column: creative_name {field: sdt_dcm_ga_view.creative_name}
      column: total_impressions {field: sdt_dcm_ga_view.total_impressions}
      column: total_clicks {field: sdt_dcm_ga_view.total_clicks}
      column: total_cost {field: sdt_dcm_ga_view.total_cost}
      column: total_views {field: sdt_dcm_ga_view.total_views}
      filters: {
        field: sdt_dcm_ga_view.total_impressions
        value: ">0"
      }
      filters: {
        field: sdt_dcm_ga_view.campaign
        value: "SDT: FY21 Drive Market Recovery"
      }
      filters: {
        field: sdt_dcm_ga_view.publisher
        value: "Meredith,Condé Nast"
      }
      filters: {
        field: sdt_dcm_ga_view.ad
        value: "-%Default Web Ad%"
      }
    }
    datagroup_trigger: sdt_omnitrak_datagroup
    distribution_style: all
  }
}
