#!/bin/bash

dest="export"

rm -rf ./$dest
mkdir ./$dest

# Build images
rsvg-convert 1d-f1.svg -o ./$dest/1d-f1.png
rsvg-convert 1d-f1f2.svg -o ./$dest/1d-f1f2.png
rsvg-convert 1d-f1f2f3.svg -o ./$dest/1d-f1f2f3.png
rsvg-convert 1d-f1f2f3.svg -o ./$dest/1d-f1f2f3.png
rsvg-convert 1d-f1f2f3-bidir.svg -o ./$dest/1d-f1f2f3-bidir.png
rsvg-convert 2d-f1f2f3.svg -o ./$dest/2d-f1f2f3.png
rsvg-convert 2d-f1f2f3f4f5.svg -o ./$dest/2d-f1f2f3f4f5.png
rsvg-convert 3d-f1f2f3f4f5.svg -o ./$dest/3d-f1f2f3f4f5.png
rsvg-convert 4d.svg -o ./$dest/4d.png
rsvg-convert 2d-f1f2f3-loop.svg -o ./$dest/2d-f1f2f3-loop.png
rsvg-convert wormhole.svg -o ./$dest/wormhole.png
rsvg-convert parallel.svg -o ./$dest/parallel.png
rsvg-convert domains.svg -o ./$dest/domains.png

cp flumen_ru.tex ./$dest/
cp flumen_en.tex ./$dest/

# Build tex
#pandoc flumen.md -o ./$dest/flumen.tex --strip-comments

cd $dest

pdflatex ./flumen_ru.tex
pdflatex ./flumen_ru.tex

pdflatex ./flumen_en.tex
pdflatex ./flumen_en.tex

