rem syntax resize picture width height ouput
rem echo resizing %1 to %2 x %3

partial_imagemagick\convert -resize "%2x>" -resize "x%3>" -resize "%2x<" -resize "x%3<" %1 -gravity center -crop %2x%3+0+0 temp.bmp
