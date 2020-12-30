# !/bin/bash
test="1 2 3 3 3 2 1 1 2 3 3 3 2 1"

Month_name=('JAN' 'FEB' 'MAR' 'APR' 'MAY' 'JUN' 'JUL' 'AUG' 'SEP' 'OCT' 'NOV' 'DEC')
Month_count=('31' '28' '31' '30' '31' '30' '31' '31' '30' '31' '30' '31')
month=10
day=17

# you can test it by switching from blueprint to test 
for num in $test
do
  # Update Day
  day=`expr $day + 1`
  # Update Month(should change but work)
  over_count=${Month_count[$month]}
  if [ $over_count -lt $day ]
  then
    day=`expr $day - $over_count`
    month=`expr $month + 1`
  fi
  # gradation algorithm
  count=0
  while [ $count -lt $num ]
  do
    count=`expr $count + 1`
    # echo ${Month_name[$month]} $day
    echo '1' >> 1.txt  # modify a file
    git add .
    git commit -m "Farming by Macro"
    git commit --amend --no-edit --date "${Month_name[$month]} $day 12:0:00 2018 +0000"
  done
done
