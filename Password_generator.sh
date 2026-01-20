#!/bin/bash

digits="0-9"
upper="A-Z"
lower="a-z"
special="><+\-{}:.&;"

c1=$(tr -dc "$digits" < /dev/urandom | head -c 1)
c2=$(tr -dc "$upper" < /dev/urandom | head -c 1)
c3=$(tr -dc "lower" < /dev/urandom | head -c 1)
c4=$(tr -dc "$special" < /dev/urandom | head -c 1)

rest=$(tr -dc "${digits}${upper}${lower}${special}" < /dev/urandom | head -c 8)
echo "Your password is: "
echo "${c1}${c2}${c3}${c4}${rest}" | fold -w1 | shuf | tr -d '\n'

echo ""
