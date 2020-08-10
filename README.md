  <!-- badges: start -->
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/countfitteR)](https://cran.r-project.org/package=countfitteR)
[![Downloads](http://cranlogs.r-pkg.org/badges/countfitteR)](https://cran.r-project.org/package=countfitteR)
![pkgdown](https://github.com/biongram/countfitteR/workflows/pkgdown/badge.svg)
![check](https://github.com/biongram/countfitteR/workflows/check/badge.svg)
[![R build status](https://github.com/biongram/countfitteR/workflows/R-CMD-check/badge.svg)](https://github.com/biongram/countfitteR/actions)
  <!-- badges: end -->

# countfitteR

countfitteR is a web server based on Shiny technology for selecting the most appropriate count distribution in provided data sets.

## Installation

*countfitteR* is available on [CRAN](https://cran.r-project.org/package=countfitteR). 

```R
install.packages("countfitteR")
```

However, you can also install the developmental version of countfitteR directly from GitHub

```R
devtools::install_github("biongram/countfitteR")
```

## Run countfitteR

To run countfitteR type the following command into an R console.

```R
countfitteR::countfitteR_gui()
```

## How to cite

Chilimoniuk J, Gosiewska A, Słowik J, Roediger S and Burdukiewicz M (2020). countfitteR: comprehensive automatized evaluation of distribution models for count data. R package version 1.2. https://cran.r-project.org/package=countfitteR.


```tex
@Manual{,
  author = {Jaroslaw Chilimoniuk and Alicja Gosiewska and Jadwiga Słowik and Stefan Roediger and Michal Burdukiewicz},
  title = {countfitteR: comprehensive automatized evaluation of distribution models for count data},
  year = {2020},
  note = {R package version 1.2},
  url = {https://CRAN.R-project.org/package=countfitteR},
}
```
