set gnum1=%1
set gnum2=%2
for /l %%t in (%gnum1%,1,%gnum2%) do (
	if %3==1 (
		set g%%t=[1;37;46m░[0m
	) else if %3==2 (
		set g%%t=[1;32m┼[0m
	) else if %3==3 (
		set g%%t= 
	)
)