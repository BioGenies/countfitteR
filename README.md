  <!-- badges: start -->
[![published in: Annals of Translational Medicine](https://img.shields.io/badge/published%20in-ATM-green.svg)](https://atm.amegroups.com/article/view/63994)
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/countfitteR)](https://cran.r-project.org/package=countfitteR)
[![Downloads](http://cranlogs.r-pkg.org/badges/countfitteR)](https://cran.r-project.org/package=countfitteR)
![pkgdown](https://github.com/BioGenies/countfitteR/workflows/pkgdown/badge.svg)
![check](https://github.com/BioGenies/countfitteR/workflows/check/badge.svg)
[![R build status](https://github.com/BioGenies/countfitteR/workflows/R-CMD-check/badge.svg)](https://github.com/BioGenies/countfitteR/actions)
  <!-- badges: end -->

# countfitteR

countfitteR is a web server based on Shiny technology for selecting the most appropriate count distribution in provided data sets. The functions of countfitteR can also be accessed via the R console for customized analysis pipelines.

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

Chilimoniuk, J., Gosiewska, A., Słowik, J., Weiss, R., Deckert, P.M., Rödiger, S., and Burdukiewicz, M. (2021). countfitteR: efficient selection of count distributions to assess DNA damage. Annals of Translational Medicine.


```tex
@Article{,
  author = "Jarosław Chilimoniuk and Alicja Gosiewska and Jadwiga Słowik and Romano Weiss and P. Markus Deckert and Stefan Rödiger and Michał Burdukiewicz",
  title = "countfitteR: efficient selection of count distributions to assess DNA damage",
  year = 2021, 
  issn = {2305-5847},
  journal = "Annals of Translational Medicine",
  url = "https://atm.amegroups.com/article/view/63994",
}
```
