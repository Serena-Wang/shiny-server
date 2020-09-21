read_forecast_file <- function(f) {
  read.csv(f,
                    colClasses =c(
                      "forecast_date"   = "Date",
                      "target"          = "character",
                      "target_end_date" = "Date",
                      "location"        = "character",
                      "type"            = "character",
                      "quantile"        = "double",
                      "value"           = "double")
  ) %>%
    dplyr::mutate(quantile = as.numeric(quantile),
                  type = tolower(type)) %>%
    dplyr::mutate(file = f) %>%
    tidyr::separate(file, into = c("period","processed","team","model",
                                   "year","month","day","team2","model_etc"), 
                    sep="-|/") %>%
    
    dplyr:: mutate(team_model = paste(team,model,sep="-")) %>%
    
    dplyr::select(team_model, forecast_date, type, location, target, quantile, 
                  value, target_end_date)   
}
