@echo off
mode 19,18
SETLOCAL ENABLEDELAYEDEXPANSION
chcp 65001 >nul
title Ship
cls
echo Enter key to move
echo Arrow keys to boost
pause >nul
color ff
set FP=100
set SP=5
set momentum=0
set score=0
set counter=0
set lives=3
mode 15,15
:display
cls
call template 1 100 2
set g%SP%=[1;33m▬[0m
set g%FP%=[1;31;44m◘[0m
echo      %momentum%
echo [1;30m╔╤╤╤╤╤╤╤╤╤╤╗[0m
echo [1;30m╟[0m%g1%%g11%%g21%%g31%%g41%%g51%%g61%%g71%%g81%%g91%[1;30m╢[0m
echo [1;30m╟[0m%g2%%g12%%g22%%g32%%g42%%g52%%g62%%g72%%g82%%g92%[1;30m╢[0m
echo [1;30m╟[0m%g3%%g13%%g23%%g33%%g43%%g53%%g63%%g73%%g83%%g93%[1;30m╢[0m %score%
echo [1;30m╟[0m%g4%%g14%%g24%%g34%%g44%%g54%%g64%%g74%%g84%%g94%[1;30m╢[0m
echo [1;30m╟[0m%g5%%g15%%g25%%g35%%g45%%g55%%g65%%g75%%g85%%g95%[1;30m╢[0m
echo [1;30m╟[0m%g6%%g16%%g26%%g36%%g46%%g56%%g66%%g76%%g86%%g96%[1;30m╢[0m %lives%
echo [1;30m╟[0m%g7%%g17%%g27%%g37%%g47%%g57%%g67%%g77%%g87%%g97%[1;30m╢[0m
echo [1;30m╟[0m%g8%%g18%%g28%%g38%%g48%%g58%%g68%%g78%%g88%%g98%[1;30m╢[0m
echo [1;30m╟[0m%g9%%g19%%g29%%g39%%g49%%g59%%g69%%g79%%g89%%g99%[1;30m╢[0m
echo [1;30m╟[0m%g10%%g20%%g30%%g40%%g50%%g60%%g70%%g80%%g90%%g100%[1;30m╢[0m
echo [1;30m╚╧╧╧╧╧╧╧╧╧╧╝[0m
if %score% lss 10 (
	ping localhost -n 1 >nul
	ping localhost -n 1 >nul
	ping localhost -n 1 >nul
	ping localhost -n 1 >nul
	ping localhost -n 1 >nul
	ping localhost -n 1 >nul
	ping localhost -n 1 >nul
	ping localhost -n 1 >nul
) else if %score% lss 20 (
	ping localhost -n 1 >nul
	ping localhost -n 1 >nul
	ping localhost -n 1 >nul
	ping localhost -n 1 >nul
) else if %score% lss 35 (
	ping localhost -n 1 >nul
	ping localhost -n 1 >nul
)
:move
keystick
set key==%Errorlevel%
color ff
if %key%==13 (
	set /a momentum+=1
	if %momentum% geq 0 set /a SP-=1
	set key=0
) else if %key%==328 (
	if %momentum%==3 (
		set /a SP-=2
		set /a momentum-=3
	)
	set key=0
) else if %key%==336 (
	if %momentum%==-3 (
		set /a SP+=2
		set /a momentum+=3
	)
	set key=0
) else (
	set /a momentum-=1
	if %momentum% leq 0 set /a SP+=1
	set key=0
)
color ff
if %momentum% gtr 3 set momentum=3
if %momentum% lss -3 set momentum=-3
if %SP% gtr 10 (
	set SP=10
	set momentum=0
) else if %SP% lss 1 (
	set SP=1
	set momentum=0
)
set /a FP-=10
if %FP% lss 1 (
	set /a lives-=1
	set /A FP=%RANDOM% * 11 / 32768 + 90 >nul
)
if %FP%==%SP% (
	set /a counter+=1
	set /a score+=1
	set /A FP=%RANDOM% * 11 / 32768 + 90 >nul
)
if %lives%==0 (
	goto :EOF
)
if %counter%==5 (
	set counter=0
	set /a  lives+=1
)
goto display