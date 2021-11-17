#!/bin/sh
cd /Users/simonmunzert/github/intro-to-data-science-21/lectures/10-debugging-automation/examples/01-automation-just-r/
set -eux
Rscript 00-packages.R
Rscript 01-download-data.R
Rscript 02-process.data.R
Rscript 03-plot.R