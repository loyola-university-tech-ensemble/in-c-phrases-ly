#!/usr/bin/env bash

echo "# In C"

for x in {1..53}
do
cat<<EOF
![](svg/${x}.svg)
EOF
done
