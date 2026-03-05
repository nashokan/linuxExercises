#!/bin/bash
cat Property_Tax_Roll.csv |
  grep "MADISON SCHOOLS" |
  cut -d',' -f7 |
  { sum=0; count=0;
    while read val; do
      sum=$(echo "$sum + $val" | bc)
      count=$((count + 1))
    done
    echo "scale=2; $sum / $count" | bc
  }
