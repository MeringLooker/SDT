view: ndt_premium_display_socialamp {
  derived_table: {
    explore_source: sdt_fy20_premium_digital_socialamp {
      column: publisher {field: sdt_fy20_premium_digital_socialamp.publisher}
      column: campaign {field: sdt_fy20_premium_digital_socialamp.sdt_campaign}
      column: placement {field: sdt_fy20_premium_digital_socialamp.sdt_placement}
      column: ad_size {field: sdt_fy20_premium_digital_socialamp.adsize}
      column: date {field: sdt_fy20_premium_digital_socialamp.date_date}
      column: week {field: sdt_fy20_premium_digital_socialamp.date_week}
      column: month {field: sdt_fy20_premium_digital_socialamp.date_month}
      column: total_impressions {field: sdt_fy20_premium_digital_socialamp.total_impressions}
      column: total_viewable_impressions {field: sdt_fy20_premium_digital_socialamp.total_viewable_impressions}
      column: total_measureable_impressions {field: sdt_fy20_premium_digital_socialamp.total_measureable_impressions}
      column: total_clicks {field: sdt_fy20_premium_digital_socialamp.total_clicks}
      column: total_cost {field: sdt_fy20_premium_digital_socialamp.total_cost}
      column: total_sessions {field: sdt_fy20_premium_digital_socialamp.total_sessions}
      column: total_session_duration {field: sdt_fy20_premium_digital_socialamp.total_session_duration}
    }
    datagroup_trigger: sdt_premium_digital_datagroup
    distribution_style: all
  }

  dimension: publisher {
    type: string
  }

  dimension: campaign {
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
