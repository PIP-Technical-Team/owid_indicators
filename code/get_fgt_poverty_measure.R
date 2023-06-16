### get_fgt_poverty_measure ###

get_fgt_poverty_measure <- function(
    alpha, poverty_line, welfare_measure, weights
){
    # do argument checks - all numeric, weights & welfare measure should be vectors
    stopifnot(is.numeric(alpha) & is.vector(alpha))
    stopifnot(is.numeric(poverty_line) & is.vector(poverty_line))
    stopifnot(is.numeric(welfare_measure) & is.vector(welfare_measure))
    stopifnot(is.numeric(weights) & is.vector(weights))
    stopifnot(length(weights)==length(welfare_measure)) # both vectors must be same length
    if(length(weights)=1)warning("the `weights` input should usually be a vector of length>1")
    if(length(welfare_measure)=1)warning("the `welfare_measure` input should usually be a vector of length>1")

    # n - Population size
    n <- length(welfare_measure) # number of observations (individuals/households)

    # Create the FGT measure through intermediate objects
    fgt_measure <- poverty_line - welfare_measure   # diff between poverty line and welfare measure
    fgt_measure <- fgt_measure/poverty_line         # divide by poverty line to standardize
    fgt_measure <- fgt_measure^alpha                # exponent of the the standardized term: ((poverty_line-welfare)/poverty_line)
    fgt_measure <- weights*(fgt_measure)            # weights for each observation
    fgt_measure <- fgt_measure[poverty_line-welfare_measure>=0] # only sum observations w welfare at or below poverty line
    fgt_measure <- fgt_measure/n                    # divide by full population size
    fgt_measure <- sum(fgt_measure)

    # Return
    return(fgt_measure)

}


get_fgt_poverty_measure(
    alpha = 3, poverty_line = 10, welfare_measure = sample(x = seq(from = 0, to = 20, by = 0.1), prob = rep(1/201, 201)), weights = rep(1)
)









