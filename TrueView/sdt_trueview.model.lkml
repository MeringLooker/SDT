connection: "mc_panoply"

include: "/TrueView/*.view.lkml"
include: "/Google_Analytics/*.view.lkml"

explore: sdt_yt_extended {
  extends: [sdt_yt]
  hidden: no
  label: "YouTube"
  view_label: "YouTube"
  group_label: "San Diego Tourism"
}
