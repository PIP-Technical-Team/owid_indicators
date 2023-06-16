### get_number_below_threshold ###


get_number_below_threshold <- function(
    threshold, welfare_measure, weights
){
    # = headcount ratio multiplied by total population
    # Note, poverty headcount ratio is FGT with alpha = 0

    # input checks are the same as in `get_fgt_poverty_measure`
    #   therefore need not give again

    # Find FGT with alpha = 0
    headcount_ratio <- get_poverty_headcount_ratio(
        poverty_line = threshold,
        welfare_measure = welfare_measure,
        weights = weights
    )

    # Total Population
    n <- length(welfare_measure) # because each individual gets welfare observation

    # Population below threshold
    number_below_threshold <- n*headcount_ratio

    # return
    return(number_below_threshold)


}

