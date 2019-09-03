
# noiris <img src="data-raw/noiris.png" style="margin: 0 auto; width: 10%">

This package is primarily to provide data that is more similar to what
many people would typically come across in the wild, or is simply more
interesting or accessible (in my opinion), and more useful for
instruction and workshops. Far too often examples use `iris`, `mtcars`,
etc. for convenience, but these are actually inconvenient for
demonstrating common data and modeling problems, or are too small to
even be realistic.

This package will provide larger and messier data. The bias is towards
data that could be understood regardless of discipline/background. In
addition, it should have minimally several hundred observations, and
often much larger, but not so large that analysis or data processing
demonstration would take an inordinate amount of time. However, it
should have relatively few columns (unless for demonstration of a ‘large
p’ type of problem/analysis, e.g. penalized regression.).

In general the goals are:

  - Large(-ish) data. At least enough to make analysis and visualization
    interesting.
  - Clean messy data (not a typo). Most of the data is relatively clean,
    but some will have missing values, require text cleaning, etc.
  - Well documented data. All columns will have descriptions (unless
    otherwise not possible), and article references and web sources will
    be provided.
  - Well named data. It can be very annoying if something is called d,
    an author name, an acronym, etc. Columns are also renamed for some
    data sets for clarity.
  - Data that covers common analyses.

## Data

In most cases the data has been cleaned up to make it easier to use and
understand.

Right now it has:

  - `gapminder_2019`: a 2019 pull from
    [gapminder.org/data](http://www.gapminder.org/data/).
      - A nice longitudinal/time-series data set suitable for a wide
        range of standard and more complex mixed models, spatial
        visualization and analyses, etc.
  - `star_wars`: several data sets based on the [Star Wars
    API](https://swapi.co/).
      - Mostly just for fun, but it demonstrates usage of list columns
        and otherwise could be good for demonstrating joins.
  - `instructor_evaluations`: a nice-sized data set for
    mixed/multi-level modeling taken from the `lme4` package.
      - Good for mixed models and similar.
  - `fish`: Number of fish caught on camping trips.
      - An accessible data set useful for demonstrating count models
        including zero-inflated/hurdle models.
  - `pisa`: OECD’s Programme for International Student Assessment with
    international scores for math, science, and reading, covering years
    2000-2015.
      - Potentially good for demonstrating nonlinear relationships
        (e.g. GAM), imputing missing data, longitudinal/spatial
        analyses.
  - `world_happiness`: Multiyear data set with country level scores of
    ‘happiness’. From 2019 World Happiness Report, and includes data
    from 2005-2018.
      - Similar to Gapminder and PISA, this could be used for a variety
        of standard statistical models.
  - `sp500`: Daily S & P 500 data for a 10 year period covering +- 5
    years before and after the Great Recession low.
      - Good for time series and related analyses. Includes industry
        classifications.
  - `wine_reviews`, `wine_quality`: Two data sets regarding wine reviews
    that can be used for a wide range of standard statistical and
    machine learning.
      - Can be used for standard regression and classification, ordinal
        regression, text analysis, sentiment analysis.
  - `google_apps`: Ratings and other information for Google Play Store
    apps.
      - Text & sentiment analysis, standard regression, etc.
  - `fashion_train`, `fasion_test`: The ‘Fashion MNIST’. Image data for
    clothing items.
      - Image classification, cluster analysis
  - `gender_gap`, `gender_gap_2018`: Country level data regarding the
    World Bank Gender Gap Index.
      - Longitudinal analysis, geospatial analysis, etc.
  - `kiva`: Lending information from kiva.org online crowdfunding
    platform.
      - econometric, geospatial, multilevel, etc.
  - `water_risk`, `water_risk_province`: Country and province level data
    regarding water risk.
      - geospatial analysis and visualization
  - `big_five`: Big Five personality traits.
      - scale reliability, factor analysis, item response theory,
        structural equation modeling.
  - `heart_disease`: The UCI heart disease data.
      - survival, classification.
  - `retirement`: Data on retirement plan participation rate of
    employees.
      - binomial glm, fractional regression, beta regression.
  - `movielens`: 1 million samples from MovieLens data.
      - recommendation systems, item response theory, cluster analysis,
        etc.

## Installation

This package is not on CRAN. To install:

``` r
devtools::install_github('m-clark/noiris')
```

## Other

To do:

  - \[X\] Data for basic classification
  - \[X\] Data for basic machine learning (regression and
    classification)
  - \[X\] Data for text analysis (more to come)
  - \[X\] Data for image classification
  - \[X\] Data for survival analysis
  - \[X\] Data for factor analysis/SEM (PCA?)
  - \[X\] Data on the unit interval suitable for binomial, beta
    regression, etc.
  - \[X\] Data for non-obvious cluster analysis (no iris\! and no old
    faithful either\!).
  - \[ \] Data for network/graphical models and visualization.

Note to self, see flexmix, poLCA, and other packages. Maybe add classic
biochemists for another count data set. Article pub for link models and
related.
