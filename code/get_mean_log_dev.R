### get_mean_log_dev ###


get_mean_log_dev <- function(
    welfare_measure,
    weights = rep(1, length(welfare_measure))/length(welfare_measure)
){

    # Argument Checks
    stopifnot(weights>0) # must be positive weights
    stopifnot(is.numeric(weights) & is.vector(weights))
    stopifnot(is.numeric(welfare_measure) & is.vector(welfare_measure))
    stopifnot(length(welfare_measure)==length(weights)) # both vectors must be same length
    if(length(weights)==1)warning("the `weights` input should usually be a vector of length>1")
    if(length(welfare_measure)==1)warning("the `welfare_measure` input should usually be a vector of length>1")

    # weighted mean welfare
    w_mean_welfare <- weighted.mean(
        x = welfare_measure,
        w = weights
    )

    # sum of weights
    sum_weights <- sum(weights)

    # mean log deviation
    mld <- (1/sum_weights)*sum(weights*(log(w_mean_welfare) - log(welfare_measure)))

    # return
    return(mld)




}

