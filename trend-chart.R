library(tidyverse)
incarceration_data <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")
incarceration_data
incarceration_trend <- incarceration_data %>% group_by(year, state, county_name) %>% summarize(avg_black_prison_pop = mean(black_prison_pop, na.rm = TRUE), avg_white_prison_pop = mean(white_prison_pop, na.rm = TRUE)) %>% mutate(county_state = paste(county_name, state, sep = ", ")) %>% filter(county_state == "King County, WA")
incarceration_trend <- na.omit(incarceration_trend) 

trend_graph <- ggplot(data = incarceration_trend) + 
  geom_line(mapping = aes(x = year, y = avg_black_prison_pop, col = "avg black prison pop"))+
  geom_line(mapping = aes(x = year, y = avg_white_prison_pop, col = "avg white prison pop"))+
  labs(y= "avg prison population in King County", x = "years")