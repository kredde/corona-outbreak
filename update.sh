# #!/bin/bash

TODAY=$(date +%Y-%m-%d)

# execute notebooks
jupyter nbconvert --to notebook --execute italy.ipynb
jupyter nbconvert --to notebook --execute bolzano.ipynb

# overwrite old notebooks
mv italy.nbconvert.ipynb italy.ipynb
mv bolzano.nbconvert.ipynb bolzano.ipynb

# create new html files
jupyter nbconvert --to markdown italy.ipynb
jupyter nbconvert --to markdown bolzano.ipynb

# move files
mv italy_files "files/italy_files-$TODAY"
mv bolzano_files "files/bolzano_files-$TODAY"

# move new md files
mv bolzano.md "_posts/$TODAY-bolzano.md"
mv italy.md "_posts/$TODAY-italy.md"

# add line to beginning of file
TEXTIT="---\n layout: post \n title:  \"Italy - $TODAY\" \n date: $TODAY\n---\n\nVisualizes the data on an national level and models the deaths and infections of the next days using an exponential and a logistic model.\n\n**Disclaimer**: Experts estimate that many of the infections remain unreported, and therefore the collected data does not necessarily give the full picture of the situation."
TEXTBZ="---\n layout: post \n title:  \"Bolzano - $TODAY\" \n date: $TODAY\n---\n\nVisualizes the data on a provincial level, focusing on the province of bolzano and models the infections of the next days for the province.\n\n**Disclaimer**: Experts estimate that many of the infections remain unreported, and therefore the collected data does not necessarily give the full picture of the situation."
echo -e "$TEXTIT\n$(cat _posts/$TODAY-italy.md)" > _posts/$TODAY-italy.md
echo -e "$TEXTBZ\n$(cat _posts/$TODAY-bolzano.md)" > _posts/$TODAY-bolzano.md


LINKIT="https:\/\/kredde.github.io\/corona-outbreak\/files\/italy_files-$TODAY"
LINKBZ="https:\/\/kredde.github.io\/corona-outbreak\/files\/bolzano_files-$TODAY"

#replace files storage
sed -i -e "s/italy_files/$LINKIT/g" "_posts/$TODAY-italy.md"
sed -i -e "s/bolzano_files/$LINKBZ/g" "_posts/$TODAY-bolzano.md"
