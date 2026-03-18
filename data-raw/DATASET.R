## code to prepare `DATASET` dataset goes here

download.file(url = "https://data.nantesmetropole.fr/api/explore/v2.1/catalog/datasets/244400404_comptages-velo-nantes-metropole/exports/csv?lang=fr&refine=jour%3A%222025%22&refine=vacances_zone_b%3A%22Vacances%20de%20la%20Toussaint%22&timezone=Europe%2FBerlin&use_labels=true&delimiter=%3B", destfile = "./data-raw/velo.csv")

df_velo <- readr::read_delim("./data-raw/velo.csv")

usethis::use_data(df_velo, overwrite = TRUE)

unlink("./data-raw/velo.csv")

checkhelper::use_data_doc(name = "df_velo",
                          description = "Données de vélos 2025 vacance de Toussaint",
                          source = "https://data.nantesmetropole.fr/explore/dataset/244400404_comptages-velo-nantes-metropole/information/?disjunctive.boucle_num&disjunctive.jour_de_la_semaine&disjunctive.boucle_libelle&refine.jour=2025&refine.vacances_zone_b=Vacances+de+la+Toussaint")
