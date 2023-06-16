### get_poverty_headcount_ratio ###

get_poverty_headcount_ratio <- function(
    poverty_line, welfare_measure, weights
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


