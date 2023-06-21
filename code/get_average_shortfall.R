#' Calculate the average shortfall from the poverty line, averaged across the population below the poverty line
#'
#' @param poverty_line A numeric value giving the poverty line used - relevant to the welfare measure
#' @param welfare_measure A numeric vector giving the welfare measure used
#' @param weights A numeric vector giving the weights for each observation
#'
#' @return Scalar giving the average shortfall
#' @export
#'
#' @examples
get_average_shortfall <- function(
    poverty_line,
    welfare_measure,
    weights = rep(1, length(welfare_measure))/length(welfare_measure)
){

    # = poverty_line*P_1 multiplied by total population size and divided by total size of poor population
    # = poverty_line*P_1/P_0, because P_0 = n_p/n
    # Note, P_1 is FGT with alpha = 1
    # i.e. the average distance from poverty line for the poor

    # input checks are the same as in `get_fgt_poverty_measure`
    #   therefore need not give again

    # Get P_0
    P0 <- get_fgt_poverty_measure(
        0,
        poverty_line = poverty_line,
        welfare_measure = welfare_measure,
        weights = weights
    )

    # Get P_1
    P1 <- get_fgt_poverty_measure(
        1,
        poverty_line = poverty_line,
        welfare_measure = welfare_measure,
        weights = weights
    )

    # Calculate average shortfall
    av_shortfall <- poverty_line*P1/P0

    # Return
    return(av_shortfall)


}




