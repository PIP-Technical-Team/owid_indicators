#' Calculate the poverty gap ratio, or P1 in the Foster-Greer-Thorbecke poverty measure
#'
#' @param poverty_line A numeric value giving the poverty line used - relevant to the welfare measure
#' @param welfare_measure A numeric vector giving the welfare measure used
#' @param weights A numeric vector giving the weights for each observation
#'
#' @return A scalar giving the poverty gap ratio
#' @export
#'
#' @examples
get_poverty_gap_ratio <- function(
    poverty_line,
    welfare_measure,
    weights = rep(1, length(welfare_measure))/length(welfare_measure)
){

    # Poverty gap ratio is P_1, which is just FGT with alpha = 1

    # input checks are the same as in `get_fgt_poverty_measure`
    #   therefore need not give again

    # P_1
    P1 <- get_fgt_poverty_measure(
        1,
        poverty_line = poverty_line,
        welfare_measure = welfare_measure,
        weights = weights
    )

    # Return
    return(P1)


}

