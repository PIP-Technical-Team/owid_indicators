### get_decile_welfare ###


get_decile_welfare <- function(
    decile = c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10),
    input_vec,
    weight_vec = rep(1, length(input_vec))/length(input_vec)
){
    # Argument Checks
    stopifnot(decile %in% c(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10))
    stopifnot(is.numeric(decile))
    stopifnot(weight_vec>0) # must be positive weights
    stopifnot(is.numeric(weight_vec) & is.vector(weight_vec))
    stopifnot(is.numeric(input_vec) & is.vector(input_vec))
    stopifnot(length(input_vec)==length(weight_vec)) # both vectors must be same length
    if(length(weight_vec)==1)warning("the `weight_vec` input should usually be a vector of length>1")
    if(length(input_vec)==1)warning("the `input_vec` input should usually be a vector of length>1")

    # Order both vectors according to input_vec
    order_mat <- matrix( # store two vectors as columns in matrix
        data = c(input_vec, weight_vec),
        nrow = length(input_vec)
    )
    order_mat <- order_mat[order(order_mat[,1]),] # reorder matrix by input_vec
    input_vec <- order_mat[,1] # ordered input_vec
    weight_vec <- order_mat[,2] # ordered weight_vec

    # Find Decile Value
    weight_cdf <- cumsum(weight_vec)/sum(weight_vec)        # find CDF of weights
    decile_index <- which.min(abs(weight_cdf - decile/10))  # get position closest to F(w) = decile/10
    input_decile <- input_vec[decile_index]                 # get input_vec value corresponding to decile

    # return
    return(input_decile)



}


