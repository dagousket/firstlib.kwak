#' Filtre les anomalies
#'
#' @param trajet tibble. Données de trajets
#'
#' @importFrom dplyr filter
#'
#' @returns tibble. Données filtrées sans anomalies.
#' @export
filtre_anomalie <- function(trajet){
  trajet |>
    filter(
      is.na(`Probabilité de présence d'anomalies`),
      Total < 10000,
      Total > 0
    )
}

#' Compter le nombre de trajets
#'
#' @param trajet tibble. Données de trajets
#'
#' @importFrom dplyr pull
#'
#' @returns tibble. Données de comptage.
#' @export
compter_nombre_trajets <- function(trajet){
  trajet |>
    pull(Total) |>
    sum()
}


#' Compter le nombre de boucle
#'
#' @param trajet tibble. Données de trajets
#'
#' @importFrom dplyr pull n_distinct
#'
#' @returns tibble. Données de comptage.
#' @export
compter_nombre_boucle <- function(trajet){
  trajet |>
    pull(`Numéro de boucle`) |>
    n_distinct()
}

#' Trouver la paire boucle-jour avec le plus de trajet
#'
#' @param trajet tibble. Données de trajets
#'
#' @importFrom dplyr slice_max select filter pull
#'
#' @returns tibble. Données de la paires jour-boucle avec le plus de trajets.
#' @export
trouver_trajet_max <- function(trajet){
  trajet_max <- trajet |>
    filtre_anomalie() |>
    slice_max(Total) |>
    select(`Boucle de comptage`, Jour, Total)

  trajet_max$moyenne_jour_identique <- trajet |>
    filter(Jour == trajet_max$Jour) |>
    pull(Total) |>
    mean()

  trajet_max$moyenne_boucle_identique <- trajet |>
    filter(`Boucle de comptage` == trajet_max$`Boucle de comptage`) |>
    pull(Total) |>
    mean()

  return(trajet_max)
}


#' Calcul du nombre de trajet par jour de la semaine
#'
#' @param trajet tibble. Données de trajets
#'
#' @importFrom dplyr count
#'
#' @returns tibble. Données de comptage.
#' @export
calcul_distribution_semaine <- function(trajet){
  trajet |>
    count(`Jour de la semaine`, wt = Total, sort = TRUE, name = "trajets")
}

#' Graph trjat par jour de la semaine
#'
#' @param trajet tibble. Données de trajets
#'
#' @importFrom dplyr mutate
#' @importFrom forcats fct_recode
#' @importFrom ggplot2 ggplot aes geom_col
#'
#' @returns ggplot. Graphique en barre
#' @export
plot_distribution_semaine <- function(trajet) {
  trajet_weekday <- trajet |>
    filtre_anomalie() |>
    calcul_distribution_semaine() |>
    mutate(
      jour = fct_recode(
        factor(`Jour de la semaine`),
        "lundi" = "1",
        "mardi" = "2",
        "mercredi" = "3",
        "jeudi" = "4",
        "vendredi" = "5",
        "samedi" = "6",
        "dimanche" = "7"
      )
    )

  ggplot(trajet_weekday) +
    aes(x = jour, y = trajets) +
    geom_col()
}


#' Filtre les boucles par numéro
#'
#' @param trajet tibble. Données de trajets
#' @param boucle character. Numéro de boucle à selectionner
#'
#' @importFrom dplyr filter
#'
#' @returns tibble. Données filtrées.
#' @export
#'
#' @examples
#' filtre_boucle(trajet = df_velo, boucle = c("880", "881"))
filtre_boucle <- function(trajet, boucle){
  stopifnot(is.character(boucle))

  trajet |>
    filter(
      `Numéro de boucle` %in% boucle
    )
}
