view: campaigns_pin {
  derived_table: {
    explore_source: sdt_pinterest {
      column: campaign {field: sdt_pinterest_ga_view.sdt_campaign}
      column: publisher {field: sdt_pinterest_ga_view.publisher}
      column: ad_id {field: sdt_pinterest_ga_view.promoted_pin_id}
    }
    datagroup_trigger: sdt_ga_datagroup
    distribution_style: all
  }
}
