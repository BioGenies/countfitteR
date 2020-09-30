  <!-- badges: start -->
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/countfitteR)](https://cran.r-project.org/package=countfitteR)
[![Downloads](http://cranlogs.r-pkg.org/badges/countfitteR)](https://cran.r-project.org/package=countfitteR)
![pkgdown](https://github.com/BioGenies/countfitteR/workflows/pkgdown/badge.svg)
![check](https://github.com/BioGenies/countfitteR/workflows/check/badge.svg)
[![R build status](https://github.com/BioGenies/countfitteR/workflows/R-CMD-check/badge.svg)](https://github.com/BioGenies/countfitteR/actions)
  <!-- badges: end -->

# countfitteR

countfitteR is a web server based on Shiny technology for selecting the most appropriate count distribution in provided data sets. The functions of countfitteR can also be accessed via the R console for coustomized analysis pipelines.

## Installation

*countfitteR* is available on [CRAN](https://cran.r-project.org/package=countfitteR). 

```R
install.packages("countfitteR")
```

However, you can also install the developmental version of countfitteR directly from GitHub

```R
devtools::install_github("BioGenies/countfitteR")
```

## Run countfitteR

To run countfitteR type the following command into an R console.

```R
countfitteR::countfitteR_gui()
```

## How to cite

Chilimoniuk J, Gosiewska A, Słowik J, Weiss R, Deckert PM, Roediger S and Burdukiewicz M (2020). countfitteR: comprehensive automatized evaluation of distribution models for count data. R package version 1.4. https://cran.r-project.org/package=countfitteR.


```tex
@Manual{,
  author = {Jaroslaw Chilimoniuk and Alicja Gosiewska and Jadwiga Słowik and Romano Weiss and P. Markus Deckert and Stefan Roediger and Michal Burdukiewicz},
  title = {countfitteR: comprehensive automatized evaluation of distribution models for count data},
  year = {2020},
  note = {R package version 1.4},
  url = {https://CRAN.R-project.org/package=countfitteR},
}
```
