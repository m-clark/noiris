
# noiris

This package is primarily to provide data that is more relevant to
actual data people would typically come across in the wild, or is simply
more interesting or accessible, at least to me, and especially for
instruction and workshops. Far too often examples use iris, mtcars, etc.
for convenience, but these actually are inconvenient for demonstrating
real data and modeling problems, or are too small to even be realistic.
This package will provide larger and at some point messier data.

Right now it has:

  - `gapminder`: a 2019 pull from
    [gapminder.org/data](http://www.gapminder.org/data/). A nice
    longitudinal/time-series data set.
  - `star_wars`: several data sets based on the [Star Wars
    API](https://swapi.co/). Just for fun.
  - `insteval`: a nice-sized data set for mixed/multi-level modeling
    taken from the `lme4` package.
  - `fish`: an accessible data set useful for demonstrating count and
    zero-inflated models.
