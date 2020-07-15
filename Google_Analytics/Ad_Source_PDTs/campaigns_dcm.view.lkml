view: campaigns_dcm {
  derived_table: {
    explore_source: sdt_dcm {
      column: campaign {field: sdt_dcm_ga_view.sdt_campaign}
      column: ad_id {field: sdt_dcm_ga_view.dcm_id}
    }
    datagroup_trigger: sdt_ga_datagroup
    distribution_style: all
  }
}
