view: pdt_content_pinterest {
  derived_table: {
    explore_source: sdt_pinterest_ads {
      column: publisher { field: sdt_pinterest.publisher }
      column: campaign { field: sdt_pinterest.sdt_campaign }
      column: market { field: sdt_pinterest.sdt_market }
      column: region { field: sdt_pinterest.sdt_region }
      column: layer { field: sdt_pinterest.sdt_layer }
      column: date { field: sdt_pinterest.date_date }
      column: week { field: sdt_pinterest.date_week }
      column: month { field: sdt_pinterest.date_month }
      column: quarter { field: sdt_pinterest.date_quarter }
      column: total_impressions { field: sdt_pinterest.total_impressions }
      column: total_clicks { field: sdt_pinterest.total_clicks }
      column: total_views { field: sdt_pinterest.total_video_views }
      column: total_completes { field: sdt_pinterest.total_views_at_100 }
      column: total_spend { field: sdt_pinterest.total_spend }
      column: total_sessions { field: sdt_pinterest.ga_sessions }
      column: total_session_duration { field: sdt_pinterest.ga_total_session_duration }
      filters: {
        field: sdt_pinterest.sdt_campaign
        value: "Always On Content"
      }
    }
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
