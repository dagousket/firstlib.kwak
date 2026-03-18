test_that("filtre boucle renvoit un tibble", {
  res <- filtre_boucle(df_velo, boucle = "880")
  expect_s3_class(res, "tbl")
})

test_that("filtre boucle renvoit uniquement les boucles demandées", {
  res <- filtre_boucle(df_velo, boucle = c("880", "881"))
  expect_setequal(res$`Numéro de boucle`, c("880", "881"))
})

test_that("filtre boucle renvoit un tibble vide pour une boucle inconnue", {
  res <- filtre_boucle(df_velo, boucle = "lala")
  expect_equal(nrow(res), 0)
})

test_that("filtre boucle renvoit une erreur pour des info de boucle numerique", {
  expect_error(filtre_boucle(df_velo, boucle = 10))
})
