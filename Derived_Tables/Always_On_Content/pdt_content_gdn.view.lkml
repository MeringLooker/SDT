view: pdt_content_gdn {
  derived_table: {
    explore_source: sdt_gdn {
      column: publisher {field: sdt_gdn_view.publisher}
      column: campaign {field: sdt_gdn_view.sdt_campaign}
      column: market {field: sdt_gdn_view.sdt_market}
      column: region {field: sdt_gdn_view.sdt_region}
      column: layer {field: sdt_gdn_view.sdt_layer}
      column: date {field: sdt_gdn_view.day_date}
      column: week {field: sdt_gdn_view.day_week}
      column: month {field: sdt_gdn_view.day_month}
      column: quarter {field: sdt_gdn_view.day_quarter}
      column: total_impressions {field: sdt_gdn_view.total_impressions}
      column: total_clicks {field: sdt_gdn_view.total_clicks}
      column: total_views {field: sdt_gdn_view.total_views}
      column: total_completes {field: sdt_gdn_view.total_completes}
      column: total_cost {field: sdt_gdn_view.total_cost}
      column: total_sessions {field: sdt_gdn_view.ga_sessions}
      column: total_session_duration {field: sdt_gdn_view.ga_total_session_duration}
      filters: {
        field: sdt_gdn_view.sdt_campaign
        value: "Always On Content"
      }
    }
    datagroup_trigger: sdt_content_datagroup
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

  dimension: region {
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

  dimension: total_sessions {
    type: number
  }

  dimension: total_session_duration {
    type: number
  }

  measure: count {
    type: count
  }
}