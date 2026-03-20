# Filtre les boucles par numéro

Filtre les boucles par numéro

## Usage

``` r
filtre_boucle(trajet, boucle)
```

## Arguments

- trajet:

  tibble. Données de trajets

- boucle:

  character. Numéro de boucle à selectionner

## Value

tibble. Données filtrées.

## Examples

``` r
filtre_boucle(trajet = df_velo, boucle = c("880", "881"))
#> # A tibble: 32 × 32
#>    `Numéro de boucle` Jour        `00`  `01`  `02`  `03`  `04`  `05`  `06`  `07`
#>                 <dbl> <date>     <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1                880 2025-11-02    30    27    14    11     5     3     4     4
#>  2                881 2025-11-02    14    23     3     1     3     1     9     9
#>  3                881 2025-11-01    28    19    17     6     3     5     5    14
#>  4                880 2025-11-01    45    29    19    13    11     5    10     4
#>  5                880 2025-10-31    30    13     8    12     7     7    22    66
#>  6                881 2025-10-31    18     7     3     3     2     5    21    57
#>  7                880 2025-10-30    20    18     3     3     5    10    17    87
#>  8                881 2025-10-30    12     2     4     2     3     8    24    64
#>  9                880 2025-10-29    18    13     7     1     5     9    22    69
#> 10                881 2025-10-29     3     3     1     3     3     6    16    60
#> # ℹ 22 more rows
#> # ℹ 22 more variables: `08` <dbl>, `09` <dbl>, `10` <dbl>, `11` <dbl>,
#> #   `12` <dbl>, `13` <dbl>, `14` <dbl>, `15` <dbl>, `16` <dbl>, `17` <dbl>,
#> #   `18` <dbl>, `19` <dbl>, `20` <dbl>, `21` <dbl>, `22` <dbl>, `23` <dbl>,
#> #   Total <dbl>, `Probabilité de présence d'anomalies` <chr>,
#> #   `Jour de la semaine` <dbl>, `Boucle de comptage` <chr>,
#> #   `Date formatée` <date>, Vacances <chr>
```
