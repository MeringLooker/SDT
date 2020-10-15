view: pdt_brand_digital_video_yt {
  derived_table: {
    explore_source: sdt_yt {
      column: publisher {field: sdt_yt_ga_view.publisher}
      column: campaign {field: sdt_yt_ga_view.sdt_campaign}
      column: market {field: sdt_yt_ga_view.sdt_market}
      column: region {field: sdt_yt_ga_view.sdt_region}
      column: audience {field: sdt_yt_ga_view.sdt_audience}
      column: creative_name {field: sdt_yt_ga_view.creative_name}
      column: date {field: sdt_yt_ga_view.day_date}
      column: week {field: sdt_yt_ga_view.day_week}
      column: month {field: sdt_yt_ga_view.day_month}
      column: quarter {field: sdt_yt_ga_view.day_quarter}
      column: total_impressions {field: sdt_yt_ga_view.total_impressions}
      column: total_clicks {field: sdt_yt_ga_view.total_clicks}
      column: total_views {field: sdt_yt_ga_view.total_views}
      column: total_completes {field: sdt_yt_ga_view.total_video_completes}
      column: total_cost {field: sdt_yt_ga_view.total_cost}
      filters: {
        field: sdt_yt_ga_view.sdt_campaign
        value: "Brand Digital Video"
      }
      filters: {
        field: sdt_yt_ga_view.day_date
        value: "2019/08/25 to 2020/03/17"
      }
    }
    datagroup_trigger: 24hour_cache
    distribution_style: all
  }
}
