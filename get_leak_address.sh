#!/bin/bash

rm -f adrress_logs.py
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <executable_name>"
    exit 1
fi

executable="$1"

if [ ! -x "$executable" ]; then
    echo "Error: The specified executable '$executable' does not exist or is not executable."
    exit 1
fi

./"$executable"

addresses=()

while IFS= read -r line; do
    addresses+=("$line")
done < <(cat adrress_logs.py | grep alloca | sort | uniq | awk '{print $5}' | awk -F',' '{printf("%s\n", $1)}')

n=0
for address in "${addresses[@]}"; do
  count1=$(cat adrress_logs.py | grep allocated | wc -l)
  count2=$(cat adrress_logs.py | grep freed | wc -l)
  if (( $count1 > $count2)); then
    location=$(cat adrress_logs.py | grep $address | grep allocated | sort | uniq)
    echo "$location"
    ((n++))
  fi
done
echo $n
