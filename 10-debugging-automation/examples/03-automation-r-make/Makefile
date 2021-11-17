## one Makefile to make them all

all: lotr_clean.tsv barchart-words-by-race.png words-histogram.png

#lotr_raw.tsv:
#	curl -L http://bit.ly/lotr_raw-tsv > lotr_raw.tsv

lotr_raw.tsv:
	Rscript 01-download-data.R

lotr_clean.tsv: lotr_raw.tsv 02-process-data.R
	Rscript 02-process-data.R

barchart-words-by-race.png: lotr_clean.tsv 03-plot.R
	Rscript 03-plot.R

words-histogram.png: lotr_clean.tsv
	Rscript -e 'library(ggplot2); qplot(Words, data = read.delim("$<"), geom = "histogram"); ggsave("$@")'
	rm Rplots.pdf

clean:
	rm -f lotr_raw.tsv lotr_clean.tsv *.png
