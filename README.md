
# noiris <img src="data-raw/noiris.png" style="margin: 0 auto; width: 10%">

This package is primarily to provide data that is more similar to data
people would typically come across in the wild, or is simply more
interesting or accessible (in my opinion), and more useful for
instruction and workshops. Far too often examples use `iris`, `mtcars`,
etc. for convenience, but these are actually inconvenient for
demonstrating real data and modeling problems, or are too small to even
be realistic.

This package will provide larger and at some point messier data. The
bias is towards data that could be understood regardless of
discipline/background. In addition, it should have minimally several
hundred observations, and often much larger, but not so large that
analysis or data processing demonstration would take an inordinate
amount of time. However, it should have relatively few columns (unless
for demonstration of a ‘large p’ type of problem/analysis,
e.g. penalized regression.).

Some of the data comes from elsewhere, but has been cleaned up to make
it easier to use and understand.

Right now it has:

  - `gapminder`: a 2019 pull from
    [gapminder.org/data](http://www.gapminder.org/data/). A nice
    longitudinal/time-series data set.
  - `star_wars`: several data sets based on the [Star Wars
    API](https://swapi.co/). Just for fun. It demonstrates usage of list
    columns and otherwise could be good for demonstrating joins.
  - `instructor_evaluations`: a nice-sized data set for
    mixed/multi-level modeling taken from the `lme4` package.
  - `fish`: an accessible data set useful for demonstrating count and
    zero-inflated/hurdle models.
  - `pisa`: OECD’s Programme for International Student Assessment with
    international scores for math, science, and reading. Potentially
    good for demonstrating nonlinear relationships, imputing missing
    data, longitudinal analyses.

incoming: world happiness report, wine ratings?

To do:

  - \[ \] Data for classification
  - \[ \] Data for text analysis
  - \[ \] Data for image classification
  - \[ \] Data for survival analysis
