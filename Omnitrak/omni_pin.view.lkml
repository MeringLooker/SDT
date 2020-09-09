view: omni_pin {
  derived_table: {
    explore_source: sdt_pinterest {
      column: ad_id {field: sdt_pinterest_ga_view.promoted_pin_id}
      column: ad_name {field: sdt_pinterest_ga_view.promoted_pin_name}
      column: date {field: sdt_pinterest_ga_view.date_date}
      column: campaign {field: sdt_pinterest_ga_view.sdt_campaign}
      column: publisher {field: sdt_pinterest_ga_view.publisher}
      column: region {field: sdt_pinterest_ga_view.sdt_region}
      column: creative_name {field: sdt_pinterest_ga_view.creative_name}
      column: total_impressions { field: sdt_pinterest_ga_view.total_impressions }
      column: total_cost { field: sdt_pinterest_ga_view.total_spend }
    }
    datagroup_trigger: sdt_omnitrak_datagroup
    distribution_style: all
  }
}
