---
title: "countfitteR report"
author: "Michał Burdukiewicz, Stefan Rödiger, Jarosław Chilimoniuk"
date: ""
output:
html_document:
css: report.css
toc: true
---

# countfitteR



Report generated on 2018-07-20 16:22:12.

Detected input file: six_replicates_bad.csv.  

## Settings

Confidence level: 0.95.  

Type of analysis: separate experiments.

Models selected: Poisson, NB, ZIP, ZINB.


    
## Mean value estimate and its confidence    
    
Counts were fitted to model(s) using the count name as the explanatory variable. The selection of models may be altered using *Settings* panel. 
<img src="figure/unnamed-chunk-2-1.png" title="plot of chunk unnamed-chunk-2" alt="plot of chunk unnamed-chunk-2" style="display: block; margin: auto;" />
    
## Summary of estimates    
    
Estimates are presented in the table below along with the BIC values of their models.
<!-- html table generated in R 3.5.1 by xtable 1.8-2 package -->
<!-- Fri Jul 20 16:22:12 2018 -->
<table border=1>
<tr> <th> count </th> <th> lambda </th> <th> lower </th> <th> upper </th> <th> BIC </th> <th> model </th>  </tr>
  <tr> <td> 1_72 </td> <td align="right"> 0.03 </td> <td align="right"> 0.01 </td> <td align="right"> 0.05 </td> <td align="right"> 79.69 </td> <td> Poisson </td> </tr>
  <tr> <td> 2_72 </td> <td align="right"> 0.01 </td> <td align="right"> 0.00 </td> <td align="right"> 0.03 </td> <td align="right"> 48.33 </td> <td> Poisson </td> </tr>
  <tr> <td> 3_72 </td> <td align="right"> 0.01 </td> <td align="right"> 0.00 </td> <td align="right"> 0.03 </td> <td align="right"> 39.40 </td> <td> Poisson </td> </tr>
  <tr> <td> 4_72 </td> <td align="right"> 0.02 </td> <td align="right"> 0.01 </td> <td align="right"> 0.04 </td> <td align="right"> 72.76 </td> <td> Poisson </td> </tr>
  <tr> <td> 5_72 </td> <td align="right"> 0.01 </td> <td align="right"> 0.00 </td> <td align="right"> 0.03 </td> <td align="right"> 48.85 </td> <td> Poisson </td> </tr>
  <tr> <td> 6_72 </td> <td align="right"> 0.02 </td> <td align="right"> 0.01 </td> <td align="right"> 0.04 </td> <td align="right"> 66.16 </td> <td> Poisson </td> </tr>
  <tr> <td> 1_72 </td> <td align="right"> 0.03 </td> <td align="right"> 0.01 </td> <td align="right"> 0.05 </td> <td align="right"> 85.40 </td> <td> NB </td> </tr>
  <tr> <td> 2_72 </td> <td align="right"> 0.01 </td> <td align="right"> 0.00 </td> <td align="right"> 0.03 </td> <td align="right"> 54.05 </td> <td> NB </td> </tr>
  <tr> <td> 3_72 </td> <td align="right"> 0.01 </td> <td align="right"> 0.00 </td> <td align="right"> 0.03 </td> <td align="right"> 45.12 </td> <td> NB </td> </tr>
  <tr> <td> 4_72 </td> <td align="right"> 0.02 </td> <td align="right"> 0.01 </td> <td align="right"> 0.04 </td> <td align="right"> 78.49 </td> <td> NB </td> </tr>
  <tr> <td> 5_72 </td> <td align="right"> 0.01 </td> <td align="right"> 0.00 </td> <td align="right"> 0.03 </td> <td align="right"> 54.62 </td> <td> NB </td> </tr>
  <tr> <td> 6_72 </td> <td align="right"> 0.02 </td> <td align="right"> 0.01 </td> <td align="right"> 0.05 </td> <td align="right"> 67.90 </td> <td> NB </td> </tr>
  <tr> <td> 1_72 </td> <td align="right"> 0.03 </td> <td align="right"> 0.01 </td> <td align="right"> 0.05 </td> <td align="right"> 85.40 </td> <td> ZIP </td> </tr>
  <tr> <td> 2_72 </td> <td align="right"> 0.01 </td> <td align="right"> 0.00 </td> <td align="right"> 0.04 </td> <td align="right"> 54.05 </td> <td> ZIP </td> </tr>
  <tr> <td> 3_72 </td> <td align="right"> 0.01 </td> <td align="right"> 0.00 </td> <td align="right"> 0.04 </td> <td align="right"> 45.12 </td> <td> ZIP </td> </tr>
  <tr> <td> 4_72 </td> <td align="right"> 0.02 </td> <td align="right"> 0.01 </td> <td align="right"> 0.05 </td> <td align="right"> 78.49 </td> <td> ZIP </td> </tr>
  <tr> <td> 5_72 </td> <td align="right"> 0.01 </td> <td align="right"> 0.00 </td> <td align="right"> 0.04 </td> <td align="right"> 54.62 </td> <td> ZIP </td> </tr>
  <tr> <td> 6_72 </td> <td align="right"> 0.38 </td> <td align="right"> 0.06 </td> <td align="right"> 2.53 </td> <td align="right"> 67.67 </td> <td> ZIP </td> </tr>
  <tr> <td> 1_72 </td> <td align="right"> 0.03 </td> <td align="right"> 0.01 </td> <td align="right"> 0.05 </td> <td align="right"> 91.10 </td> <td> ZINB </td> </tr>
  <tr> <td> 2_72 </td> <td align="right"> 0.01 </td> <td align="right"> 0.00 </td> <td align="right"> 0.04 </td> <td align="right"> 59.76 </td> <td> ZINB </td> </tr>
  <tr> <td> 3_72 </td> <td align="right"> 0.01 </td> <td align="right"> 0.00 </td> <td align="right"> 0.04 </td> <td align="right"> 50.83 </td> <td> ZINB </td> </tr>
  <tr> <td> 4_72 </td> <td align="right"> 0.02 </td> <td align="right"> 0.01 </td> <td align="right"> 0.05 </td> <td align="right"> 84.22 </td> <td> ZINB </td> </tr>
  <tr> <td> 5_72 </td> <td align="right"> 0.01 </td> <td align="right"> 0.00 </td> <td align="right"> 0.04 </td> <td align="right"> 60.40 </td> <td> ZINB </td> </tr>
  <tr> <td> 6_72 </td> <td align="right"> 0.38 </td> <td align="right"> 0.06 </td> <td align="right"> 2.54 </td> <td align="right"> 73.38 </td> <td> ZINB </td> </tr>
   </table>


    
