library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")
view(surveys)
nchar(surveys$species)

#Q1
for(i in unique(surveys$taxa)){
  mytaxon <- surveys[surveys$taxa == i,]
  longestnames <- mytaxon[nchar(mytaxon$species) == max(nchar(mytaxon$species)),] %>% select(species)
  print(paste0("The longest species name(s) among ", i, "s is/are: "))
  print(unique(longestnames$species))
}

#Q2
mloa <- read_csv("https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
view(mloa)

maxofcols <- mloa %>% 
  select("windDir","windSpeed_m_s","baro_hPa","temp_C_2m","temp_C_10m","temp_C_towertop","rel_humid", "precip_intens_mm_hr") %>%
  map(max, na.rm = T)
maxofcols

#Q3
C_to_F <- function(x){
  x * 1.8 + 32
}

mloa$temp_F_2m <- C_to_F(mloa$temp_C_2m)
mloa$temp_F_10m <- C_to_F(mloa$temp_C_10m)
mloa$temp_F_towertop <- C_to_F(mloa$temp_C_towertop)
view(mloa)

mloa2 <- mloa %>%
  mutate( 
    temp_mutate_F_2m = C_to_F(mloa$temp_C_2m),
    temp_mutate_F_10m = C_to_F(mloa$temp_C_10m), 
    temp_mutate_F_towertop = C_to_F(mloa$temp_C_towertop), 
                  )
view(mloa2)
