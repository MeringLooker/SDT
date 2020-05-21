connection: "mc_panoply"

include: "/Pinterest/*.view.lkml"
include: "/Google_Analytics/*.view.lkml"

explore: sdt_pinterest_extended {
  extends: [sdt_pinterest]
  hidden: no
}
