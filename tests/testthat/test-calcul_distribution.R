test_that("calcul distribution applique le filtre à la demande", {
  res_filtre <- calcul_distribution_semaine(df_velo)
  res_no_filtre <- calcul_distribution_semaine(df_velo, filtre = FALSE)

  diff_trajet <- sum(res_filtre$trajets) - sum(res_no_filtre$trajets)
  expect_equal(diff_trajet, -12064)
})
