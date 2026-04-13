test_that("filtre boucle renvoit un tibble", {
  res <- filtrer_trajet(df_velo, boucle = "880")
  expect_s3_class(res, "tbl")
})

test_that("filtre boucle renvoit uniquement les boucles demandées", {
  res <- filtrer_trajet(df_velo, boucle = c("880", "881"))
  expect_setequal(res$`Numéro de boucle`, c("880", "881"))
})

test_that("filtre boucle renvoit un tibble vide pour une boucle inconnue", {
  res <- filtrer_trajet(df_velo, boucle = "lala")
  expect_equal(nrow(res), 0)
})

test_that("filtre boucle renvoit une erreur pour des info de boucle numerique", {
  expect_error(filtrer_trajet(df_velo, boucle = 10))
})

test_that("filtre boucle renvoit un df complet si boucle est NULL", {
  expect_equal(filtrer_trajet(df_velo, boucle = NULL), df_velo)
})
