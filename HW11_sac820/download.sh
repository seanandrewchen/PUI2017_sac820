for i in 94 94 95 96 97 98 99
	do
		wget https://www2.census.gov/Econ2001_And_Earlier/CBP_CSV//zbp$i\totals.zip
	done


for i in 0 1
	do
		wget https://www2.census.gov/Econ2001_And_Earlier/CBP_CSV//zbp0$i\totals.zip 
	done

for i in 2 3 4 5 6 7 8 9
	do
		wget https://www2.census.gov/econ200$i\/CBP_CSV/zbp0$i\totals.zip
	done

for i in 10 11 12 13 14
	do
		wget https://www2.census.gov/econ20$i\/CBP_CSV/zbp$i\totals.zip
	done