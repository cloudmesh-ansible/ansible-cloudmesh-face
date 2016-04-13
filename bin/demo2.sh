echo "timetype,value" > Comparer_time_results.csv &&  (time -p ./demos/compare.py images/examples/{lennon*,clapton*}| tail -n 3) 2>> Comparer_time_results.csv && sed -i "s/\ /,/g" Comparer_time_results.csv

