view: ndt_ta_us_lure {
  derived_table: {
    explore_source: sdt_fy20_ta_us_lure {
      column: sdt_layer {}
      column: sdt_placement {}
      column: sdt_pillar {}
      column: ad_size {}
      column: date {field: sdt_fy20_ta_us_lure.date_date}
      column: week {field: sdt_fy20_ta_us_lure.date_week}
      column: month {field: sdt_fy20_ta_us_lure.date_month}
      column: total_impressions {}
      column: total_clicks {}
      column: total_views {}
      column: total_completes {}
      column: total_cost {}
    }
    datagroup_trigger: sdt_ta_us_datagroup
    distribution_style: all
  }
  dimension: layer {
    type: string
  }

  dimension: placement {
    type: string
  }

  dimension: pillar {
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
