@echo off
rem syntax overnum picture

echo Making a deck out of the pictures in %1

rem echo 11
rem rem create blank labels if none exist
rem if exist labels\da.txt goto labelsExist
rem 	call labels\mk.bat
rem :labelsExist
rem echo 22

rem call bin\oversuit.bat %1 9


call bin\oversuit.bat %1 A
call bin\oversuit.bat %1 2
call bin\oversuit.bat %1 3
call bin\oversuit.bat %1 4
call bin\oversuit.bat %1 5
call bin\oversuit.bat %1 6
call bin\oversuit.bat %1 7
call bin\oversuit.bat %1 8
call bin\oversuit.bat %1 9
call bin\oversuit.bat %1 10
call bin\oversuit.bat %1 J
call bin\oversuit.bat %1 Q
call bin\oversuit.bat %1 K

:jokers
echo Processing: Joker in %1

@rem Just a hack
call bin\overlay.bat %1 %diamonds% joker d blank
call bin\overlay.bat %1 %spades% joker s blank2
partial_imagemagick\montage finished\joker-blank.bmp finished\joker-blank2.bmp -geometry 900x1200+0+0 finished\jokers.jpg
del finished\joker-blank.bmp
del finished\joker-blank2.bmp
:enough