#' Calculate the poverty headcount ratio, or P0 in the Foster-Greer-Thorbecke poverty measure
#'
#' @param poverty_line Scalar giving chosen poverty line, in the same units as the welfare measure
#' @param welfare_measure Numeric vector giving welfare for each observation
#' @param weights Numeric vector giving weights for each observation
#'
#' @return Scalar giving the poverty headcount ratio
#' @export
#'
#' @examples
get_poverty_headcount_ratio <- function(
    poverty_line,
    welfare_measure,
    weights = rep(1, length(welfare_measure))/length(welfare_measure)
){
    # Note, poverty headcount ratio is FGT with alpha = 0

    # input checks are the same as in `get_fgt_poverty_measure`
    #   therefore need not give again

    # Find FGT with alpha = 0
    headcount_ratio <- get_fgt_poverty_measure(
        alpha = 0, # set equal to 0
        poverty_line = poverty_line,
        welfare_measure = welfare_measure,
        weights = weights
    )

    # return
    return(headcount_ratio)

}


