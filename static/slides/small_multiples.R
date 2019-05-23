library(tidyverse)

data <- readr::read_csv("https://gist.githubusercontent.com/will-r-chase/16827fa79e02af9e3a0651fb0d79b426/raw/92b321a8bc4d98e463156ef03a5da5cf05065704/freedom_clean.csv") 
hfi <- 
  data %>%
  select(year, countries, region_simple, ef_score, pf_score, gdp_ppp_cap, gdp_rank, population, pop_rank) %>%
  mutate(pf_score = round(pf_score, 2), gdp = round(gdp_ppp_cap, 2)) %>%
  select(-gdp_ppp_cap)

hfi_americas <-
  hfi %>%
  filter(region_simple == "Americas") %>%
  select(year, countries, ef_score, pf_score) %>%
  gather(key = "var", value = "value", -year, -countries)

ggplot(hfi_americas) +
  geom_line(aes(x = year, y = value, color = var)) +
  scale_color_manual(name = "Freedom score", values = c("#112E71", "#8E1414"), labels = c("Economic freedom", "Personal freedom")) +
  labs(title = "Human freedom index scores in the Americas, 2008 - 2016", 
       x = "Year", y = "Score") +
  theme_light(base_size = 18) + 
  theme(panel.grid.minor = element_blank(), 
        panel.spacing = unit(20, "points"), 
        plot.margin = margin(10, 10, 10, 10, "pt"),
        strip.background = element_blank(), 
        strip.text = element_text(color = "black"),
        plot.title = element_text(size = 22),
        axis.text = element_text(size = 12)) +
  facet_wrap( ~countries)

ggsave("target_plot.png", height = 10, width = 16)
