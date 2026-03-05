#!/bin/bash
sum=0
for n in {1000..2000}; do
  if [[ $n =~ ^[01]+$ ]]; then
    sum=$((sum + n))
  fi
done
echo $sum
