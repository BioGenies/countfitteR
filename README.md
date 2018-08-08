[![Build Status](https://api.travis-ci.org/jarochi/countfitteR.png)](https://travis-ci.org/jarochi/countfitteR)

# countfitteR

countfitteR is a web server based on shiny technology for selecting the most appropriate count distribution to the dataset supplied by an user.

## Installation

*countfitteR* is net yet available on [CRAN](http://cran.us.r-project.org/). However, you 
can install the latest development version of the code using the following code:

```R
source("https://install-github.me/jarochi/countfitteR")
```

## Run countfitteR

To run countfitteR type the following command into an R console.

```R
library(countfitteR)
require(shiny); countfitteR::countfitteR_gui()
```

## How to cite

Jarosław Chilimoniuk, Stefan Rödiger, Michał Burdukiewicz (2018) countfitteR: a web server for the analysis of count data. [https://github.com/jarochi/countfitteR](https://github.com/jarochi/countfitteR)


```tex
@misc{countfitteR_2018,
	author = {Chilimoniuk, Jaros\l{}aw and R\"odiger, Stefan and Burdukiewicz, Micha\l{}},
	month = may,
	note = R package,
    title = {{countfitteR}: a web server for the analysis of count data},
	url = {https://github.com/jarochi/countfitteR},
	urldate = {2018-07-11},
	year = {2018}
}
```
