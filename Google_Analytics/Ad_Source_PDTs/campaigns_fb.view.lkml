view: campaigns_fb {
  derived_table: {
    explore_source: sdt_fb {
      column: campaign {field: sdt_fb_ga_view.sdt_campaign}
      column: publisher {field: sdt_fb_ga_view.publisher}
      column: ad_id {field: sdt_fb_ga_view.ad_id}
    }
    datagroup_trigger: sdt_ga_datagroup
    distribution_style: all
  }
}
