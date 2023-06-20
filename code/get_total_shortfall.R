### get_total_shortfall ###


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


