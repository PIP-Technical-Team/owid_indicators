#' Calculate the ratio between the welfare at two chosen percentile
#'
#' @param numerator_perc Numeric argument between 0 and 1 giving the percentile in the numerator
#' @param denominator_perc Numeric argument between 0 and 1 giving the percentile in the denominator
#' @param welfare_measure Numeric vector for which percentile values and subsequent ratio is calculated
#' @param weights Numeric positive vector giving weights for each observation
#'
#' @return A scalar giving the ratio of numerator percentile value to denominator percentile value
#' @export
#'
#' @examples
get_welfare_percentile_ratio <- function(
    numerator_perc,
    denominator_perc,
    welfare_measure,
    weights = rep(1, length(welfare_measure))/length(welfare_measure)
){

    # Input checks - done in functions below
    stopifnot(numerator_perc>=0 & numerator_perc <=1) # is between 0 and 1
    stopifnot(denominator_perc>=0 & denominator_perc <=1) # is between 0 and 1
    stopifnot(is.numeric(numerator_perc))
    stopifnot(is.numeric(denominator_perc))
    stopifnot(weights>0) # must be positive weights
    stopifnot(is.numeric(weights) & is.vector(weights))
    stopifnot(is.numeric(welfare_measure) & is.vector(welfare_measure))
    stopifnot(length(welfare_measure)==length(weights)) # both vectors must be same length
    if(length(weights)==1)warning("the `weights` input should usually be a vector of length>1")
    if(length(welfare_measure)==1)warning("the `welfare_measure` input should usually be a vector of length>1")


    # Order both vectors according to welfare_measure
    order_mat <- matrix( # store two vectors as columns in matrix
        data = c(welfare_measure, weights),
        nrow = length(welfare_measure)
    )
    order_mat <- order_mat[order(order_mat[,1]),] # reorder matrix by welfare_measure
    welfare_measure <- order_mat[,1] # ordered welfare_measure
    weights <- order_mat[,2] # ordered weights

    # Find Numerator Value
    weight_cdf <- cumsum(weights)/sum(weights)                    # find CDF of weights
    num_index <- which.min(abs(weight_cdf - numerator_perc))   # get position closest to F(w) = numerator
    num_perc_welfare <- welfare_measure[num_index]                 # get welfare_measure value corresponding to decile

    # Find Denominator Valu
    denom_index <- which.min(abs(weight_cdf - denominator_perc))   # get position closest to F(w) = numerator
    denom_perc_welfare <- welfare_measure[denom_index]                 # get welfare_measure value corresponding to decile

    # Ratio
    perc_ratio <- num_perc_welfare/denom_perc_welfare

    # return
    return(perc_ratio)





}




