view: pdt_us_sem {
  derived_table: {
    explore_source: sdt_sem {
      column: publisher {field: sdt_sem_ga_view.publisher}
      column: campaign {field: sdt_sem_ga_view.sdt_campaign}
      column: market {field: sdt_sem_ga_view.sdt_market}
      column: phase {field: sdt_sem_ga_view.sdt_layer}
      column: aw_campaign {field: sdt_sem_ga_view.campaign}
      column: aw_adgroup {field: sdt_sem_ga_view.ad_group}
      column: date {field: sdt_sem_ga_view.day_date}
      column: week {field: sdt_sem_ga_view.day_week}
      column: month {field: sdt_sem_ga_view.day_month}
      column: quarter {field: sdt_sem_ga_view.day_quarter}
      column: total_impressions {field: sdt_sem_ga_view.total_impressions}
      column: total_clicks {field: sdt_sem_ga_view.total_clicks}
      column: total_conversions {field: sdt_sem_ga_view.total_conversions}
      column: total_views {field: sdt_sem_ga_view.total_views}
      column: total_completes {field: sdt_sem_ga_view.total_completes}
      column: total_cost {field: sdt_sem_ga_view.total_cost}
      column: total_sessions {field: sdt_sem_ga_view.total_sessions}
      column: total_session_duration {field: sdt_sem_ga_view.total_session_duration}
      filters: {
        field: sdt_sem_ga_view.sdt_campaign
        value: "United States SEM"
      }
      filters: {
        field: sdt_sem_ga_view.total_impressions
        value: ">0"
      }
    }
    datagroup_trigger: sdt_us_sem_datagroup
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