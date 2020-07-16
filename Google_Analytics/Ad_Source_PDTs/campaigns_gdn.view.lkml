view: campaigns_gdn {
  derived_table: {
    explore_source: sdt_gdn {
      column: campaign {field: sdt_gdn_ga_view.sdt_campaign}
      column: ad_id {field: sdt_gdn_ga_view.ad_group_id_string}
    }
    datagroup_trigger: sdt_ga_datagroup
    distribution_style: all
  }
}
