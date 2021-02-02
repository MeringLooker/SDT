view: case_study_gdn {
  derived_table: {
    explore_source: sdt_gdn {
      column: ad_id {field: sdt_gdn_ga_view.ad_group_id}
      column: ad_name {field: sdt_gdn_ga_view.ad_group}
      column: date {field: sdt_gdn_ga_view.day_date}
      column: campaign {field: sdt_gdn_ga_view.sdt_campaign}
      column: placement {field: sdt_gdn_ga_view.sdt_placement}
      column: publisher {field: sdt_gdn_ga_view.publisher}
      column: region {field: sdt_gdn_ga_view.sdt_region}
      column: creative_name {field: sdt_gdn_ga_view.creative_name}
      column: total_impressions {field: sdt_gdn_ga_view.total_impressions}
      column: total_clicks {field: sdt_gdn_ga_view.total_clicks}
      column: total_cost {field: sdt_gdn_ga_view.total_cost}
      column: total_views {field: sdt_gdn_ga_view.total_views}
      column: total_completes {field: sdt_gdn_ga_view.total_completes}
      column: total_sessions {field: sdt_gdn_ga_view.total_sessions}
      column: total_session_duration {field: sdt_gdn_ga_view.total_session_duration}
      filters: {
        field: sdt_gdn_ga_view.total_impressions
        value: ">0"
      }
      filters: {
        field: sdt_gdn_ga_view.day_date
        value: "2020/07/01 to 2021/01/01"
      }
      filters: {
        field: sdt_gdn_ga_view.sdt_campaign
        value: "Fall Drive Market,US Pull-Through,Locals Recovery"
      }
    }
    datagroup_trigger: sdt_omnitrak_datagroup
    distribution_style: all
  }
}
