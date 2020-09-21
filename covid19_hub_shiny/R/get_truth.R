get_truth <- function(file, inc_cum, source) {
  read.csv(file,
                    colClasses  = c(
                      "date"          = "Date",
                      "location"      = "character",
                      # location_name = readr::col_character(),
                      "value"         = "double"
                    )) %>%
    dplyr::mutate(inc_cum = inc_cum, source = source) %>%
    na.omit() %>%
    dplyr:: filter(date >= Sys.Date()- 6*7)
}
