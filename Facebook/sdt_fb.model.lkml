connection: "mc_panoply"

include: "/Facebook/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: sdt_fb_extended {
  extends: [sdt_fb]
  hidden: no
}
