view: campaigns_yt {
  derived_table: {
    explore_source: sdt_yt {
      column: campaign {field: sdt_yt_ga_view.sdt_campaign}
      column: publisher {field: sdt_yt_ga_view.publisher}
      column: ad_id {field: sdt_yt_ga_view.ad_group_id}
    }
    datagroup_trigger: sdt_ga_datagroup
    distribution_style: all
  }
}
