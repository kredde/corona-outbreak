#!/bin/bash

YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
TODAY=$(date +%Y-%m-%d)

# execute notebooks
jupyter nbconvert --to notebook --execute italy.ipynb
jupyter nbconvert --to notebook --execute bolzano.ipynb

# overwrite old notebooks
mv italy.nbconvert.ipynb italy.ipynb
mv bolzano.nbconvert.ipynb bolzano.ipynb

# move old html files
mv bolzano.html "previous/bolzano-$YESTERDAY.html"
mv italy.html "previous/italy-$YESTERDAY.html"

# create new html files
jupyter nbconvert italy.ipynb
jupyter nbconvert bolzano.ipynb
