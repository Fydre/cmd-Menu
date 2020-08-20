@echo off
mode 23,18
SETLOCAL ENABLEDELAYEDEXPANSION
setlocal ENABLEEXTENSIONS
chcp 65001 >nul
title Racer
rem cls
echo Enter key to accelerate
echo (Only if not red spot)
pause >nul
color ff
set /A SP=%RANDOM% * 10 / 32768 + 1 >nul
set CP=75
set PP=1
set AP=1
set lapnum=1
set SM=1
set momentum=1
set aftercount=0
set ticks=0
set distance=0
color ff
:display
color ff
cls
for /l %%p in (1,1,12) do set p%%p=●
set p1=[1;33m●[0m
call template 1 100 3
call slidertemp
set a%AP%=█
set p%PP%=[1;31m●[0m
set g%CP%=[1;34;40m■[0m
set g%SP%=[1;33;41m◘[0m
echo [1;37m▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
echo [1;37;5;41m▌[0m%a1%%a2%%a3%%a4%%a5%%a6%%a7%%a8%%a9%%a10%%a11%%a12%%a13%[1;37;5;41m▐[0m Lap %lapnum%^\3
echo [1;37m▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀
echo  [1;31;43m▐[0m[1;30m▒▒▒▒▒▒▒▒▒▒[1;31;43m▌[0m Speed: %momentum%
echo  [1;31;43m▐[0m%g1%%g2%%g3%%g4%%g5%%g6%%g7%%g8%%g9%%g10%[1;31;43m▌[0m
echo  [1;31;43m▐[0m%g11%%g12%%g13%%g14%%g15%%g16%%g17%%g18%%g19%%g20%[1;31;43m▌[0m
echo  [1;31;43m▐[0m%g21%%g22%%g23%%g24%%g25%%g26%%g27%%g28%%g29%%g30%[1;31;43m▌[0m %p5%%p4%%p3%
echo  [1;31;43m▐[0m%g31%%g32%%g33%%g34%%g35%%g36%%g37%%g38%%g39%%g40%[1;31;43m▌[0m %p6% %p2%
echo  [1;31;43m▐[0m%g41%%g42%%g43%%g44%%g45%%g46%%g47%%g48%%g49%%g50%[1;31;43m▌[0m %p7% %p1%
echo  [1;31;43m▐[0m%g51%%g52%%g53%%g54%%g55%%g56%%g57%%g58%%g59%%g60%[1;31;43m▌[0m %p8% %p12%
echo  [1;31;43m▐[0m%g61%%g62%%g63%%g64%%g65%%g66%%g67%%g68%%g69%%g70%[1;31;43m▌[0m %p9%%p10%%p11%
echo  [1;31;43m▐[0m%g71%%g72%%g73%%g74%%g75%%g76%%g77%%g78%%g79%%g80%[1;31;43m▌[0m
echo  [1;31;43m▐[0m%g81%%g82%%g83%%g84%%g85%%g86%%g87%%g88%%g89%%g90%[1;31;43m▌[0m 
echo  [1;31;43m▐[0m%g91%%g92%%g93%%g94%%g95%%g96%%g97%%g98%%g99%%g100%[1;31;43m▌[0m
echo  [1;31;43m▐[0m[1;30m▒▒▒▒▒▒▒▒▒▒[1;31;43m▌[0m
:move
rem echo on
keystick
set key=%Errorlevel%
set /a ticks+=1
if %key%==13 (
	if !a%AP%_state!==red (
		if %momentum% gtr 5 set /a aftercount-=2
		if %momentum% gtr 2 set /a momentum-=2
	)
	if !a%AP%_state!==green (
		set /a momentum+=1
		if %momentum% gtr 5 set /a aftercount+=1
	)
	if !a%AP%_state!==gold (
		set /a momentum+=1
		if %momentum% gtr 5 set /a aftercount+=1
	)
) else if %momentum% gtr 5 (
	set momentum-=1
	set aftercount-=1
)
if %aftercount% lss 0 set aftercount=0
color ff
set /a AP+=%SM%
if %AP% gtr 13 (
	set AP=12
	set SM=-1
) else if %AP% lss 1 (
	set AP=2
	set SM=1
)
if %CP% gtr 80 (
	if %momentum% gtr 1 set momentum-=1
	set BP=80
)
if %CP% lss 71 (
	if %momentum% gtr 1 set momentum-=1
	set BP=71
)
if %momentum% lss 1 set momentum=1
for /l %%m in (1,1,%momentum%) do (
	set /a SP+=10
	if %SP%==%CP% (
		if %momentum% lss 6 (
			set momentum=0
		) else (
			set /a momentum-=%aftercount%
			set aftercount=0
		)
		set /A SP=%RANDOM% * 10 / 32768 + 1 >nul
	)
)
if %momentum% lss 1 set momentum=1
if %SP% gtr 100 (
	set /A SP=%RANDOM% * 10 / 32768 + 1 >nul
)
set /a distance+=%momentum%
:checkloop
if %distance% gtr 50 (
	set /a PP+=1
	set /a distance-=50
)
if %PP% gtr 12 (
	set /a lapnum+=1
	set PP=1
)
if %lapnum% gtr 3 (
	cls
	mode 24
	echo Total time: %ticks%Ticks
	ping localhost -n 3 >Nul
	pause >nul
	goto :eof
)
goto display