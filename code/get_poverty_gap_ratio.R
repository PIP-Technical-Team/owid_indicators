### get_poverty_gap_ratio ###


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

