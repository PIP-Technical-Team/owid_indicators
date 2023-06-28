


get_hl_number_poor <- function(headcount, pop){

    # Input checks
    stopifnot(is.numeric(headcount) & is.vector(headcount)) # numeric vector
    stopifnot(is.numeric(pop) & is.vector(pop)) # numeric vector
    stopifnot(length(headcount) == length(pop)) # vectors of same length

    # Number of poor
    np <- headcount*pop

    # Return
    return(np)

}





get_hl_average_shortfall <- function(headcount, povgap, povline){

    # Input checks
    stopifnot(is.numeric(headcount) & is.vector(headcount)) # numeric vector
    stopifnot(is.numeric(povgap) & is.vector(povgap)) # numeric vector
    stopifnot(is.numeric(povline) & is.vector(povline)) # numeric vector
    stopifnot(length(headcount) == length(povline)) # vectors of same length
    stopifnot(length(headcount) == length(povgap)) # vectors of same length

    # Average Shortfall
    av_sf <- povline*povgap/headcount # z times P1/P0

    # Return
    return(av_sf)

}

get_hl_average_shortfall(headcount = df_pip$headcount,
                         povgap = df_pip$poverty_gap,
                         povline = df_pip$poverty_line) %>% head()

df_pip %>%
    mutate(
        pg = get_hl_average_shortfall(headcount, poverty_gap, poverty_line),
        pg2 = poverty_line*poverty_gap/headcount
    ) %>% select(
        headcount, pop, pg, pg2
    ) %>%
    head()



get_hl_total_shortfall <- function(headcount, povgap, povline){

    # Input checks
    stopifnot(is.numeric(headcount) & is.vector(headcount)) # numeric vector
    stopifnot(is.numeric(povgap) & is.vector(povgap)) # numeric vector
    stopifnot(is.numeric(povline) & is.vector(povline)) # numeric vector
    stopifnot(length(headcount) == length(povline)) # vectors of same length
    stopifnot(length(headcount) == length(povgap)) # vectors of same length

    # Average Shortfall
    av_sf <- povline*povgap/headcount # z times P1/P0

    # Return
    return(av_sf)
}



get_hl_income_gap_ratio <- function(headcount, povgap){

    # Input checks
    stopifnot(is.numeric(headcount) & is.vector(headcount)) # numeric vector
    stopifnot(is.numeric(povgap) & is.vector(povgap)) # numeric vector
    stopifnot(length(headcount) == length(povgap)) # vectors of same length

    # income gap
    income_gap <- povgap/headcount

    # return
    return(income_gap)

}



get_hl_palma_ratio <- function(decile1, decile2, decile3, decile4, decile10){

    # Input checks
    stopifnot(is.numeric(decile1) & is.vector(decile1)) # numeric vector
    stopifnot(is.numeric(decile2) & is.vector(decile2)) # numeric vector
    stopifnot(is.numeric(decile3) & is.vector(decile3)) # numeric vector
    stopifnot(is.numeric(decile4) & is.vector(decile4)) # numeric vector
    stopifnot(is.numeric(decile10) & is.vector(decile10)) # numeric vector
    stopifnot(length(decile1) == length(decile2)) # vectors of same length
    stopifnot(length(decile1) == length(decile3)) # vectors of same length
    stopifnot(length(decile1) == length(decile4)) # vectors of same length
    stopifnot(length(decile1) == length(decile10)) # vectors of same length

    # Palma ratio
    palma <- decile10/(decile1 + decile2 + decile3 + decile4)

    # return
    return(palma)


}





