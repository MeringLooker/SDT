view: pdt_brand_digital_video_fb {
  derived_table: {
    explore_source: sdt_fb {
      column: publisher {field: sdt_fb_view.publisher}
      column: campaign {field: sdt_fb_view.sdt_campaign}
      column: market {field: sdt_fb_view.sdt_market}
      column: region {field: sdt_fb_view.sdt_region}
      column: audience {field: sdt_fb_view.sdt_audience}
      column: creative_name {field: sdt_fb_view.creative_name}
      column: date {field: sdt_fb_view.date_start_date}
      column: week {field: sdt_fb_view.date_start_week}
      column: month {field: sdt_fb_view.date_start_month}
      column: quarter {field: sdt_fb_view.date_start_quarter}
      column: total_impressions {field: sdt_fb_view.total_impressions}
      column: total_views {field: sdt_fb_view.total_thruplays}
      column: total_completes {field: sdt_fb_view.video_completes}
      column: total_cost {field: sdt_fb_view.total_spend}
      filters: {
        field: sdt_fb_view.sdt_campaign
        value: "Brand Digital Video"
      }
    }
    datagroup_trigger: sdt_brand_digital_video_datagroup
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

  dimension: audience {
    type: string
  }

  dimension: creative_name {
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
}