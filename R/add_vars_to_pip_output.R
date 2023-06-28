#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Load libraries,  functions and data   ---------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
library(data.table)

fs::dir_ls(path = "code",
           type = "file",
           regexp = "[Rr]$") |>
    purrr::walk(source)

pip <- pipr::get_stats()
setDT(pip)
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# add extra vars   ---------
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

pip[,
    bottom40 := decile1 + decile2 + decile3 + decile4,
    ][,
    `:=`(
    numb_poor = get_hl_number_poor(headcount = headcount,
                                    pop       = pop),

    average_shortfall = get_hl_average_shortfall(headcount = headcount,
                                                 povgap    = poverty_gap,
                                                 povline   = poverty_line),

    total_shortfall = get_hl_total_shortfall(headcount = headcount,
                                             povgap    = poverty_gap,
                                             povline   = poverty_line),

    income_gap_ratio = get_hl_income_gap_ratio(headcount = headcount,
                                               povgap    = poverty_gap),

    palma_ratio = get_hl_palma_ratio(top10    = decile10,
                                     bottom40 = bottom40)

    )
    ]



