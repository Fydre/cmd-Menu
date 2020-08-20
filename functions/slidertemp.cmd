for /l %%r in (1,1,3) do (
	set a%%r=[1;31m█[0m
	set a%%r_state=red
)
for /l %%r in (11,1,13) do (
	set a%%r=[1;31m█[0m
	set a%%r_state=red
)
set a6=[1;31m█[0m
set a6_state=red
set a8=[1;31m█[0m
set a8_state=red
set a7=[1;33m█[0m
set a7_state=gold
for /l %%g in (4,1,5) do (
	set a%%g=[1;32m█[0m
	set a%%g_state=green
)
for /l %%g in (9,1,10) do (
	set a%%g=[1;32m█[0m
	set a%%g_state=green
)