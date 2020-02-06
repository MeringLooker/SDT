view: ndt_us_pullthrough_adroll_offline {
  derived_table: {
    explore_source: sdt_fy20_us_pullthrough_adroll {
      column: publisher {field: sdt_fy20_us_pullthrough_adroll.publisher}
      column: campaign {field: sdt_fy20_us_pullthrough_adroll.sdt_campaign}
      column: market {field: sdt_fy20_us_pullthrough_adroll.sdt_market}
      column: layer {field: sdt_fy20_us_pullthrough_adroll.sdt_layer}
      column: date {field: sdt_fy20_us_pullthrough_adroll.day_date}
      column: week {field: sdt_fy20_us_pullthrough_adroll.day_week}
      column: month {field: sdt_fy20_us_pullthrough_adroll.day_month}
      column: quarter {field: sdt_fy20_us_pullthrough_adroll.day_quarter}
      column: total_impressions {field: sdt_fy20_us_pullthrough_adroll.total_impressions}
      column: total_clicks {field: sdt_fy20_us_pullthrough_adroll.total_clicks}
      column: total_cost {field: sdt_fy20_us_pullthrough_adroll.total_cost}
      column: total_sessions {field: sdt_fy20_us_pullthrough_adroll.ga_sessions}
      column: total_session_duration {field: sdt_fy20_us_pullthrough_adroll.ga_total_session_duration}
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
