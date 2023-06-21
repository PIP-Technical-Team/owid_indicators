#' Calculate the income gap ratio i.e. the ratio - total diff between welfare and pov line for the poor : pov line - per population
#'
#' @param poverty_line A numeric value giving the poverty line used - relevant to the welfare measure
#' @param welfare_measure A numeric vector giving the welfare measure used
#' @param weights A numeric vector giving the weights for each observation
#'
#' @return A scalar giving the income gap ratio
#' @export
#'
#' @examples
get_income_gap_ratio <- function(
    poverty_line,
    welfare_measure,
    weights = rep(1, length(welfare_measure))/length(welfare_measure)
){

    # = P_1/P_0
    # Note, P_1 is FGT with alpha = 1, P_0 is FGT with alpha = 0
    # i.e. the ratio (total diff between welfare and pov line for the poor : pov line) per population

    # input checks are the same as in `get_fgt_poverty_measure`
    #   therefore need not give again

    # P_0
    P0 <- get_fgt_poverty_measure(
        0,
        poverty_line = poverty_line,
        welfare_measure = welfare_measure,
        weights = weights
    )

    # P_1
    P1 <- get_fgt_poverty_measure(
        1,
        poverty_line = poverty_line,
        welfare_measure = welfare_measure,
        weights = weights
    )

    # Income Gap Ratio
    income_gap_ratio <- P1/P0

    # Return
    return(income_gap_ratio)


}

