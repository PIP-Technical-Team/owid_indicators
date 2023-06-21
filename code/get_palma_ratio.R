#' Calculate the Palma ratio - 90th percentile in the numerator, 40th percentile in denominator
#'
#' @param welfare_measure A numeric vector for which the Palma ratio is calculated
#' @param weights Numeric positive vector giving weights for each observation
#'
#' @return A scalar giving the Palma ratio
#' @export
#'
#' @examples
get_palma_ratio <- function(
    welfare_measure,
    weights = rep(1, length(welfare_measure))/length(welfare_measure)
){
    # Argument checks done in functions below

    # Palma ratio has 90th percentile welfare in numerator
    #   and 40th percentile welfare in denominator

    # get palma
    palma_ratio <- get_welfare_percentile_ratio(
        numerator_perc = 0.9,
        denominator_perc = 0.4,
        welfare_measure = welfare_measure,
        weights = weights
    )

    # Return
    return(palma_ratio)


}

