view: ndt_uk_digital_sem {
  derived_table: {
    explore_source: sdt_sem {
      column: publisher {field: sdt_sem_view.publisher}
      column: campaign {field: sdt_sem_view.sdt_campaign}
      column: market {field: sdt_sem_view.sdt_market}
      column: layer {field: sdt_sem_view.sdt_layer}
      column: placement {field: sdt_sem_view.sdt_placement}
      column: date {field: sdt_sem_view.day_date}
      column: week {field: sdt_sem_view.day_week}
      column: month {field: sdt_sem_view.day_month}
      column: total_impressions {field: sdt_sem_view.total_impressions}
      column: total_clicks {field: sdt_sem_view.total_clicks}
      column: total_views {field: sdt_sem_view.total_views}
      column: total_cost {field: sdt_sem_view.total_cost}
      column: total_sessions {field: sdt_sem_view.ga_sessions}
      column: total_session_duration {field: sdt_sem_view.ga_total_session_duration}
      filters: {
        field: sdt_sem_view.sdt_campaign
        value: "United Kingdom Digital"
      }
    }
    datagroup_trigger: sdt_uk_digital_datagroup
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