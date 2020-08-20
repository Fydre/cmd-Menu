@echo off
cd functions
chcp 65001 >nul
SETLOCAL ENABLEDELAYEDEXPANSION
set "CCD=%CD%"
for /f "Delims=" %%a in (warn.bool) do (
	if %%a==false (
		call powershell -command write-warning """This Program only works with Windows 10. Older Versions might not support the Elements."""
		bg print "\nContinue\?"
		pause>nul
		echo true>warn.bool
		exit
	)
)
:ifretry
echo The password system is broken.
FORFILES.EXE /P %~dps0 /M %~nxs0 /C "CMD.EXE /C ECHO 0x1B[1;31m Check 0x1B[0;41m Check 0x1B[0m Check"
:logo
echo false>loggedin.bool
if exist selector.char (
	for /f "Delims=" %%c in (selector.char) do (
		set cursor=%%c
	)
) else set cursor=■
if exist colors.clr (
	for /f "Delims=" %%d in (colors.clr) do (
		color %%d >nul
		set dClr=%%d
	)
) else (
	color 0f
)
mode 61,16
title Made with Notepad^+^+ ^(Windows^)
cls
echo.
echo.
echo.
echo.
echo                          ▄▄▄▄▄▄▄▄▄▄▄
echo                          ▌  ▄▄▄▄   ▐
echo                          ▌ █    █  ▐
echo                          ▌█▬▬▬▬▬▬█ ▐
echo                          ▌█      █ ▐
echo                          ▌         ▐
echo                          ▀▀▀▀▀▀▀▀▀▀▀
echo.
echo.
echo.
echo.
echo.
bg print "Press any key..."
pause >nul
cls
:: Menu Beginning
set light=1
color 0f
:menu
mode 61,16
title Menu
cls
set "l1= "
set "l2= "
set "l3= "
set "l4= "
set l%light%=%cursor%
echo.
echo                                  Press ↑ or ↓ key to select.
echo                                  Press ENTER key to enter.
echo                                  Press ESC key to go back.
echo.
echo [1;34m            ┌────────────────────┐
echo             │[1;36;43m░░░%l1%░░░░Apps░░░░%l1%░◘░[0m[1;34m│ ╔════╗
echo             │[1;36;43m░░░%l2%░░Settings░░%l2%░☼░[0m[1;34m│ ║[1;32mMENU[1;34m║
echo             │[1;36;43m░░░%l3%░░░Games░░░░%l3%░☻░[0m[1;34m│ ╚════╝
echo             │[1;36;43m░░░%l4%░░░░Exit░░░░%l4%░◄░[0m[1;34m│
echo             └────────────────────┘[0m
echo.
:input1
keystick
set key=%ERRORLEVEL%
if %key%==328 (
	set /a light=%light%-1
	set %key%=0
) else if %key%==336 (
	set /a light=%light%+1
	set %key%=0
) else if %key%==27 (
	set %key%=0
	goto logo
) else if %key%==13 (
	if %light%==1 (
		set %key%=0
		goto apps
	)
	if %light%==2 (
		set %key%=0
		goto custom
	)
	if %light%==3 (
		set %key%=0
		goto games
	)
	if %light%==4 exit
) else (
	set %key%=0
	goto input1
)
if %light% gtr 4 set light=1
if %light% lss 1 set light=4
goto menu
:: Menu End
:: Apps Section Beginning
:apps
cls
set light=1
:appsmenu
mode 61,16
title Apps
cls
set "l1= "
set "l2= "
set "l3= "
set "l4= "
set "l5= "
set l%light%=%cursor%
echo.
echo [0m                                 Press ↑ or ↓ key to select.
echo                                  Press ENTER key to enter.
echo                                  Press ESC key to go back.
echo.
echo [1;34m            ┌────────────────────────┐[0m
echo [1;34m            │[1;36;43m▒▒%l1%▒Unicode Search▒▒%l1%▒⅍▒[0m[1;34m│ ╔════╗[0m
echo [1;34m            │[1;36;43m▒▒%l2%▒▒▒▒▒Notepad▒▒▒▒▒%l2%▒A▒[0m[1;34m│ ║[1;32mAPPS[1;34m║[0m
echo [1;34m            │[1;36;43m▒▒%l3%▒▒▒▒FunThings▒▒▒▒%l3%▒☺▒[0m[1;34m│ ╚════╝[0m
echo [1;34m            │[1;36;43m▒▒%l4%▒▒▒▒Explorer▒▒▒▒▒%l4%▒¶▒[0m[1;34m│[0m
echo [1;34m            │[1;36;43m▒▒%l5%▒Animation Maker▒%l5%▒►▒[0m[1;34m│[0m
echo [1;34m            └────────────────────────┘[0m
echo.
:input2
keystick
set key=%ERRORLEVEL%
if %key%==328 (
	set /a light-=1
	set %key%=0
) else if %key%==336 (
	set /a light+=1
	set %key%=0
) else if %key%==27 (
	set %key%=0
	goto menu
) else if %key%==13 (
	if %light%==1 (
		set %key%=0
		goto uni
	)
	if %light%==2 (
		set %key%=0
		goto note
	)
	if %light%==3 (
		set %key%=0
		goto fun
	)
	if %light%==4 (
		set %key%=0
		goto explore
	)
	if %light%==5 (
		set %key%=0
		goto anim
	)
) else (
	set %key%=0
	goto input2
)
if %light% gtr 5 set light=1
if %light% lss 1 set light=5
goto appsmenu
:anim
title Animation Maker
echo Work in Progress...
pause >nul
goto apps
cd anim
mode 40,14
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓▓▓▓[1;34m1. New Animation       [0m▓▓▓▓
echo ▓▓▓▓[1;32m2. Run Animation       [0m▓▓▓▓
echo ▓▓▓▓[1;31m3. Delete Animation    [0m▓▓▓▓
echo ▓▓▓▓[1;37m4. Exit Animation Maker[0m▓▓▓▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
choice /c 1234 >nul
echo %Errorlevel%
pause
if %errorlevel%==1 (
	goto newanim
) else if %errorlevel%==2 (
	goto oldanim
) else if %errorlevel%==3 (
	cls
	echo.
	set /p "delanim=[4;1;34mAnimation:[0m "
) else (
	goto apps
)
:oldanim
echo.
set /p "animname=[4;1;34mAnimation Name:[0m "
echo.
cd %animname%
cls
If exist frames.num (
	for /f "Delims=" %%a in (frames.num) do set frames=%%a
	for /l %%f in (1,1,%frames%) do (
		type f%%f.frame
		ping localhost -n 1 >nul
		cls
	)
)
goto anim
:newanim
echo.
set /p "name=[4;1;34mName:[0m "
md "%name%"
cd "%name%"
set /p "frames=[4;1;34mFrames:[0m "
echo %frames%>frames.num
cls
echo ―†‡•…‴⁞←─│┌┐└┘├┤┬┴◌┼═║╧╨╩╪╫╬
echo ▀▄█ ▌▐░▒▓■□
echo.
for /l %%f in (1,1,%frames%) do (
	for /l %%l in (1,1,10) do set "line%%l= "
	for /l %%d in (1,1,10) do set /p "line%%d= "
	(
		echo %line1%
		echo %line2%
		echo %line3%
		echo %line4%
		echo %line5%
		echo %line6%
		echo %line7%
		echo %line8%
		echo %line9%
		echo %line10%
	) >f%%f.frame
	cls
)
cd ..\..
goto apps
:explore
set "dirc=."
mode 80,50
title Explorer
cls
echo.
echo                   Type .. to go back.
echo                   Type exit to exit.
echo [1;33;43m▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓[30;47mCmd Explorer[1;33;43m▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓[1;30;47m
echo.
dir
echo.
echo [1;33;43m▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓[0m[4;1;34m
set /p dirc=Choose Directory:[0m
if "%dirc%"=="exit" (
	cd %CCD%
	goto apps
)
cd %dirc%
goto explore
:fun
title :-^)
echo [1;37m▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓▓▓[30;47m1.[0m[1;37m▓[30;47mUnclosable[0m[1;37m▓[30;47mMessage[0m[1;37m▓[30;47mbox[0m[1;37m▓▓▓▓[30;47m2.[0m[1;37m▓[30;47mfake[0m[1;37m▓[30;47mboot[0m[1;37m▓[30;47mscreen[0m[1;37m▓▓▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓▓▓[30;47m3.[0m[1;37m▓[30;47mblackout[0m[1;37m▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓[30;47m4.[0m[1;37m▓[30;47mStuck[0m[1;37m▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓[0m
echo.
Bg print "                         Select:"
choice /c 1234 >nul
cls
if %ERRORLEVEL%==1 (
	cd..
	start looper.vbs
	cd functions
) else if %ERRORLEVEL%==2 (
	bootim
) else if %ERRORLEVEL%==3 (
	taskkill /f /im explorer.exe /t
) else if %ERRORLEVEL%==4 (
	for /l %%i in (1,0,10000) do (
		start bootim
	)
)
goto appsmenu
:note
title Note
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
set /p filename=▓▓▓▓▓▓▓▓▓File Name:
cls
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
set /p dir=▓▓▓▓▓▓▓▓▓Stored Directory:
cd %dir%
if not exist %filename% (
	echo.>%filename%
)
cd %CCD%
call notepad %dir%\%filename%
goto apps
:uni
mode 85,30
title Unicode Art Maker
cls
echo.
echo                       Type exit to exit Unicode Art.
echo                       Type clear to clear all written text.
echo.
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓[43m ― † ‡ • … ‴ ⁞ ← ─ │┌ ┐└ ┘ ├ ┤ ┬ ┴ ◌      [0m▓
echo ▓[43m                                          [0m▓
echo ▓[43m ↑ → ↓ ↔ ↨ ∂ ∆ ∏ ∑ ∙ ┼ ═ ║╒  ╧ ╨ ╩ ╪ ╫ ╬  [0m▓
echo ▓[43m                                          [0m▓
echo ▓[43m ∞ ∟ ∩ ∫ ≈ ≡ ⌂ ⌐ ⌠ ⌡ ▀ ▄ █ ▌ ▐ ░ ▒ ▓ ■ □  [0m▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo.
:writeuni
set "unitext=n"
set /p "unitext= "
set delay=0
if "%unitext%"=="exit" (
	goto appsmenu
) else if "%unitext%"=="clear" (
	goto uni
) else goto writeuni
goto apps
:: Apps Section End
:: Settings Beginning
:custom
cls
set light=1
:custommenu
mode 61,16
title Apps
cls
set "l1= "
set "l2= "
set "l3= "
set "l4= "
set l%light%=%cursor%
echo.
echo                                  Press ↑ or ↓ key to select.
echo                                  Press ENTER key to enter.
echo                                  Press ESC key to go back.
echo.
echo [1;34m            ┌──────────────────┐
echo             │[1;36;43m▒▒%l1%▒▒▒Color▒▒▒%l1%▒█▒[0m[1;34m│ ╔════╗
echo             │[1;36;43m▒▒%l2%▒▒Cursor▒▒▒%l2%▒•▒[0m[1;34m│ ║[1;32mAPPS[1;34m║
echo             │[1;36;43m▒▒%l3%▒▒▒Reset▒▒▒%l3%▒◌▒[0m[1;34m│ ╚════╝
echo             │[1;36;43m▒▒%l4%▒Password▒▒%l4%▒^*▒[0m[1;34m│
echo             └──────────────────┘[0m
echo.
:input3
keystick
set key=%ERRORLEVEL%
if %key%==328 (
	set /a light-=1
	set %key%=0
) else if %key%==336 (
	set /a light+=1
	set %key%=0
) else if %key%==27 (
	set %key%=0
	goto menu
) else if %key%==13 (
	if %light%==1 (
		set %key%=0
		goto color
	)
	if %light%==2 (
		set %key%=0
		goto cursor
	)
	if %light%==3 (
		set %key%=0
		goto submitrest
	)
	if %light%==4 (
		set %key%=0
		goto passmake
	)
) else (
	set %key%=0
	goto input3
)
if %light% gtr 4 set light=1
if %light% lss 1 set light=4
goto custommenu
:color
cls
mode 47,15
echo [43;30m              Default Logo Colors              [0m
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓[43;30m
echo          0 ^= black         8 ^= gray
echo          1 ^= blue          9 ^= bright blue
echo          2 ^= green         A ^= ^*      green
echo          3 ^= greenblue     B ^= ^*      greenblue
echo          4 ^= red           C ^= ^*      red
echo          5 ^= purple        D ^= ^*      purple
echo          6 ^= yellow        E ^= ^*      yellow
echo          7 ^= bright gray   F ^= white[0m
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
set /p textclr=Text and foreground Color:
set /p background=Background Color:
echo %background%%textclr%>colors.clr
goto logo
:cursor
mode 37,4
cls
echo [1;37;46m◌ ▓ ■ □ ▀ ▄ █ ▌ ▐ ░ ▒ ∞ ∟ ∩ ∫ ≈ ≡ ⌂ ⌐
echo ― † ‡ • … ‴ ⁞ ← ─ ╫ ╬ ◘ ▪ ▫          [0m
echo.
set /p cursor=Type a cursor:
echo %cursor%>selector.char
goto custom
:submitrest
title
mode 31,5
cls
echo [1;30;41m▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓▓▓▓▓▓▓▓▓Are you sure^?▓▓▓▓▓▓▓▓▓
echo ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
echo ▓▓▓▓▓▓▓▓▓Yes  ^|    No▓▓▓▓▓▓▓▓▓▓
set submit=noanswer
set /p submit=▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓[0m
if /i "%submit%"=="yes" (
	del passwords.sec
	del colors.clr
	del selector.char
	echo false>warn.bool
	rd /s /q anim
	md anim
	exit
) else if /i "%submit%"=="no" (
	goto custom
) else (
	goto submitrest
)
:passmake
cls
echo on
echo [1;32;44m▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓[0m
set /p password=Type in your Password:
echo [1;32;44m▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓[0m
echo %password%>passwords.sec
goto
:: Settings end
:games
cls
set light=1
:gamemenu
mode 61,16
title Apps
cls
set "l1= "
set "l2= "
set "l3= "
set l%light%=%cursor%
echo.
echo                                  Press ↑ or ↓ key to select.
echo                                  Press ENTER key to enter.
echo                                  Press ESC key to go back.
echo.
echo [1;34m            ┌─────────────────────┐
echo             │[1;36;43m▒▒%l1%▒▒▒▒▒Ship▒▒▒▒▒%l1%▒▬▒[0m[1;34m│ ╔═════╗
echo             │[1;36;43m▒▒%l2%▒Apple Basket▒%l2%▒●▒[0m[1;34m│ ║[1;32mGames[1;34m║
echo             │[1;36;43m▒▒%l3%▒▒▒▒Racer▒▒▒▒▒%l3%▒●▒[0m[1;34m│ ╚═════╝
echo             └─────────────────────┘[0m
echo.
:input4
keystick
set key=%ERRORLEVEL%
if %key%==328 (
	set /a light-=1
	set %key%=0
) else if %key%==336 (
	set /a light+=1
	set %key%=0
) else if %key%==27 (
	set %key%=0
	goto menu
) else if %key%==13 (
	if %light%==1 (
		set %key%=0
		cls
		call fly
	)
	if %light%==2 (
		set %key%=0
		cls
		call applegame
	)
	if %light%==3 (
		set %key%=0
		cls
		call racer
	)
) else (
	set %key%=0
	goto input4
)
if %light% gtr 3 set light=1
if %light% lss 1 set light=3
goto gamemenu