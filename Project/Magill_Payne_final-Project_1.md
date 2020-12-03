490 Project
================

## Our goal is to compare Knox and Davidson counties Death and Covid growth to the timing of students from UTK and Vanderbilt Returning on Campus.

Since Vanderbilt is smaller than UTK, we’ll include dates of other
colleges opening in Nashville/Davidson County as well

``` r
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(tidyverse)
```

    ## ── Attaching packages ─────────── tidyverse 1.3.0 ──

    ## ✓ ggplot2 3.3.2     ✓ purrr   0.3.4
    ## ✓ tibble  3.0.3     ✓ stringr 1.4.0
    ## ✓ tidyr   1.1.2     ✓ forcats 0.5.0
    ## ✓ readr   1.3.1

    ## ── Conflicts ────────────── tidyverse_conflicts() ──
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
library(readr)
```

## Raw US County Covid data from NYTIMES

``` r
raw_data<- read.csv("https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv")
```

## Extracting Davidson and Knox Counties from Raw County Data

``` r
### Knox County
Knox_co <- filter(raw_data, county == "Knox", state == "Tennessee")
glimpse(Knox_co)
```

    ## Rows: 266
    ## Columns: 6
    ## $ date   <chr> "2020-03-12", "2020-03-13", "2020-03-14", "2020-03-15", "2020-…
    ## $ county <chr> "Knox", "Knox", "Knox", "Knox", "Knox", "Knox", "Knox", "Knox"…
    ## $ state  <chr> "Tennessee", "Tennessee", "Tennessee", "Tennessee", "Tennessee…
    ## $ fips   <int> 47093, 47093, 47093, 47093, 47093, 47093, 47093, 47093, 47093,…
    ## $ cases  <int> 1, 1, 1, 1, 1, 2, 2, 2, 3, 4, 5, 5, 15, 20, 26, 31, 33, 38, 52…
    ## $ deaths <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,…

``` r
### Davidson County
Davidson_co <- filter(raw_data, county == "Davidson", state == "Tennessee")
```

``` r
Vandy_raw <- read.csv("https://raw.githubusercontent.com/MaiPay/reproducible_data_analysis/master/Project/Live%20COVID%20Chart%20VU%20-%20Dashboard%20Charts.csv")
```

\#insert Vandy data here maybe? if necessary

## Deaths with Cases Regression

``` r
knox_dc <- lm(deaths~cases, data = Knox_co)
summary(knox_dc)
```

    ## 
    ## Call:
    ## lm(formula = deaths ~ cases, data = Knox_co)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -7.0395 -2.3481 -0.1744  1.7733 14.8499 
    ## 
    ## Coefficients:
    ##              Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) 0.9138883  0.2810389   3.252   0.0013 ** 
    ## cases       0.0079935  0.0000351 227.707   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 3.372 on 264 degrees of freedom
    ## Multiple R-squared:  0.9949, Adjusted R-squared:  0.9949 
    ## F-statistic: 5.185e+04 on 1 and 264 DF,  p-value: < 2.2e-16

``` r
davidson_dc <- lm(deaths~cases, data= Knox_co)
summary(davidson_dc)
```

    ## 
    ## Call:
    ## lm(formula = deaths ~ cases, data = Knox_co)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -7.0395 -2.3481 -0.1744  1.7733 14.8499 
    ## 
    ## Coefficients:
    ##              Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept) 0.9138883  0.2810389   3.252   0.0013 ** 
    ## cases       0.0079935  0.0000351 227.707   <2e-16 ***
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 3.372 on 264 degrees of freedom
    ## Multiple R-squared:  0.9949, Adjusted R-squared:  0.9949 
    ## F-statistic: 5.185e+04 on 1 and 264 DF,  p-value: < 2.2e-16

## Knox County Plot of Deaths vs Cases

The orange rectangle represents the time that students were on campus
from August 19, 2020 to November 24, 2020

The points and the linear regression align, but there was a jump in
cases of nearly 2500 when the students returned to campus. Towards the
end of the graph, the actual amount of deaths and cases are less than
predicted by the regression

``` r
Kgraph <- ggplot(Knox_co, aes(x=deaths, y=cases))+geom_point(aes(x=deaths, y = cases)) + geom_smooth(method = lm, se = FALSE) + ggtitle("COVID Deaths vs Cases in Knox County")+ annotate("rect", xmin = 52, xmax= 153, ymin = 5731, ymax= 18191, alpha =.2, color = "orange")


print(Kgraph)
```

    ## `geom_smooth()` using formula 'y ~ x'

![](Magill_Payne_final-Project_1_files/figure-gfm/unnamed-chunk-6-1.png)<!-- -->

## Davidson County Plot of Deaths vs Cases

The black rectangle represents the time students were on Vanderbilt
University’s campus from August 24, 2020 to November 24, 2020.

The red rectangle represents the time students were on Belmont
University’s campus from August 19, 2020 to November 13, 2020.

The blue rectangle represents the time students were on Tennessee State
University’s Campus from August 31, 2020 to November 20, 2020.

``` r
Dgraph <- ggplot(Davidson_co, aes(x=deaths, y=cases))+geom_point(aes(x=deaths, y = cases)) + geom_smooth(method = lm, se = FALSE) + ggtitle("COVID Deaths vs Cases in Davidson County")+ annotate("rect", xmin = 246, xmax= 409, ymin = 25326, ymax= 43920, alpha =.2, color = "black") + annotate("rect", xmin = 235, xmax= 379, ymin = 24696, ymax= 39101, alpha =.2, color = "red") + annotate("rect", xmin = 259, xmax= 399, ymin = 25975, ymax= 42262, alpha =.2, color = "blue") 


print(Dgraph)
```

    ## `geom_smooth()` using formula 'y ~ x'

![](Magill_Payne_final-Project_1_files/figure-gfm/unnamed-chunk-7-1.png)<!-- -->

It seems that the presence of college students on three major
universities in the Nashville Metropolitan area had little effect on the
trend of Covid cases in Davidson County. We did multiple universities to
try to account for the population difference with UTK, but many of these
campuses had more limits on the amount of people allowed on campus.
Also, there were more online classes offered.
