## clean out any previous work
outputs <- c("lotr_raw.tsv",
             "lotr_clean.tsv",
             list.files(pattern = "*.png$"))
file.remove(outputs)

## run scripts
source("00-packages.R")
source("01-download-data.R")
source("02-process-data.R")
source("03-plot.R")