view: omni_gdn {
  derived_table: {
    explore_source: sdt_gdn {
      column: ad_id {field: sdt_gdn_ga_view.ad_group_id}
      column: ad_name {field: sdt_gdn_ga_view.ad_group}
      column: date {field: sdt_gdn_ga_view.day_date}
      column: campaign {field: sdt_gdn_ga_view.sdt_campaign}
      column: publisher {field: sdt_gdn_ga_view.publisher}
      column: region {field: sdt_gdn_ga_view.sdt_region}
      column: creative_name {field: sdt_gdn_ga_view.creative_name}
      column: total_impressions {field: sdt_gdn_ga_view.total_impressions}
      column: total_cost {field: sdt_gdn_ga_view.total_cost}
    }
    datagroup_trigger: sdt_omnitrak_datagroup
    distribution_style: all
  }
}
