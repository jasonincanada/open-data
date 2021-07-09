
set title "Top 5 Animals Encountered\nIn Parks Canada (2017-2020)"

set xlabel "Animal"
set ylabel "Encounters"
set key off

set style data histogram
set style fill solid

set term png size 800,500
set output "sum-by-animal.png"
set datafile separator ","

plot "sum-by-animal.csv" every ::1 using 2:xticlabels(1) linecolor rgb "#336699"

