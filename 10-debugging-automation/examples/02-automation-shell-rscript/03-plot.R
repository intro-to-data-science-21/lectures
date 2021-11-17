library(tidyverse)

## import clean data
lotr_dat <- read_tsv("lotr_clean.tsv") %>% 
# reorder Race based on words spoken
mutate(Race = reorder(Race, Words, sum))

## make a plot
p <- ggplot(lotr_dat, aes(x = Race, weight = Words)) + 
  geom_bar() + 
  theme_minimal()
ggsave("barchart-words-by-race.png", p)
