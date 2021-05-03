view: omni_fb {
  derived_table: {
    explore_source: sdt_fb {
      column: ad_id {field: sdt_fb_ga_view.ad_id}
      column: ad_name {field: sdt_fb_ga_view.ad_name}
      column: date {field: sdt_fb_ga_view.date_start_date}
      column: campaign {field: sdt_fb_ga_view.sdt_campaign}
      column: placement {field: sdt_fb_ga_view.sdt_placement}
      column: publisher {field: sdt_fb_ga_view.publisher}
      column: region {field: sdt_fb_ga_view.sdt_region}
      column: creative_name {field: sdt_fb_ga_view.creative_name}
      column: total_impressions {field: sdt_fb_ga_view.total_impressions}
      column: total_clicks {field: sdt_fb_ga_view.total_clicks}
      column: total_views {field: sdt_fb_ga_view.total_thruplays}
      column: total_cost {field: sdt_fb_ga_view.total_spend}
      filters: {
        field: sdt_fb_ga_view.total_impressions
        value: ">0"
      }
      filters: {
        field: sdt_fb_ga_view.date_start_date
        value: "after 2020/07/01"
      }
      filters: {
        field: sdt_fb_ga_view.sdt_campaign
        value: "Always On Content,Fall Drive Market,US Pull-Through,Spring Awareness"
      }
    }
    datagroup_trigger: sdt_omnitrak_datagroup
    distribution_style: all
  }
}
