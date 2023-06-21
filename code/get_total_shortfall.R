#' Calculate the total shortfall - i.e. the total needed of welfare measure to theoretically lift all people up to the poverty line
#'
#' @param poverty_line A numeric value giving the poverty line used - relevant to the welfare measure
#' @param welfare_measure A numeric vector giving the welfare measure used
#' @param weights A numeric vector giving the weights for each observation
#'
#' @return Scalar giving the total shortfall
#' @export
#'
#' @examples
get_total_shortfall <- function(
    poverty_line,
    welfare_measure,
    weights = rep(1, length(welfare_measure))/length(welfare_measure)
){


    # = P_1 multiplied by n and z
    # Note, P_1 is FGT with alpha = 1, n is total pop, z is poverty line
    # i.e. the total distance from the poverty line across entire population

    # input checks are the same as in `get_fgt_poverty_measure`
    #   therefore need not give again

    # Get P_1
    P1 <- get_fgt_poverty_measure(
        1,
        poverty_line = poverty_line,
        welfare_measure = welfare_measure,
        weights = weights
    )

    # Population size
    n <- length(welfare_measure)

    # Calculate average shortfall
    total_shortfall <- n*P1*poverty_line

    # Return
    return(total_shortfall)

}


