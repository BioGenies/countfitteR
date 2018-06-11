---
output:
  html_document:
    self_contained: no
    theme: cerulean
    toc: yes
  word_document:
    toc: yes
---

# **countfitteR**

## General tips

### Charts
Each chart may be saved in the .svg format. A download button is always located at the top of a chart. 

### Tables
Tables may be downloaded in a specified format or printed using the buttons at the top of the table.

## Data upload

The data format suitable for upload is the .csv document, where a single column corresponds to a single count. Use raw counts instead a pivot table. If your document does not have headers, specify it using the "Header" checkbox. In this case, **countfitter** will automatically name your counts with the index number of a count prefixed by 'C'.  

## Count data

This panel contains descriptive statistics and summaries of the input data. It consists of three subpanels:  
1. *Count table*: the input dataset in the tabular format allowing sanity checks and manual modification.
2. *Summary*: summary statistics of the input data (respectively mean, standard deviation, median, median absolute deviate, minimum, maximum, number of elements).  
3. *Distribution*: a bar chart of the counts distribution followed by a pivot table.  

## Fitted models

1. *Mean value estimates*: the estimated value of mean ($\lambda$) and its confidence intervals. The BIC indicates the most appropriate distribution.    
2. *Coefficients*: coefficients of fitted models. 
3. *Decision*: the most appropriate model and the strength of the evidence (Kass and Raftery, 1995).

## Compare distributions

The bar charts represent theoretical counts depending on the chosen distribution. Red dots describe the real number of counts. The visualized data is also available in the tabular format.

## Settings

**Separate experiments**: if this checkbox is marked, the **countfitter** assumes that experiments are separate and fits the distribution to each individually and independently. Otherwise, all counts are simultaneously fitted to a single model. It is more appropriate for situations, where there is assumption that all samples may be describe by the same distribution, for example in case of technical replicates.  

**Confidence level**: the confidence level of confidence intervals.  

**Count distributions**: count distributions fitted to data: Poisson, Negative Binomial, Zero-Inflated Poisson, Zero-Inflated Negative Binomial. Possible distributions are described further in the manual.  

# Overdispersion

One of the important features of the Poisson distribution is the equality of variance and expected value. Although count data is commonly assumed to be Poisson-distributed, we often encounter overdispersed datasets, when the variance is bigger than the mean. Three distributions included in **countfitter**: Zero-Inflated Poisson (ZIP), Negative Binomial (NB) and Zero-negative Binomial (ZINB) model overdispersed counts. 

Overdispersion may be caused by the increased variability of counts, for example when a counting algorithm under- and overcounts. In such situation the data might have the NB distribution. The other cause of overdispersion is called zero-inflation and occurs in datasets, where some factor introduced faulty zeros. That means that some counts, regardless of their real state, are treated as zeros. In this case, data has the ZIP distribution. If both faulty zeros and increased variance affect the data, the ZINB distribution is the most appropriate.  

## Overdispersed count data distributions

Parameters:

* $\lambda$ - Poisson parameter (average number of foci per cell).  
* $r$ - zero inflation (fraction of cells treated by system as having no foci regardless of their real state).  
* $\theta$ - dispersion parameter.
  
Usually the NB distribution is parameterized using $\mu$ and $\theta$, but to make comparison clearer, we use $\lambda$ instead of $\mu$. In this parameterization, NB and ZINB are treated as the mixture of Poisson and Gamma ($\Gamma$) distributions.  

Distribution <br> name  | pmf 
-------------------|-------------
Poisson            |$$P\{X = k\} = \frac{\lambda^k \exp^{-\lambda}}{k!} $$
Zero-inflated Poisson                |$$P\{X = k\} = \begin{cases} r + ( 1- r) \exp^{-\lambda},\text{if } k = 0\\ r \frac{\lambda^k \exp^{-\lambda}}{k!},\text{if } k = 1, 2, \ldots \end{cases} $$
Negative Binomial                 |$$P\{X = k\} = \frac{\Gamma (\theta + k)}{\Gamma(\theta) k!}  \left(\left( \frac{\theta}{\theta + \lambda} \right)^\theta \left( \frac{\lambda}{\theta + \lambda} \right) \right)^k$$
Zero-inflated Negative Binomial               |$$P\{X = k\} = \begin{cases}r + (1 - r) \left( \frac{\theta}{\theta + \lambda} \right)^\theta,\text{if } k = 0\\(1 - r) \frac{\Gamma (\theta + k)}{\Gamma(\theta) k!}  \left(\left( \frac{\theta}{\theta + \lambda} \right)^\theta \left( \frac{\lambda}{\theta + \lambda} \right) \right)^k,\text{if } k = 1, 2, \ldots\end{cases}$$

Poisson and Negative Binomial distributions have the same expected value. In case of ZIP and ZINB, the expected value is smaller than the real average number of foci per cell.

Distribution <br> name  | Expected value
-------------------|-------------
Poisson            |$$E(X) = \lambda $$
ZIP                |$$E(X) = (1 - r) \lambda $$
NB                 |$$E(X) = \lambda $$
ZINB               |$$E(X) = (1 - r)  \lambda $$  <!-- keep it here, because otherwise table parse oddly  -->

Depending on the value of $r$ the variance of ZIP and ZINB may be smaller or bigger than the variance of Poisson distribution. In case of the NB distribution, the variance is always bigger than for the Poisson distribution, although the difference becomes negligible, when the $\theta$ is much bigger than $\lambda^2$.

Distribution <br> name  | Variance
-------------------|-------------
Poisson            |$$\textrm{var}(X) = \lambda $$
ZIP                |$$\textrm{var}(X) = \lambda (1 - r)(1 + \lambda r)$$
NB                 |$$\textrm{var}(X) = \lambda + \frac{\lambda^2}{\theta} $$
ZINB               |$$\textrm{var}(X) = (1 - r) \lambda \left( 1 + r\lambda  + \frac{1}{\theta} \right)$$

 
