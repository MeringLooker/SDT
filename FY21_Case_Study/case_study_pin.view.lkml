view: case_study_pin {
  derived_table: {
    explore_source: sdt_pinterest {
      column: ad_id {field: sdt_pinterest_ga_view.promoted_pin_id}
      column: ad_name {field: sdt_pinterest_ga_view.promoted_pin_name}
      column: date {field: sdt_pinterest_ga_view.date_date}
      column: campaign {field: sdt_pinterest_ga_view.sdt_campaign}
      column: placement {field: sdt_pinterest_ga_view.sdt_placement}
      column: publisher {field: sdt_pinterest_ga_view.publisher}
      column: region {field: sdt_pinterest_ga_view.sdt_region}
      column: creative_name {field: sdt_pinterest_ga_view.creative_name}
      column: total_impressions { field: sdt_pinterest_ga_view.total_impressions }
      column: total_clicks {field: sdt_pinterest_ga_view.total_clicks}
      column: total_views {field: sdt_pinterest_ga_view.content_video_views}
      column: total_completes {field: sdt_pinterest_ga_view.total_views_at_100 }
      column: total_cost { field: sdt_pinterest_ga_view.total_spend }
      column: total_sessions { field: sdt_pinterest_ga_view.total_sessions }
      column: total_session_duration { field: sdt_pinterest_ga_view.total_session_duration }
      filters: {
        field: sdt_pinterest_ga_view.total_spend
        value: ">0"
      }
      filters: {
        field: sdt_pinterest_ga_view.date_date
        value: "2020/07/01 to 2021/01/01"
      }
      filters: {
        field: sdt_pinterest_ga_view.sdt_campaign
        value: "Fall Drive Market,US Pull-Through"
      }
    }
    datagroup_trigger: sdt_omnitrak_datagroup
    distribution_style: all
  }
}
