# map
library(ggplot2)
library("maps")
library("mapproj")
library("usmap")
black_incarceration <- incarceration_data %>% group_by(state) %>% summarize(avg_black_prison_pop = mean(black_prison_pop, na.rm = TRUE)) %>% na.omit(black_incarceration)


map <- plot_usmap(data = black_incarceration, values = "avg_black_prison_pop", color = "black") + 
  scale_fill_continuous(
    low = "#F8C8DC", high = "#A7C7E7", name = "Black Prison Population", label = scales::comma
  ) +   labs(title = "Black American Incarceration in USA") + theme(legend.position = "right")
