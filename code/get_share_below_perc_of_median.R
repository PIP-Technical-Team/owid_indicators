### get_share_below_perc_of_median ###


get_share_below_perc_of_median <- function(
    percentage,
    welfare_measure,
    weights = rep(1, length(welfare_measure))/length(welfare_measure)
){
    # Argument Checks
    stopifnot(percentage>0) # must be a positive percentage
    stopifnot(is.numeric(percentage) & is.vector(percentage))
    stopifnot(is.numeric(welfare_measure) & is.vector(welfare_measure))
    stopifnot(is.numeric(weights) & is.vector(weights))
    stopifnot(length(weights)==length(welfare_measure)) # both vectors must be same length
    if(length(weights)==1)warning("the `weights` input should usually be a vector of length>1")
    if(length(welfare_measure)==1)warning("the `welfare_measure` input should usually be a vector of length>1")

    #  Weighted Median welfare
    median_welfare <- get_weighted_median(
        input_vec = welfare_measure,
        weight_vec = weights
    )

    # Percentage of median
    percent_of_median <- percentage*median_welfare

    # Get share below threshold
    share_below_threshold <- get_poverty_headcount_ratio(
        poverty_line = percent_of_median,
        welfare_measure = welfare_measure,
        weights = weights
    )

    # Return
    return(share_below_threshold)


}


