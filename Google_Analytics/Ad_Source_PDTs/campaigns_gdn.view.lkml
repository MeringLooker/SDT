view: campaigns_gdn {
  derived_table: {
    explore_source: sdt_gdn {
      column: campaign {field: sdt_gdn_ga_view.sdt_campaign}
      column: publisher {field: sdt_gdn_ga_view.publisher}
      column: ad_id {field: sdt_gdn_ga_view.ad_group_id}
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
