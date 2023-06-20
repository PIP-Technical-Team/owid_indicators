### get_decile_welfare_share ###


get_decile_welfare_share <- function(
    decile = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
    welfare_measure,
    weights = rep(1, length(welfare_measure))/length(welfare_measure)
){
    # Argument Checks
    stopifnot(decile %in% c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10))
    stopifnot(is.numeric(decile))
    stopifnot(weights>0) # must be a positive percentage
    stopifnot(is.numeric(welfare_measure) & is.vector(welfare_measure))
    stopifnot(is.numeric(weights) & is.vector(weights))
    stopifnot(length(weights)==length(welfare_measure)) # both vectors must be same length
    if(length(weights)==1)warning("the `weights` input should usually be a vector of length>1")
    if(length(welfare_measure)==1)warning("the `welfare_measure` input should usually be a vector of length>1")

    # get the correct welfare interval
    chosen_decile_welfare <- get_decile_welfare(
        decile = decile,
        input_vec = welfare_measure,
        weight_vec = weights
    )
    lower_decile_welfare <- get_decile_welfare(
        decile = decile-1,
        input_vec = welfare_measure,
        weight_vec = weights
    )

    # Matrix with welfare and weights
    total_welfare <- matrix( # get welfare and weights in a matrix
        data = c(welfare_measure, weights),
        ncol = 2
    )
    # Matrix with chosen decile welfare and weights
    decile_welfare <- total_welfare[ # keep only rows within chosen decile
        which(total_welfare[,1] > lower_decile_welfare & # rows with welfare greater than lower decile welfare
                  total_welfare[,1] <= chosen_decile_welfare), # and rows with welfare leq chosen decile welfare

    ]
    # Get the decile total welfare
    decile_total <- weighted.mean( # weighted mean
        x = decile_welfare[ , 1], # welfare_measure within chosen decile
        w = decile_welfare[ , 2]  # weights within chosen decile
    )*sum(
        decile_welfare[,2]
    )
    # Get population total welfare
    population_total <- weighted.mean( # weighted mean
        x = total_welfare[ , 1], # welfare_measure within chosen decile
        w = total_welfare[ , 2]  # weights within chosen decile
    )*sum(
        total_welfare[,2]
    )

    # Get Decile Welfare as share of Total Welfare
    decile_share <- decile_total/population_total


    # Return
    return(decile_share)


}
