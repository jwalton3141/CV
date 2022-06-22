#! /bin/bash

# Use luxurious 256 colour
function EXT_COLOUR () { echo -ne "\033[1;38;5;$1m"; }
NO_COLOUR="\033[0m"

flagged_spellings=$(cat cv.tex |
                    aspell list -t -l en \
                      --conf=./internal/cv_ignore_tex \
                      --add-extra-dicts=./internal/cv_aspell_dict |
                    sort | uniq)

if [[ -z $flagged_spellings ]]; then
    echo -e "🎉 `EXT_COLOUR 34`Spellings look good! 🎉$NO_COLOUR"
    exit 0
else
    echo -e "😢 `EXT_COLOUR 160`Potential spelling mistake(s) identified 😢:$NO_COLOUR"
    echo -e "$flagged_spellings\n"
    echo -e "If you are satisfied that the flagged words are spelt correctly, you can ignore them by adding them to ./internal/cv_aspell_dict\n"
    exit 1
fi
