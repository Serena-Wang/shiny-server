get_forecast_files <- function() {
  list.files(path = "data-processed",
             pattern = "*.csv",
             full.names = TRUE,
             recursive = TRUE)
}
