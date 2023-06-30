
# displaced

[![CRAN
status](https://www.r-pkg.org/badges/version/galalh)](https://cran.r-project.org/package=galalh)

`displaced` is an R package designed to facilitate access to the United
Nations High Commissioner for Refugees (UNHCR) Refugee Data Finder. It
provides an easy-to-use interface to the database, which covers forcibly
displaced populations, including refugees, asylum-seekers, internally
displaced people, stateless people, and others over a span of more than
70 years.

This package provides data from three major sources:

1.  Data from UNHCR’s annual statistical activities dating back to 1951.
2.  Data from the United Nations Relief and Works Agency for Palestine
    Refugees in the Near East (UNRWA), specifically for registered
    Palestine refugees under UNRWA’s mandate.
3.  Data from the Internal Displacement Monitoring Centre (IDMC) on
    people displaced within their country due to conflict or violence.

## Datasets

The `displaced` package includes eight datasets:

1.  `population`: Data on forcibly displaced and stateless persons by
    year, including refugees, asylum-seekers, returned refugees,
    internally displaced persons (IDPs), and stateless persons.

2.  `idmc`: Data from the Internal Displacement Monitoring Centre on the
    total number of IDPs due to conflict and violence.

3.  `asylum_applications`: Data on asylum applications including
    procedure type and application type.

4.  `asylum_decisions`: Data on asylum decisions, including recognised,
    rejected, and otherwise closed claims.

5.  `demographics`: Demographic and sub-national data, where available,
    including age and sex disaggregation.

6.  `solutions`: Data on durable solutions for refugees and IDPs.

7.  `unrwa`: Data on registered Palestine refugees under UNRWA’s
    mandate.

8.  `countries`: Country codes, names, UN major areas, and UNHCR
    regional bureaux/operations.

Please check the individual dataset description for more details on the
fields each dataset provides.

## Installation

Install either from CRAN with:

``` r
install.packages("displaced")
```

Or retrieve the development version from Github with:

``` r
remotes::install_github("PopulationStatistics/displaced")
```

## Usage

Here are some examples of how you can use the `displaced` package.

``` r
# Load the package
library(displaced)
str(displaced::population)
#> tibble [120,338 × 16] (S3: tbl_df/tbl/data.frame)
#>  $ year             : num [1:120338] 1951 1951 1951 1951 1951 ...
#>  $ coo_name         : chr [1:120338] "Unknown" "Unknown" "Unknown" "Unknown" ...
#>  $ coo              : chr [1:120338] "UKN" "UKN" "UKN" "UKN" ...
#>  $ coo_iso          : chr [1:120338] NA NA NA NA ...
#>  $ coa_name         : chr [1:120338] "Australia" "Austria" "Belgium" "Canada" ...
#>  $ coa              : chr [1:120338] "AUL" "AUS" "BEL" "CAN" ...
#>  $ coa_iso          : chr [1:120338] "AUS" "AUT" "BEL" "CAN" ...
#>  $ refugees         : num [1:120338] 180000 282000 55000 168511 2000 ...
#>  $ asylum_seekers   : num [1:120338] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ returned_refugees: num [1:120338] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ idps             : num [1:120338] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ returned_idps    : num [1:120338] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ stateless        : num [1:120338] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ ooc              : num [1:120338] 0 0 0 0 0 0 0 0 0 0 ...
#>  $ oip              : num [1:120338] NA NA NA NA NA NA NA NA NA NA ...
#>  $ hst              : num [1:120338] NA NA NA NA NA NA NA NA NA NA ...

# get the total number of refugees (including refugee-like) from Sudan in Chad in 2021
displaced::population |>
  subset(year == 2021 & coa_iso == "TCD" & coo_iso == "SDN",
         select = refugees)
#> # A tibble: 1 × 1
#>   refugees
#>      <dbl>
#> 1   375999
```

## License

This package is released under the [Creative Commons Attribution 4.0
International Public
License](https://creativecommons.org/licenses/by/4.0/legalcode)
