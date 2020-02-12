view: ndt_us_pullthrough_adara {
  derived_table: {
    explore_source: sdt_dcm {
      column: primary_key   {field: sdt_dcm_view.id}
      column: publisher {field: sdt_dcm_view.publisher}
      column: campaign {field: sdt_dcm_view.sdt_campaign}
      column: market {field: sdt_dcm_view.sdt_market}
      column: layer {field: sdt_dcm_view.sdt_layer}
      column: date {field: sdt_dcm_view.date_date}
      column: week {field: sdt_dcm_view.date_week}
      column: month {field: sdt_dcm_view.date_month}
      column: quarter {field: sdt_dcm_view.date_quarter}
      column: total_impressions {field: sdt_dcm_view.total_impressions}
      column: total_clicks {field: sdt_dcm_view.total_clicks}
      column: total_cost {field: sdt_dcm_view.total_media_cost}
      column: total_sessions {field: sdt_dcm_view.ga_sessions}
      column: total_session_duration {field: sdt_dcm_view.ga_total_session_duration}
      filters: {
        field: sdt_dcm_view.sdt_campaign
        value: "US Pull-Through"
      }
      filters: {
        field: sdt_dcm_view.publisher
        value: "Adara"
      }
    }
    datagroup_trigger: sdt_us_pullthrough_datagroup
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
