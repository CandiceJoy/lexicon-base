@echo off

set FileName=EssentialPack

echo Step 1: ACS
	cd compiler
	bcc -acc-err-file -x bcs ..\pk3\acs\main.c ..\pk3\acs\main.o
	if not exist ..\pk3\acs\acs.err goto 20
	del ..\pk3\acs\acs.err

:20
echo Step 2: PACK
	cd ..\pk3
	..\compiler\7za a -r -ssw -mx9 -tzip  ..\%FileName%n.pk3 *.kvx *.x* *.txt *.o *.png *.wad *.md2 *.md3 *.tga *.mp3 *.pal *.bmp *.map *.lmp *.raw *.ogg *.vgz *.wav *.pk3 *.gl


echo Step 3: REPLACE
	cd ..
	del %FileName%.pk3
	ren %FileName%n.pk3 %FileName%.pk3

pause