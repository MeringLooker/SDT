connection: "mc_panoply"

include: "/Omnitrak/*.view"


explore: sdt_omnitrak_ext {
  hidden: no
  extends: [sdt_omnitrak]
}

explore: sdt_omnitrak_ratings_ext {
  hidden: no
  extends: [sdt_omnitrak_ratings]
}
