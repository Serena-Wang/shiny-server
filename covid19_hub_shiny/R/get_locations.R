get_locations = function(file) {
  read.csv(file,
                      colClasses=c(
                        "abbreviation"  = "character",
                        "location"      = "character",
                        "location_name" = "character")) %>% 
      dplyr::mutate(state_abbreviation = substr(location, start = 1, stop = 2))%>%
      dplyr::mutate(state_abbreviation = unlist(lapply(state_abbreviation, function (x) {ifelse(x %in% location,abbreviation[location ==x],"NA")})))%>%
      dplyr::rename(c("abbreviation" ="state_abbreviation", "state_abbreviation" = "abbreviation")) %>%
      dplyr::select(-c("state_abbreviation"))
}


