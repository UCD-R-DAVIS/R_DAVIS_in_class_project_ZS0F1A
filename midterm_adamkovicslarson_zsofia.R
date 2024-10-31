library(tidyverse)

#1 - This step was surprisingly hard to figure out. 
url <- 'https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv'
tyler_data  <- read_csv(url)
view(tyler_data)
dim(tyler_data)

#2
tyler_running <- filter(tyler_data, sport == 'running')
dim(tyler_running)
view(tyler_running)

#3
tyler_running_corrected <- tyler_running %>% 
  filter(minutes_per_mile < 10) %>% 
  filter(minutes_per_mile > 5) %>% 
  filter(total_elapsed_time_s >= 60)
view(tyler_running_corrected)

#4
trc_pace <- tyler_running_corrected %>% 
  mutate(pace = case_when(
    minutes_per_mile < 6 ~ "fast",
    minutes_per_mile >= 6 & minutes_per_mile <= 8 ~ "medium",
    minutes_per_mile > 8 ~ "slow"
  ))

trc_pf <- trc_pace %>% 
  mutate(form = case_when(
    year >= 2024 ~ "new",
    year < 2024 ~ "old"
  ))

view(trc_pf)

#5 - I got stuck on this question & ran out of time. 
# Past this point I looked at/altered the answer key for my own understanding. 

trc_pf %>% 
  group_by(form, pace) %>% 
  summarize(mean_spm = mean(steps_per_minute)) %>% 
  pivot_wider(
    id_cols = form,
    values_from = mean_spm, 
    names_from = pace) %>% 
  select(form, slow, medium, fast)

summarize(mean_spm = mean(steps_per_minute, na.rm = TRUE))

#6 

trc_pf %>% filter(form == 'new') %>%
  mutate(months = ifelse(month %in% 1:6,'early 2024','late 2024')) %>%
  group_by(months) %>% 
  summarize(
    min_spm = min(steps_per_minute),
    median_spm = median(steps_per_minute),
    mean_spm = mean(steps_per_minute),
    max_spm = max(steps_per_minute))
