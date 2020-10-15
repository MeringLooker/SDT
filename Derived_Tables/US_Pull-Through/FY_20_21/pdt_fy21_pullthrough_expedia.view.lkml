view: pdt_fy21_pullthrough_expedia {
    derived_table: {
      explore_source: sdt_dcm {
        column: publisher {field: sdt_dcm_ga_view.publisher}
        column: campaign {field: sdt_dcm_ga_view.sdt_campaign}
        column: market {field: sdt_dcm_ga_view.sdt_market}
        column: layer {field: sdt_dcm_ga_view.sdt_layer}
        column: region {field: sdt_dcm_ga_view.sdt_region}
        column: placement {field: sdt_dcm_ga_view.sdt_placement}
        column: creative_name {field: sdt_dcm_ga_view.creative_name}
        column: ad_size {field: sdt_dcm_ga_view.ad_size}
        column: date {field: sdt_dcm_ga_view.date_date}
        column: week {field: sdt_dcm_ga_view.date_week}
        column: month {field: sdt_dcm_ga_view.date_month}
        column: quarter {field: sdt_dcm_ga_view.date_quarter}
        column: total_impressions {field: sdt_dcm_ga_view.total_impressions}
        column: total_clicks {field: sdt_dcm_ga_view.total_clicks}
        column: total_cost {field: sdt_dcm_ga_view.total_cost}
        column: total_views {field: sdt_dcm_ga_view.total_views}
        column: total_completes {field: sdt_dcm_ga_view.total_completes}
        column: total_sessions {field: sdt_dcm_ga_view.total_sessions}
        column: total_session_duration {field: sdt_dcm_ga_view.total_session_duration}
        column: total_discover_sd {field: sdt_dcm_ga_view.total_discover_sd}
        column: total_plan_your_vacation {field: sdt_dcm_ga_view.total_plan_your_vacation}
        column: total_visitor_planning_guide {field: sdt_dcm_ga_view.total_visitor_planning_guide}
        column: total_staying_in_touch {field: sdt_dcm_ga_view.total_staying_in_touch}
        column: total_hotel_search {field: sdt_dcm_ga_view.total_hotel_search}
        column: total_purchases {field: sdt_dcm_ga_view.total_purchases}
        filters: {
          field: sdt_dcm_ga_view.campaign
          value: "SDT: FY21 Pull-Through - 005532_01"
        }
        filters: {
          field: sdt_dcm_ga_view.publisher
          value: "Expedia"
        }
        filters: {
          field: sdt_dcm_ga_view.date_date
          value: "2020/07/27 to 2021/01/04"
        }
      }
      datagroup_trigger: 24hour_cache
      distribution_style: all
    }
  }
