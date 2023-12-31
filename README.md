---
editor_options: 
  markdown: 
    wrap: 72
---

# owid_indicators

This is a repo to create the functions for the Our World In Data (OWID)
indicators.

## Indicators

### Consolidated Indicators

The FGT poverty measure, indexed by $\alpha$, is found by:

$$P_{\alpha} = \frac{1}{n}\Sigma^{q}_{i=1} w_i \left( \frac{z-y_i}{z} \right)^{\alpha}$$

Also, let $n$ be the total size of the population, while $n_p$ is the
total poor (at relevant poverty line), $z$ is the relevant, specified
poverty line, $y_i$ is the welfare measure for observation $i$, $w_i$ is
the relevant survey weights.

The following measures are calculated in separate functions, each in
their own scripts found in `/code`. The structure of each numbered point
is:

-   Indicator name - calculation - function_name

1.  Foster-Greer-Thorbecke (FGT) poverty indices - $P_{\alpha}$ as
    above - get_fgt_poverty_measure
2.  Headcount ratio - $P_{0}$ - get_poverty_headcount_ratio
3.  Number of people living below \$x - $P_{0} \times n$ at specified
    threshold - get_number_below_threshold
4.  Average shortfall (for the poor) -
    $P_1 \times z \times \frac{n}{n_p} = \frac{P_1}{P_0}$ -
    get_average_shortfall
5.  Total shortfall - $n \times P_1$ - get_total_shortfall
6.  Income gap ratio - $P_1 \times \frac{n}{n_p} = \frac{P_1}{P_0}$
7.  Poverty gap ratio - $P_{1}$
8.  Share of population living below \x% of the median
9.  Mean - get_decile_mean
10. Median - get_decile_median
11. Decile average (mean for decile), share (proportion of the entire
    pop), level (level below which entire decile falls) -
    get_decile_welfare
12. Decile welfare share (proportion of the entire pop), level (level
    below which entire decile falls)
13. Decile level (level below which entire decile falls)
14. Percentile ratio (pX/pY), default Palma p10/p90
15. Gini
16. MLD
17. Wolfson polarization index

Additional functions: get_weighted_median

#### Categorization of Indicators

Inputs - Welfare & weights - Poverty line - Additional arguments

Outputs - Ratio/percentage - Count

Metric/use (recommended) - poverty measures (FGT, headcount, poverty
gap, income gap, average shortfall, total shortfall, number below
threshold) - inequality (gini, MLD, percentile ratio, decile welfare
share) - summary (decile mean/median/threshold)

### PowerPoint

The indicators according to slide 2 of the PowerPoint in
*/bin/indicators_needed/OWID_Key_Indicators.pptx* requested are as
follows: 1. Headcount ratio 2. Number of people living below \$x 3.
Average Shortfall 4. Total Shortfall 5. Income gap ratio 6. Poverty gap
index 7. Mean 8. Median 10. Deciles 1-10 (average, share, threshold) 11.
Gini 12. MLD- get_mean_log_dev -
$\frac{1}{\Sigma^N_{i=1} w_i} \Sigma^N_{i=1} w_i (ln\bar{x} - ln x_i)$,
where $\bar{x}$ is weighted mean 13. Polarization index (Wolfson
polarization index) 14. Palma ratio (P10/P90) 15. Share total income
P20/P80, P10/P90, P50/P90, P10/P50

Average shortfall: average shortfall from the poverty line (averaged
across the population in poverty). Total shortfall: total amount of
money that would be theoretically needed to lift the incomes or
expenditure of all people in poverty up to the poverty line (w/out
considering behavioral response). Income gap ratio: average shortfall
from the poverty line (averaged across the population in poverty)
expressed as a share of the poverty line. Poverty gap index: mean
shortfall of the total population from the poverty line counting the
non-poor as having zero shortfall and expressed as a percentage of the
poverty line. For those below the poverty line, the shortfall
corresponds to the amount of money required in order to reach the
poverty line. For those at or above the poverty line, the shortfall is
counted as zero. The average shortfall is then calculated across the
total population -- both poor and non-poor -- and then expressed as a
share of the poverty line.

Decile Measures: Average: mean income or expenditure per day within the
decile. Share: income or expenditure of the nth decile (tenth of the
population) as a share of total income or expenditure. Level: level of
income or expenditure per day below which nth decile of the population
falls.

### Excel

The following are requested in the */bin/indicators_needed/OWID Key
Indicators.xlsx* file

1.  Headcount below poverty line ( USD2.15, USD3.65, USD6.85)
2.  Number of poor by different thresholds
3.  Correlation between monetary poverty and multidimensional poverty
4.  Median income per person per day 2019
5.  Share of the population living on less than USD1 per day
6.  Daily GDP per capita vs mean income or expenditure per day
7.  Level of income: top 10% vs bottom 10% global 1990-2019
8.  National poverty line
9.  P90 vs P10 of income/consumption distribution, 1967-2019
10. Share of population living on less than \$10 per day
11. Share below x% of the median
12. Share of population in multidimensional poverty: urban vs rural
13. Share of population living in poverty at national poverty lines
