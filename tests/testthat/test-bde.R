test_that("bde_data works", {
  skip()

  x <- bde_data("D_1NBAF472", lang = "en", time_range = "30M")
  x <- bde_data(
    c("DTNPDE2010_P0000P_PS_APU", "DTNSEC2010_S0000P_APU_SUMAMOVIL"),
    lang = "en",
    time_range = "MAX"
  )
  x <- bde_data(
    "DEEQ.N.ES.W1.S1.S1.T.B.G._Z._Z._Z.EUR._T._X.N.ALL",
    lang = "en",
    time_range = 2024
  )
})
