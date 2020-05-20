#!/usr/bin/env bash

echo "# In C - Cello"

for x in {1..53}
do
cat<<EOF

![](svg/${x}_2.svg)
![](svg/${x}_1.svg)
![](svg/${x}.svg)
![](svg/${x}+1.svg)
EOF
done

echo -e "\n----"
