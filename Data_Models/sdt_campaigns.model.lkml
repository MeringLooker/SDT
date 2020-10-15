connection: "mc_panoply"

include: "/AdWords/**/*.view"
include: "/DCM/**/*.view"
include: "/Publisher_Passback/**/*.view"
include: "/Facebook/**/*.view"
include: "/Google_Analytics/**/*.view"
include: "/Omnitrak/**/*.view"
include: "/Pinterest/**/*.view"
include: "/TrueView/**/*.view"
include: "/Derived_Tables/**/*.view"

datagroup: 24hour_cache {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

## FY21 Omnitrak ##

explore: sdt_omnitrak_ext {
  hidden: no
  extends: [sdt_omnitrak]
}

## FY21 Domestic SEM ##

explore: pdt_us_sem_campaign {
  label: "FY21 US SEM"
  view_label: "FY21 US SEM"
  group_label: "San Diego Tourism"
  hidden: no
}

## FY21 Fall Drive Market ##

explore: pdt_fy21_drivemarket_campaign {
  label: "FY21 Fall Drive Market"
  view_label: "FY21 Fall Drive Market"
  group_label: "San Diego Tourism"
  hidden: no
}

##  FY21 United States Pull-Through  ##

explore: pdt_fy21_pullthrough_campaign {
  label: "FY21 US Pull-Through"
  view_label: "FY21 US Pull-Through"
  group_label: "San Diego Tourism"
  hidden: no
}

## FY21 Locals Digital ##

explore: pdt_locals_campaign {
  label: "FY21 Locals Recovery"
  view_label: "FY21 Locals Recovery"
  group_label: "San Diego Tourism"
  hidden: no
}

##  FY20/21 Always On Content  ##

explore: pdt_fy21_content_campaign {
  label: "FY21 Always On Content"
  view_label: "FY21 Always On Content"
  group_label: "San Diego Tourism"
  hidden: no
}

## FY19/20 Always On Content ##

explore: pdt_content_campaign {
  label: "FY20 Always On Content"
  view_label: "FY20 Always On Content"
  group_label: "San Diego Tourism"
  hidden: yes
}

##  FY19/20 Balboa Park  ##

explore: ndt_bp_campaign {
  label: "FY20 Balboa Park Digital"
  view_label: "Balboa Park Digital"
  group_label: "San Diego Tourism"
  hidden: yes
}

##  FY19/20 Digital Video  ##

explore: pdt_brand_digital_video_campaign {
  label: "FY20 Digtal Video"
  view_label: "Digital Video"
  group_label: "San Diego Tourism"
  hidden: yes
}

##  FY19/20 Canada Digital  ##

explore: ndt_can_digital_campaign {
  #persist_with: vca_dream365_datagroup
  label: "FY20 Canada Digital"
  view_label: "Canada Digital"
  group_label: "San Diego Tourism"
  hidden: yes
}

##  FY19/20 Canada Pull-Through  ##

explore: ndt_can_pullthrough_campaign {
  #persist_with: vca_dream365_datagroup
  label: "FY20 CAN Pull-Through"
  view_label: "CAN Pull-Through"
  group_label: "San Diego Tourism"
  hidden: yes
}

##  FY19/20 Canada TripAdvisor Program  ##

explore: ndt_ta_can_campaign {
  #persist_with: vca_dream365_datagroup
  label: "FY20 CAN TripAdvisor Program"
  view_label: "CAN TripAdvisor Program"
  group_label: "San Diego Tourism"
  hidden: yes
}

##  FY19/20 United Kingdom Digital  ##

explore: ndt_uk_digital_campaign {
  label: "FY20 UK Digital"
  view_label: "UK Digital"
  group_label: "San Diego Tourism"
  hidden: yes
}

##  FY19/20 United Kingdom Pull-Through  ##

explore: ndt_uk_pullthrough_campaign {
  #persist_with: vca_dream365_datagroup
  label: "FY20 UK Pull-Through"
  view_label: "UK Pull-Through"
  group_label: "San Diego Tourism"
  hidden: yes
}

##  FY19/20 United Kingdom TripAdvisor Program  ##

explore: ndt_ta_uk_campaign {
  #persist_with: vca_dream365_datagroup
  label: "FY20 UK TripAdvisor Program"
  view_label: "UK TripAdvisor Program"
  group_label: "San Diego Tourism"
  hidden: yes
}

##  FY19/20 Family Content  ##

explore: pdt_fam_content_campaign {
  label: "FY20 Family Content"
  view_label: "Family Content"
  group_label: "San Diego Tourism"
  hidden: yes
}

##  FY19/20 United States Pull-Through  ##

explore: ndt_us_pullthrough_campaign {
  label: "FY20 US Pull-Through"
  view_label: "FY20 US Pull-Through"
  group_label: "San Diego Tourism"
  hidden: yes
}

##  FY19/20 United States TripAdvisor Program  ##

explore: ndt_ta_us_campaign {
  label: "FY20 US TripAdvisor Program"
  view_label: "US TripAdvisor Program"
  group_label: "San Diego Tourism"
  hidden: yes
}

##  FY19/20 Premium Digital Display  ##

explore: ndt_premium_display_campaign {
  #persist_with: vca_dream365_datagroup
  label: "FY20 Premium Digital Display"
  view_label: "Premium Digital Display"
  group_label: "San Diego Tourism"
  hidden: yes
}
