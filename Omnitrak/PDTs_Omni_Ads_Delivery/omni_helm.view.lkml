view: omni_helm {
  derived_table: {
    explore_source: sdt_helm {
      column: ad_id {field: sdt_helm_ga_view.creative_id}
      column: ad_name {field: sdt_helm_ga_view.creative}
      column: date {field: sdt_helm_ga_view.date_date}
      column: campaign {field: sdt_helm_ga_view.sdt_campaign}
      column: placement {field: sdt_helm_ga_view.sdt_placement}
      column: publisher {field: sdt_helm_ga_view.publisher}
      column: region {field: sdt_helm_ga_view.sdt_region}
      column: creative_name {field: sdt_helm_ga_view.creative_name}
      column: total_impressions {field: sdt_helm_ga_view.total_impressions}
      column: total_clicks {field: sdt_helm_ga_view.total_clicks}
      column: total_views {field: sdt_helm_ga_view.total_video_starts}
      column: total_cost {field: sdt_helm_ga_view.total_cost}
      filters: {
        field: sdt_helm_ga_view.total_impressions
        value: ">0"
      }
      filters: {
        field: sdt_helm_ga_view.date_date
        value: "after 2020/07/01"
      }
      filters: {
        field: sdt_helm_ga_view.sdt_campaign
        value: "Always On Content,Spring Awareness"
      }
    }
    datagroup_trigger: sdt_omnitrak_datagroup
    distribution_style: all
  }
}