## Coefficients    
    
Estimated coefficients of models (&lambda; for all distributions, &theta; for NB and ZINB, <i>r</i> for ZIP and ZINB).
<!-- html table generated in R 3.5.1 by xtable 1.8-2 package -->
<!-- Fri Jul 20 16:22:13 2018 -->
<table border=1>
<tr> <th> count </th> <th> lambda </th> <th> theta </th> <th> r </th> <th> model </th>  </tr>
  <tr> <td> 1_72 </td> <td align="right"> 0.03 </td> <td align="right">  </td> <td align="right">  </td> <td> Poisson </td> </tr>
  <tr> <td> 2_72 </td> <td align="right"> 0.01 </td> <td align="right">  </td> <td align="right">  </td> <td> Poisson </td> </tr>
  <tr> <td> 3_72 </td> <td align="right"> 0.01 </td> <td align="right">  </td> <td align="right">  </td> <td> Poisson </td> </tr>
  <tr> <td> 4_72 </td> <td align="right"> 0.02 </td> <td align="right">  </td> <td align="right">  </td> <td> Poisson </td> </tr>
  <tr> <td> 5_72 </td> <td align="right"> 0.01 </td> <td align="right">  </td> <td align="right">  </td> <td> Poisson </td> </tr>
  <tr> <td> 6_72 </td> <td align="right"> 0.02 </td> <td align="right">  </td> <td align="right">  </td> <td> Poisson </td> </tr>
  <tr> <td> 1_72 </td> <td align="right"> 0.03 </td> <td align="right"> 581.47 </td> <td align="right">  </td> <td> NB </td> </tr>
  <tr> <td> 2_72 </td> <td align="right"> 0.01 </td> <td align="right"> 284.60 </td> <td align="right">  </td> <td> NB </td> </tr>
  <tr> <td> 3_72 </td> <td align="right"> 0.01 </td> <td align="right"> 212.86 </td> <td align="right">  </td> <td> NB </td> </tr>
  <tr> <td> 4_72 </td> <td align="right"> 0.02 </td> <td align="right"> 492.29 </td> <td align="right">  </td> <td> NB </td> </tr>
  <tr> <td> 5_72 </td> <td align="right"> 0.01 </td> <td align="right"> 268.48 </td> <td align="right">  </td> <td> NB </td> </tr>
  <tr> <td> 6_72 </td> <td align="right"> 0.02 </td> <td align="right"> 0.05 </td> <td align="right">  </td> <td> NB </td> </tr>
  <tr> <td> 1_72 </td> <td align="right"> 0.03 </td> <td align="right">  </td> <td align="right"> 0.00 </td> <td> ZIP </td> </tr>
  <tr> <td> 2_72 </td> <td align="right"> 0.01 </td> <td align="right">  </td> <td align="right"> 0.00 </td> <td> ZIP </td> </tr>
  <tr> <td> 3_72 </td> <td align="right"> 0.01 </td> <td align="right">  </td> <td align="right"> 0.00 </td> <td> ZIP </td> </tr>
  <tr> <td> 4_72 </td> <td align="right"> 0.02 </td> <td align="right">  </td> <td align="right"> 0.00 </td> <td> ZIP </td> </tr>
  <tr> <td> 5_72 </td> <td align="right"> 0.01 </td> <td align="right">  </td> <td align="right"> 0.00 </td> <td> ZIP </td> </tr>
  <tr> <td> 6_72 </td> <td align="right"> 0.38 </td> <td align="right">  </td> <td align="right"> 0.95 </td> <td> ZIP </td> </tr>
  <tr> <td> 1_72 </td> <td align="right"> 0.03 </td> <td align="right"> 1922.83 </td> <td align="right"> 0.00 </td> <td> ZINB </td> </tr>
  <tr> <td> 2_72 </td> <td align="right"> 0.01 </td> <td align="right"> 1428.62 </td> <td align="right"> 0.00 </td> <td> ZINB </td> </tr>
  <tr> <td> 3_72 </td> <td align="right"> 0.01 </td> <td align="right"> 685.33 </td> <td align="right"> 0.00 </td> <td> ZINB </td> </tr>
  <tr> <td> 4_72 </td> <td align="right"> 0.02 </td> <td align="right"> 6276.54 </td> <td align="right"> 0.00 </td> <td> ZINB </td> </tr>
  <tr> <td> 5_72 </td> <td align="right"> 0.01 </td> <td align="right"> 758.53 </td> <td align="right"> 0.00 </td> <td> ZINB </td> </tr>
  <tr> <td> 6_72 </td> <td align="right"> 0.38 </td> <td align="right"> 2070.37 </td> <td align="right"> 0.95 </td> <td> ZINB </td> </tr>
   </table>


    
