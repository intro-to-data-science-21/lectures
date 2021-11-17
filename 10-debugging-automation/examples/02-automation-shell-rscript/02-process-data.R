library(tidyverse)

## import raw data
lotr_dat <- read_tsv("lotr_raw.tsv")

## reorder Film factor levels based on story
old_levels <- levels(as.factor(lotr_dat$Film))
j_order <- sapply(c("Fellowship", "Towers", "Return"),
									function(x) grep(x, old_levels))
new_levels <- old_levels[j_order]

## process data set 
lotr_dat <- lotr_dat %>%
  # apply new factor levels to Film
	mutate(Film = factor(as.character(Film), new_levels),
	# revalue Race
				 Race = recode(Race, `Ainur` = "Wizard", `Men` = "Man")) %>%
  # drop least frequent Races
	filter(!(Race %in% c("Gollum", "Ent", "Dead", "Nazgul"))) %>%
  # reorder Race based on words spoken
	mutate(Race = reorder(Race, Words, sum)) %>%
  # arrange the data on Race, Film, Words
	arrange(Race, Film, Words) %>%
  # drop levels
	droplevels

## write data to file
write_tsv(lotr_dat, "lotr_clean.tsv")
