### get_gini ###


get_gini <- function(
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

    # Order both vectors according to welfare_measure
    order_mat <- matrix( # store two vectors as columns in matrix
        data = c(welfare_measure, weights),
        nrow = length(welfare_measure)
    )
    order_mat <- order_mat[order(order_mat[,1]),] # reorder matrix by welfare_measure
    welfare_measure <- order_mat[,1] # ordered welfare_measure
    weights <- order_mat[,2] # ordered weights

    # Curves
    cum_norm_weights <- cumsum(weights)/sum(weights)
    cum_norm_welfare <- cumsum(welfare_measure)/sum(welfare_measure)

    # Areas
    area_AB <- sum(cum_norm_weights)
    area_B <- sum(cum_norm_welfare)
    area_A <- area_AB - area_B

    # Gini
    gini <- area_A/area_AB

    # Return
    return(gini)

}