## Decision
Count name:1_72<br/>The most appropriate model (model with the lowest BIC value): Poisson.<br/>The evidence that the model with the lowest BIC value
                  is the most appropriate: substantial.<br/><br/><br/>Count name:2_72<br/>The most appropriate model (model with the lowest BIC value): Poisson.<br/>The evidence that the model with the lowest BIC value
                  is the most appropriate: substantial.<br/><br/><br/>Count name:3_72<br/>The most appropriate model (model with the lowest BIC value): Poisson.<br/>The evidence that the model with the lowest BIC value
                  is the most appropriate: substantial.<br/><br/><br/>Count name:4_72<br/>The most appropriate model (model with the lowest BIC value): Poisson.<br/>The evidence that the model with the lowest BIC value
                  is the most appropriate: substantial.<br/><br/><br/>Count name:5_72<br/>The most appropriate model (model with the lowest BIC value): Poisson.<br/>The evidence that the model with the lowest BIC value
                  is the most appropriate: substantial.<br/><br/><br/>Count name:6_72<br/>The most appropriate model (model with the lowest BIC value): Poisson.<br/>The evidence that the model with the lowest BIC value
                  is the most appropriate: negligible.<br/>


    
## Compare distribution    
    
Compare empirical distribution of counts with the distribution defined by the model fitted to counts. Points indicate the real number of counts, while bars the number of counts estimated by a distribution.
<img src="figure/unnamed-chunk-5-1.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />
<!-- html table generated in R 3.5.1 by xtable 1.8-2 package -->
<!-- Fri Jul 20 16:22:15 2018 -->
<table border=1>
<tr> <th> count </th> <th> model </th> <th> x </th> <th> n </th> <th> value </th>  </tr>
  <tr> <td> 1_72 </td> <td> Poisson </td> <td align="right">   0 </td> <td align="right"> 292 </td> <td align="right"> 292.11 </td> </tr>
  <tr> <td> 1_72 </td> <td> Poisson </td> <td align="right">   1 </td> <td align="right">   8 </td> <td align="right"> 7.79 </td> </tr>
  <tr> <td> 1_72 </td> <td> NB </td> <td align="right">   0 </td> <td align="right"> 292 </td> <td align="right"> 292.11 </td> </tr>
  <tr> <td> 1_72 </td> <td> NB </td> <td align="right">   1 </td> <td align="right">   8 </td> <td align="right"> 7.79 </td> </tr>
  <tr> <td> 1_72 </td> <td> ZIP </td> <td align="right">   0 </td> <td align="right"> 292 </td> <td align="right"> 292.11 </td> </tr>
  <tr> <td> 1_72 </td> <td> ZIP </td> <td align="right">   1 </td> <td align="right">   8 </td> <td align="right"> 7.79 </td> </tr>
  <tr> <td> 1_72 </td> <td> ZINB </td> <td align="right">   0 </td> <td align="right"> 292 </td> <td align="right"> 292.11 </td> </tr>
  <tr> <td> 1_72 </td> <td> ZINB </td> <td align="right">   1 </td> <td align="right">   8 </td> <td align="right"> 7.79 </td> </tr>
  <tr> <td> 2_72 </td> <td> Poisson </td> <td align="right">   0 </td> <td align="right"> 299 </td> <td align="right"> 299.03 </td> </tr>
  <tr> <td> 2_72 </td> <td> Poisson </td> <td align="right">   1 </td> <td align="right">   4 </td> <td align="right"> 3.95 </td> </tr>
  <tr> <td> 2_72 </td> <td> NB </td> <td align="right">   0 </td> <td align="right"> 299 </td> <td align="right"> 299.03 </td> </tr>
  <tr> <td> 2_72 </td> <td> NB </td> <td align="right">   1 </td> <td align="right">   4 </td> <td align="right"> 3.95 </td> </tr>
  <tr> <td> 2_72 </td> <td> ZIP </td> <td align="right">   0 </td> <td align="right"> 299 </td> <td align="right"> 299.03 </td> </tr>
  <tr> <td> 2_72 </td> <td> ZIP </td> <td align="right">   1 </td> <td align="right">   4 </td> <td align="right"> 3.95 </td> </tr>
  <tr> <td> 2_72 </td> <td> ZINB </td> <td align="right">   0 </td> <td align="right"> 299 </td> <td align="right"> 299.03 </td> </tr>
  <tr> <td> 2_72 </td> <td> ZINB </td> <td align="right">   1 </td> <td align="right">   4 </td> <td align="right"> 3.95 </td> </tr>
  <tr> <td> 3_72 </td> <td> Poisson </td> <td align="right">   0 </td> <td align="right"> 300 </td> <td align="right"> 300.01 </td> </tr>
  <tr> <td> 3_72 </td> <td> Poisson </td> <td align="right">   1 </td> <td align="right">   3 </td> <td align="right"> 2.97 </td> </tr>
  <tr> <td> 3_72 </td> <td> NB </td> <td align="right">   0 </td> <td align="right"> 300 </td> <td align="right"> 300.01 </td> </tr>
  <tr> <td> 3_72 </td> <td> NB </td> <td align="right">   1 </td> <td align="right">   3 </td> <td align="right"> 2.97 </td> </tr>
  <tr> <td> 3_72 </td> <td> ZIP </td> <td align="right">   0 </td> <td align="right"> 300 </td> <td align="right"> 300.01 </td> </tr>
  <tr> <td> 3_72 </td> <td> ZIP </td> <td align="right">   1 </td> <td align="right">   3 </td> <td align="right"> 2.97 </td> </tr>
  <tr> <td> 3_72 </td> <td> ZINB </td> <td align="right">   0 </td> <td align="right"> 300 </td> <td align="right"> 300.01 </td> </tr>
  <tr> <td> 3_72 </td> <td> ZINB </td> <td align="right">   1 </td> <td align="right">   3 </td> <td align="right"> 2.97 </td> </tr>
  <tr> <td> 4_72 </td> <td> Poisson </td> <td align="right">   0 </td> <td align="right"> 302 </td> <td align="right"> 302.08 </td> </tr>
  <tr> <td> 4_72 </td> <td> Poisson </td> <td align="right">   1 </td> <td align="right">   7 </td> <td align="right"> 6.84 </td> </tr>
  <tr> <td> 4_72 </td> <td> NB </td> <td align="right">   0 </td> <td align="right"> 302 </td> <td align="right"> 302.08 </td> </tr>
  <tr> <td> 4_72 </td> <td> NB </td> <td align="right">   1 </td> <td align="right">   7 </td> <td align="right"> 6.84 </td> </tr>
  <tr> <td> 4_72 </td> <td> ZIP </td> <td align="right">   0 </td> <td align="right"> 302 </td> <td align="right"> 302.08 </td> </tr>
  <tr> <td> 4_72 </td> <td> ZIP </td> <td align="right">   1 </td> <td align="right">   7 </td> <td align="right"> 6.84 </td> </tr>
  <tr> <td> 4_72 </td> <td> ZINB </td> <td align="right">   0 </td> <td align="right"> 302 </td> <td align="right"> 302.08 </td> </tr>
  <tr> <td> 4_72 </td> <td> ZINB </td> <td align="right">   1 </td> <td align="right">   7 </td> <td align="right"> 6.84 </td> </tr>
  <tr> <td> 5_72 </td> <td> Poisson </td> <td align="right">   0 </td> <td align="right"> 317 </td> <td align="right"> 317.02 </td> </tr>
  <tr> <td> 5_72 </td> <td> Poisson </td> <td align="right">   1 </td> <td align="right">   4 </td> <td align="right"> 3.95 </td> </tr>
  <tr> <td> 5_72 </td> <td> NB </td> <td align="right">   0 </td> <td align="right"> 317 </td> <td align="right"> 317.02 </td> </tr>
  <tr> <td> 5_72 </td> <td> NB </td> <td align="right">   1 </td> <td align="right">   4 </td> <td align="right"> 3.95 </td> </tr>
  <tr> <td> 5_72 </td> <td> ZIP </td> <td align="right">   0 </td> <td align="right"> 317 </td> <td align="right"> 317.02 </td> </tr>
  <tr> <td> 5_72 </td> <td> ZIP </td> <td align="right">   1 </td> <td align="right">   4 </td> <td align="right"> 3.95 </td> </tr>
  <tr> <td> 5_72 </td> <td> ZINB </td> <td align="right">   0 </td> <td align="right"> 317 </td> <td align="right"> 317.02 </td> </tr>
  <tr> <td> 5_72 </td> <td> ZINB </td> <td align="right">   1 </td> <td align="right">   4 </td> <td align="right"> 3.95 </td> </tr>
  <tr> <td> 6_72 </td> <td> Poisson </td> <td align="right">   0 </td> <td align="right"> 298 </td> <td align="right"> 297.06 </td> </tr>
  <tr> <td> 6_72 </td> <td> Poisson </td> <td align="right">   1 </td> <td align="right">   4 </td> <td align="right"> 5.88 </td> </tr>
  <tr> <td> 6_72 </td> <td> Poisson </td> <td align="right">   2 </td> <td align="right">   1 </td> <td align="right"> 0.06 </td> </tr>
  <tr> <td> 6_72 </td> <td> NB </td> <td align="right">   0 </td> <td align="right"> 298 </td> <td align="right"> 297.99 </td> </tr>
  <tr> <td> 6_72 </td> <td> NB </td> <td align="right">   1 </td> <td align="right">   4 </td> <td align="right"> 4.22 </td> </tr>
  <tr> <td> 6_72 </td> <td> NB </td> <td align="right">   2 </td> <td align="right">   1 </td> <td align="right"> 0.63 </td> </tr>
  <tr> <td> 6_72 </td> <td> ZIP </td> <td align="right">   0 </td> <td align="right"> 298 </td> <td align="right"> 298.00 </td> </tr>
  <tr> <td> 6_72 </td> <td> ZIP </td> <td align="right">   1 </td> <td align="right">   4 </td> <td align="right"> 4.12 </td> </tr>
  <tr> <td> 6_72 </td> <td> ZIP </td> <td align="right">   2 </td> <td align="right">   1 </td> <td align="right"> 0.78 </td> </tr>
  <tr> <td> 6_72 </td> <td> ZINB </td> <td align="right">   0 </td> <td align="right"> 298 </td> <td align="right"> 298.00 </td> </tr>
  <tr> <td> 6_72 </td> <td> ZINB </td> <td align="right">   1 </td> <td align="right">   4 </td> <td align="right"> 4.12 </td> </tr>
  <tr> <td> 6_72 </td> <td> ZINB </td> <td align="right">   2 </td> <td align="right">   1 </td> <td align="right"> 0.77 </td> </tr>
   </table>

