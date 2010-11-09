@rem syntax overlay pictures suit picturesuit number annotation


rem: common error:
IF NOT EXIST %1\%2%3.jpg.jpg GOTO GoodName
ren %1\%2%3.jpg.jpg %2%3.jpg
:GoodName

call bin/resize.bat %1\%2%3.jpg 800 1100 temp.bmp


partial_imagemagick\convert -border 50x50 -bordercolor white temp.bmp temp.bmp 
partial_imagemagick\composite gfx/outside.png temp.bmp temp.bmp


if exist %labels%\%2%3.txt goto labelsExist
goto convertDone
:labelsExist
partial_imagemagick\convert gfx\blankcard.png %font% -fill white -pointsize 60 -annotate +130+890 @%labels%\%2%3.txt -shade 315x40 text.png

partial_imagemagick\convert -size 900x1200 xc:white %font% -pointsize 60 -stroke black -strokewidth 12 -annotate +135+895 @%labels%\%2%3.txt -blur 0x4 fuzzy1.png

partial_imagemagick\convert gfx\blankcard.png %font% -pointsize 60 -fill white  -stroke darkgrey -strokewidth 1.1  -annotate +130+890 @%labels%\%2%3.txt fuzzy2.png

partial_imagemagick\composite text.png temp.bmp temp.bmp
partial_imagemagick\composite -compose darken fuzzy1.png temp.bmp temp.bmp
partial_imagemagick\composite fuzzy2.png temp.bmp temp.bmp



:convertDone


rem add large suit and number
partial_imagemagick\composite -geometry +80+20 gfx/%5.png temp.bmp temp.bmp
partial_imagemagick\composite -geometry +20+160 gfx/%4%3.png temp.bmp temp.bmp


rem add small suit and number
partial_imagemagick\composite -geometry +680+1000 gfx/%5.png -resize 50%%x50%% temp.bmp temp.bmp
partial_imagemagick\composite -geometry +620+1000 gfx/%4%3.png -resize 50%%x50%% temp.bmp temp.bmp

move temp.bmp finished/%3-%5.bmp
