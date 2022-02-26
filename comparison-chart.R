incarceration_data <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")
incarceration_data

library(tidyverse)

compare_chart <- incarceration_data %>% group_by(year, state, county_name) %>% summarize(avg_black_female_pop = mean(black_female_prison_pop, na.rm = TRUE), avg_black_male_prison_pop = mean(black_male_prison_pop, na.rm = TRUE)) %>% mutate(county_state = paste(county_name, state, sep = ", ")) %>% filter(county_state == "King County, WA") %>% na.omit(compare_chart)

test_p <- compare_chart %>% 
  gather(key = "gender", value = "population", avg_black_female_pop, avg_black_male_prison_pop)

comparison <- ggplot(data = test_p) + 
  geom_col(mapping = aes(x = year, y = population, fill = gender), position = "dodge") + 
  scale_fill_brewer(palette = "Pastel1")+
  labs(title = "Population of Inarcerated Black Women and Men")
comparison