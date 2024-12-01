library(tidyverse)
library(lubridate)
mloa <- read_csv("https://raw.githubusercontent.com/gge-ucd/R-DAVIS/master/data/mauna_loa_met_2001_minute.csv")
view(mloa)

mloa_new = mloa %>%
  filter(rel_humid != -99) %>%
  filter(temp_C_2m != -999.9) %>%
  filter(windSpeed_m_s != -999.9) %>%
  mutate(datetime = ymd_hm(paste0(year,"-", month, "-", day," ", hour24, ":", min), tz = "UTC")) %>%
  mutate(datetimeLocal = with_tz(datetime, tz = "Pacific/Honolulu"))

#Alternative
mloa_new = mloa %>%
  filter(windSpeed_m_s > 0 & temp_C_2m > 0 & rel_humid > 0)

mloa_new %>%
  mutate(localMon = month(datetimeLocal, label = TRUE),localHour = hour(datetimeLocal)) %>%
  group_by(localMon, localHour) %>%
  summarize(meantemp = mean(temp_C_2m)) %>%
  ggplot(aes(x = localMon, y = meantemp)) +
  geom_point(aes(col = localHour)) +
  scale_color_viridis_c() +
  ylab("Mean Temp (C)") +
  xlab("Month") +
  theme_classic()
