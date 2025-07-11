  <!-- badges: start -->
[![published in: Annals of Translational Medicine](https://img.shields.io/badge/published%20in-ATM-green.svg)](https://atm.amegroups.org/article/view/63994/html)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/countfitteR)](https://cran.r-project.org/package=countfitteR)
[![Downloads](https://cranlogs.r-pkg.org/badges/countfitteR)](https://cran.r-project.org/package=countfitteR)
![pkgdown](https://github.com/BioGenies/countfitteR/workflows/pkgdown/badge.svg)
![check](https://github.com/BioGenies/countfitteR/workflows/check/badge.svg)
[![R build status](https://github.com/BioGenies/countfitteR/workflows/R-CMD-check/badge.svg)](https://github.com/BioGenies/countfitteR/actions)
  <!-- badges: end -->

# countfitteR

countfitteR is a web server based on Shiny technology for selecting the most appropriate count distribution in provided data sets. 

<!-- The functions of countfitteR can also be accessed through our [web server](http://biongram.biotech.uni.wroc.pl/countfitter/) or via the R console for customized analysis pipelines. -->

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

- Chilimoniuk, J., Gosiewska, A., Słowik, J., Weiss, R., Deckert, P.M., Rödiger, S., and Burdukiewicz, M. (2021). countfitteR: efficient selection of count distributions to assess DNA damage. Annals of Translational Medicine.
- Chilimoniuk, J., Gosiewska, A., Słowik, J., Weiss, R., Deckert, P.M., Rödiger, S., Burdukiewicz, M., (2021). countfitteR: efficient selection of count distributions to assess DNA damage. *Annals of Translational Medicine*. https://doi.org/10.21037/atm-20-6363


```tex
@Article{,
  author = "Jarosław Chilimoniuk and Alicja Gosiewska and Jadwiga Słowik and Romano Weiss and P. Markus Deckert and Stefan Rödiger and Michał Burdukiewicz",
  title = "countfitteR: efficient selection of count distributions to assess DNA damage",
  year = 2021, 
  issn = {2305-5847},
  journal = "Annals of Translational Medicine",
  url = "https://atm.amegroups.org/article/view/63994/html",
}

@article{chilimoniuk_countfitter_2021,
	title = {{countfitteR}: efficient selection of count distributions to assess {DNA} damage},
	volume = {0},
	issn = {2305-5847, 2305-5839},
	shorttitle = {{countfitteR}},
	url = {https://atm.amegroups.org/article/view/63994/html},
	doi = {10.21037/atm-20-6363},
	abstract = {countfitteR: efficient selection of count distributions to assess DNA damage},
	language = {en},
	number = {0},
	urldate = {2021-03-15},
	journal = {Annals of Translational Medicine},
	author = {Chilimoniuk, Jarosław and Gosiewska, Alicja and Słowik, Jadwiga and Weiss, Romano and Deckert, P. Markus and Rödiger, Stefan and Burdukiewicz, Michał},
	month = mar,
	year = {2021},
	note = {Number: 0
Publisher: AME Publishing Company}
}
```
