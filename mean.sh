#!/bin/bash
col=$1
file=${2:-/dev/stdin}

if [ $# -eq 0 ]; then
  echo "usage: $0 <column> [file.csv]" 1>&2
  exit 1
fi

cut -d',' -f$col "$file" | tail -n +2 | {
  sum=0; count=0
  while read val; do
    sum=$(echo "$sum + $val" | bc)
    count=$((count + 1))
  done
  echo "scale=4; $sum / $count" | bc
}
