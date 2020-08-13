view: pdt_fy21_drivemarket_hulu {
  derived_table: {
    explore_source: sdt_dcm {
      column: publisher {field: sdt_dcm_ga_view.publisher}
      column: campaign {field: sdt_dcm_ga_view.sdt_campaign}
      column: market {field: sdt_dcm_ga_view.sdt_market}
      column: layer {field: sdt_dcm_ga_view.sdt_layer}
      column: region {field: sdt_dcm_ga_view.sdt_region}
      column: placement {field: sdt_dcm_ga_view.sdt_placement}
      column: creative_name {field: sdt_dcm_ga_view.creative_name}
      column: date {field: sdt_dcm_ga_view.date_date}
      column: week {field: sdt_dcm_ga_view.date_week}
      column: month {field: sdt_dcm_ga_view.date_month}
      column: total_impressions {field: sdt_fy21_drivemkt_dcm_view.total_impressions}
      column: total_clicks {field: sdt_fy21_drivemkt_dcm_view.total_clicks}
      column: total_cost {field: sdt_fy21_drivemkt_dcm_view.total_media_cost}
      column: total_views {field: sdt_fy21_drivemkt_dcm_view.total_video_views}
      column: total_completes {field: sdt_fy21_drivemkt_dcm_view.total_video_completes}
      column: total_sessions {field: sdt_dcm_ga_view.total_sessions}
      column: total_session_duration {field: sdt_dcm_ga_view.total_session_duration}
      filters: {
        field: sdt_dcm_ga_view.campaign
        value: "SDT: FY21 Drive Market Recovery"
      }
      filters: {
        field: sdt_dcm_ga_view.publisher
        value: "Hulu"
      }
    }
    datagroup_trigger: sdt_falldrivemarket_datagroup
    distribution_style: all
  }

  dimension: publisher {
    type: string
  }

  dimension: campaign {
    type: string
  }

  dimension: market {
    type: string
  }

  dimension: layer {
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

  dimension: quarter {
    type: date
  }

  dimension: total_impressions {
    type: number
  }

  dimension: total_clicks {
    type: number
  }

  dimension: total_cost {
    type: number
    value_format_name: usd
  }

  dimension: total_sessions {
    type: number
  }

  dimension: total_session_duration {
    type: number
  }
}
