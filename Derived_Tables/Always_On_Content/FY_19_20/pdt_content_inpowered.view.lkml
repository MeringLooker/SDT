view: pdt_content_inpowered {
  derived_table: {
    explore_source: sdt_dcm {
      column: publisher {field: sdt_dcm_ga_view.publisher}
      column: campaign {field: sdt_dcm_ga_view.sdt_campaign}
      column: market {field: sdt_dcm_ga_view.sdt_market}
      column: region {field: sdt_dcm_ga_view.sdt_region}
      column: layer {field: sdt_dcm_ga_view.sdt_layer}
      column: placement {field: sdt_dcm_ga_view.sdt_placement}
      column: pillar {field: sdt_dcm_ga_view.sdt_pillar}
      column: creative_name {field: sdt_dcm_ga_view.creative_name}
      column: date {field: sdt_dcm_ga_view.date_date}
      column: week {field: sdt_dcm_ga_view.date_week}
      column: month {field: sdt_dcm_ga_view.date_month}
      column: quarter {field: sdt_dcm_ga_view.date_quarter}
      column: total_impressions {field: sdt_fy20_content_inpowered.total_impressions}
      column: total_clicks {field: sdt_fy20_content_inpowered.total_clicks}
      column: total_views {field: sdt_fy20_content_inpowered.total_video_views}
      column: total_completes {field: sdt_fy20_content_inpowered.total_video_completes}
      column: total_cost {field: sdt_fy20_content_inpowered.total_cost}
      column: total_sessions {field: sdt_dcm_ga_view.total_sessions}
      column: total_session_duration {field: sdt_dcm_ga_view.total_session_duration}
      filters: {
        field: sdt_dcm_ga_view.sdt_campaign
        value: "Always On Content"
      }
      filters: {
        field: sdt_dcm_ga_view.publisher
        value: "inPowered"
      }
      filters: {
        field: sdt_dcm_ga_view.date_date
        value: "2019/09/16 to 2020/03/17"
      }
    }
    datagroup_trigger: sdt_default_datagroup
    distribution_style: all
  }
}
