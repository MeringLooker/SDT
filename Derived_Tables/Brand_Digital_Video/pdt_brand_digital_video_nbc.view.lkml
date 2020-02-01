view: pdt_brand_digital_video_nbc {
  derived_table: {
    explore_source: sdt_dcm {
      column: publisher {field: sdt_dcm_view.publisher}
      column: campaign {field: sdt_dcm_view.sdt_campaign}
      column: market {field: sdt_dcm_view.sdt_market}
      column: region {field: sdt_dcm_view.sdt_region}
      column: audience {field: sdt_dcm_view.sdt_audience}
      column: creative_name {field: sdt_dcm_view.creative_name}
      column: date {field: sdt_dcm_view.date_date}
      column: week {field: sdt_dcm_view.date_week}
      column: month {field: sdt_dcm_view.date_month}
      column: quarter {field: sdt_dcm_view.date_quarter}
      column: total_impressions {field: sdt_fy20_digital_video_nbc.total_impressions}
      column: total_views {field: sdt_fy20_digital_video_nbc.total_video_views}
      column: total_completes {field: sdt_fy20_digital_video_nbc.total_video_completes}
      column: total_cost {field: sdt_fy20_digital_video_nbc.total_media_cost}

      filters: {
        field: sdt_dcm_view.sdt_campaign
        value: "Brand Digital Video"
      }
      filters: {
        field: sdt_dcm_view.publisher
        value: "NBC Sports"
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
