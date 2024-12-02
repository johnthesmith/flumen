#!/bin/bash

tmp="./tmp"
dest="./export"
source="./source"
sourceImages="$source/images"
pngWidth=2048

rm -rf $tmp && \
mkdir $tmp && \


# Найти все файлы и передать в xargs для обработки rsvg-convert
find "$sourceImages" -name "*.svg" | xargs -I {} sh -c '
    fileName=$(basename "{}" .svg)
    rsvg-convert "{}" -w '"$pngWidth"' -o '"$tmp"'/$fileName.png
' && \

cp source/flumen_ru.tex $tmp/ && \
cp source/flumen_en.tex $tmp/ && \

## Build tex
##pandoc flumen.md -o ./$dest/flumen.tex --strip-comments

pdflatex -interaction=batchmode -output-directory=$tmp/ $tmp/flumen_ru.tex && \
pdflatex -interaction=batchmode -output-directory=$tmp/ $tmp/flumen_ru.tex && \

pdflatex -interaction=batchmode -output-directory=$tmp/ $tmp/flumen_en.tex && \
pdflatex -interaction=batchmode -output-directory=$tmp/ $tmp/flumen_en.tex && \

pandoc $tmp/flumen_ru.tex -o $tmp/flumen_ru.md && \
pandoc $tmp/flumen_en.tex -o $tmp/flumen_en.md && \

rm -rf $dest && \
mkdir $dest && \

mv $tmp/*.pdf $dest/ && \
mv $tmp/*.md $dest/ && \
mv $tmp/*.png $dest/ && \
mv $tmp/*.tex $dest/ && \

echo RESULT_COMPLETE || echo RESULT_ERROR
