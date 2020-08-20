@echo off
mode 18,18
SETLOCAL ENABLEDELAYEDEXPANSION
chcp 65001 >nul
title Apple Basket
cls
echo Arrow keys to move
pause >nul
set /A AP=%RANDOM% * 10 / 32768 + 1 >nul
set BP=95
set score=0
color ff
:display
color ff
cls
call template 1 100 1
set g%BP%=[1;33;43m▄[0m
set g%AP%=[1;31;46m●[0m
echo [1;37;44m▓▓▓▓▓▓▓▓▓▓▓▓[0m
echo [1;37;44m▓[0m%g1%%g2%%g3%%g4%%g5%%g6%%g7%%g8%%g9%%g10%[1;37;44m▓[0m
echo [1;37;44m▓[0m%g11%%g12%%g13%%g14%%g15%%g16%%g17%%g18%%g19%%g20%[1;37;44m▓[0m
echo [1;37;44m▓[0m%g21%%g22%%g23%%g24%%g25%%g26%%g27%%g28%%g29%%g30%[1;37;44m▓[0m
echo [1;37;44m▓[0m%g31%%g32%%g33%%g34%%g35%%g36%%g37%%g38%%g39%%g40%[1;37;44m▓[0m %score%
echo [1;37;44m▓[0m%g41%%g42%%g43%%g44%%g45%%g46%%g47%%g48%%g49%%g50%[1;37;44m▓[0m
echo [1;37;44m▓[0m%g51%%g52%%g53%%g54%%g55%%g56%%g57%%g58%%g59%%g60%[1;37;44m▓[0m
echo [1;37;44m▓[0m%g61%%g62%%g63%%g64%%g65%%g66%%g67%%g68%%g69%%g70%[1;37;44m▓[0m
echo [1;37;44m▓[0m%g71%%g72%%g73%%g74%%g75%%g76%%g77%%g78%%g79%%g80%[1;37;44m▓[0m
echo [1;37;44m▓[0m%g81%%g82%%g83%%g84%%g85%%g86%%g87%%g88%%g89%%g90%[1;37;44m▓[0m
echo [1;37;44m▓[0m%g91%%g92%%g93%%g94%%g95%%g96%%g97%%g98%%g99%%g100%[1;37;44m▓[0m
echo [1;37;44m▓▓▓▓▓▓▓▓▓▓▓▓[0m
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
if %key%==331 (
	set /a BP-=1
	set key=0
) else if %key%==333 (
	set /a BP+=1
	set key=0
) else (
	set key=0
)
color ff
if %BP% gtr 100 set BP=91
if %BP% lss 91 set BP=100
set /a AP+=10
if %AP% gtr 100 (
	goto :EOF
)
if %AP%==%BP% (
	set /a score+=1
	set /A AP=%RANDOM% * 10 / 32768 + 1 >nul
)
goto display