# R Session


```
## R version 3.5.1 (2018-07-02)
## Platform: x86_64-pc-linux-gnu (64-bit)
## Running under: Ubuntu 16.04.5 LTS
## 
## Matrix products: default
## BLAS: /usr/lib/libblas/libblas.so.3.6.0
## LAPACK: /usr/lib/lapack/liblapack.so.3.6.0
## 
## locale:
##  [1] LC_CTYPE=pl_PL.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=pl_PL.UTF-8        LC_COLLATE=pl_PL.UTF-8    
##  [5] LC_MONETARY=pl_PL.UTF-8    LC_MESSAGES=pl_PL.UTF-8   
##  [7] LC_PAPER=pl_PL.UTF-8       LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=pl_PL.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] tools     stats     graphics  grDevices utils     datasets  methods  
## [8] base     
## 
## other attached packages:
##  [1] xtable_1.8-2        knitr_1.20          pbapply_1.3-4      
##  [4] countfitteR_1.0     MASS_7.3-50         ggplot2_3.0.0      
##  [7] pscl_1.5.2          rmarkdown_1.10      reshape2_1.4.3     
## [10] DT_0.4              rhandsontable_0.3.6 shinythemes_1.1.1  
## [13] shiny_1.1.0         devtools_1.13.6    
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.12.17     highr_0.7        bindr_0.1.1      pillar_1.3.0    
##  [5] compiler_3.5.1   later_0.7.3      plyr_1.8.4       digest_0.6.15   
##  [9] jsonlite_1.5     memoise_1.1.0    evaluate_0.11    tibble_1.4.2    
## [13] gtable_0.2.0     pkgconfig_2.0.1  rlang_0.2.1      rstudioapi_0.7  
## [17] crosstalk_1.0.0  yaml_2.1.19      parallel_3.5.1   bindrcpp_0.2.2  
## [21] gridExtra_2.3    dplyr_0.7.6      withr_2.1.2      stringr_1.3.1   
## [25] htmlwidgets_1.2  tidyselect_0.2.4 rprojroot_1.3-2  grid_3.5.1      
## [29] glue_1.3.0       R6_2.2.2         purrr_0.2.5      magrittr_1.5    
## [33] backports_1.1.2  scales_0.5.0     promises_1.0.1   htmltools_0.3.6 
## [37] assertthat_0.2.0 mime_0.5         colorspace_1.3-2 httpuv_1.4.5    
## [41] labeling_0.3     stringi_1.2.3    lazyeval_0.2.1   munsell_0.5.0   
## [45] markdown_0.8     crayon_1.3.4
```

