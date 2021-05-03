include: "/Google_Analytics/*.view"
include: "/TrueView/*.view"
include: "/Facebook/*.view"
include: "/DCM/*.view"
include: "/AdWords/*.view"
include: "/Pinterest/*.view"
include: "/Helm/*.view"
include: "/Omnitrak/*.view"


datagroup: sdt_omnitrak_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: sdt_omnitrak {
  hidden:  yes
  view_name: sdt_omnitrak_ads
  label: "Omnitrak Research"
  view_label: "Ads Delivery"
  group_label: "San Diego Tourism"

  # join: sdt_omnitrak_program {
  #   view_label: "Program Ratings"
  #   sql_on:  ${sdt_omnitrak_program.omnitrak_program_key} = ${sdt_omnitrak_ads.omnitrak_program_key};;
  #   relationship: one_to_many
  #   type: inner
  # }

  # join: sdt_omnitrak_creative {
  #   view_label: "Creative Ratings"
  #   sql_on:  ${sdt_omnitrak_creative.omnitrak_creative_key} = ${sdt_omnitrak_ads.omnitrak_creative_key};;
  #   relationship: one_to_many
  #   type: inner
  # }

}

# explore: sdt_omnitrak_ratings {
#   hidden:  yes
#   view_name: sdt_omnitrak
#   label: "Omnitrak Ratings"
#   view_label: "Ratings"
#   group_label: "San Diego Tourism"

#   join: sdt_omnitrak_union {
#     view_label: "Ads Data"
#     sql_on: ${sdt_omnitrak_union.omnitrak_program_creative_key} = ${sdt_omnitrak.omnitrak_key_new} ;;
#     relationship: many_to_one
#   }
# }
