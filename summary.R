incarceration_data <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")
incarceration_data

library(tidyverse)
library(ggplot2)
library("maps")
library("mapproj")

# avg value of black incarcerated folks in King County, WA
b <- incarceration_trend %>% group_by(year, county_state) %>% summarize(avg_black_pop = mean(avg_black_prison_pop, na.rm = TRUE)) %>%  filter(year == 2016)
avg_value_2016 <- b$avg_black_pop
avg_value_2016 <- 1280 

# avg value of white incarcerated folks in King County, WA
w <- incarceration_trend %>% group_by(year, county_state) %>% summarize(avg_white_pop = mean(avg_white_prison_pop, na.rm = TRUE)) %>%  filter(year == 2016)
avg_value <- w$avg_white_pop
avg_value <- 1489

# avg value of aapi incarcerated folks in King County, WA
aapi <- incarceration_data %>% group_by(year, state, county_name) %>%  summarize(avg_aapi_prison_pop = mean(aapi_prison_pop, na.rm = TRUE)) %>% mutate(county_state = paste(county_name, state, sep = ", ")) %>% filter(county_state == "King County, WA") %>% na.omit(aapi) %>% filter (year == 2016)
avg_aapi_value <- aapi$avg_aapi_prison_pop
avg_aapi_value <- 64

# avg value of latinx incarcerated folks in King County, WA
latinx <- incarceration_data %>% group_by(year, state, county_name) %>%  summarize(avg_latinx_prison_pop = mean(latinx_prison_pop, na.rm = TRUE)) %>% mutate(county_state = paste(county_name, state, sep = ", ")) %>% filter(county_state == "King County, WA") %>% na.omit(latinx) %>% filter (year == 2016)
avg_latinx_value <- latinx$avg_latinx_prison_pop
avg_latinx_value <- 139

# avg value of native incarcerated folks in King County, WA
native <- incarceration_data %>% group_by(year, state, county_name) %>%  summarize(avg_native_prison_pop = mean(native_prison_pop, na.rm = TRUE)) %>% mutate(county_state = paste(county_name, state, sep = ", ")) %>% filter(county_state == "King County, WA") %>% na.omit(native) %>% filter (year == 2016)
avg_native_value <- native$avg_native_prison_pop
avg_native_value <- 112

# avg value of mixed race/other race incarcerated folks in King County, WA
other <- incarceration_data %>% group_by(year, state, county_name) %>%  summarize(avg_other_prison_pop = mean(other_race_prison_pop, na.rm = TRUE)) %>% mutate(county_state = paste(county_name, state, sep = ", ")) %>% filter(county_state == "King County, WA") %>% na.omit(other) %>% filter (year == 2016)
avg_other_value <- other$avg_other_prison_pop
avg_other_value <- 234



