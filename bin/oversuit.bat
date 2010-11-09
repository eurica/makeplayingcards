
rem syntax oversuit relPicDir Suit
echo Processing: %2 in %1

rem goto black

@rem syntax overSuit picture number
call bin\overlay.bat %1 %diamonds% %2 r diamonds
rem goto ending

call bin\overlay.bat %1 %hearts% %2 r hearts
partial_imagemagick\montage finished\%2-hearts.bmp finished\%2-diamonds.bmp -geometry 900x1200+0+0 -stroke grey -draw "rectangle 899,0 900,1200" finished\%2-red.jpg

del finished\%2-diamonds.bmp
del finished\%2-hearts.bmp


:black
call bin\overlay.bat %1 %spades% %2 b spades
call bin\overlay.bat %1 %clubs% %2 b clubs
partial_imagemagick\montage finished\%2-spades.bmp finished\%2-clubs.bmp -geometry 900x1200+0+0 -stroke grey -draw "rectangle 899,0 900,1200" finished\%2-black.jpg

del finished\%2-spades.bmp
del finished\%2-clubs.bmp

:ending