view: ndt_ta_can_audext_video {
  derived_table: {
    explore_source: sdt_dcm {
      column: layer {field: sdt_dcm_view.sdt_layer}
      column: placement {field: sdt_dcm_view.sdt_placement}
      column: pillar {field: sdt_dcm_view.sdt_pillar}
      column: ad_size {field: sdt_dcm_view.ad_size}
      column: date {field: sdt_dcm_view.date_date}
      column: week {field: sdt_dcm_view.date_week}
      column: month {field: sdt_dcm_view.date_month}
      column: total_impressions {field: sdt_fy20_ta_can_audext_video.total_impressions}
      column: total_clicks {field: sdt_fy20_ta_can_audext_video.total_clicks}
      column: total_views {field: sdt_fy20_ta_can_audext_video.total_views}
      column: total_completes {field: sdt_fy20_ta_can_audext_video.total_completes}
      column: total_cost {field: sdt_fy20_ta_can_audext_video.total_cost}
      filters: {
        field: sdt_dcm_view.sdt_campaign
        value: "CAN TripAdvisor Program"
      }
    }
    datagroup_trigger: sdt_ta_can_datagroup
    distribution_style: all
  }

  dimension: layer {
    type: string
  }

  dimension: placement {
    type: string
  }

  dimension: date {
    type: date
  }

  dimension: week {
    type: date
  }

  dimension: month {
    type: date
  }

  dimension: total_impressions {
    type: number
  }

  dimension: total_clicks {
    type: number
  }

  dimension: total_views {
    type: number
  }

  dimension: total_completes {
    type: number
  }

  dimension: total_cost {
    type: number
    value_format_name: usd
  }

  measure: count {
    type: count
  }

}
