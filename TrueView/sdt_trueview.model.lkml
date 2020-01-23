connection: "mc_panoply"

include: "/TrueView/*.view.lkml"
include: "/Google_Analytics/*.view.lkml"

explore: sdt_trueview_extended {
  extends: [sdt_trueview]
  hidden: no
}
