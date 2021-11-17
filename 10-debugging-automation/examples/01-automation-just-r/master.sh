#!/bin/sh
cd /Users/simonmunzert/github/intro-to-data-science-21/lectures/10-debugging-automation/examples/02-automation-shell-rscript
set -eux
Rscript 01-download-data.R
Rscript 02-process-data.R
Rscript 03-plot.R