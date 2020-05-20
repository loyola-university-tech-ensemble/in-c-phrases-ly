#!/usr/bin/env bash

echo "# In C - all octaves"

for x in {1..53}
do
cat<<EOF

![](svg/${x}_3.svg)
![](svg/${x}_2.svg)
![](svg/${x}_1.svg)
![](svg/${x}.svg)
![](svg/${x}+1.svg)
![](svg/${x}+2.svg)
![](svg/${x}+3.svg)
EOF
done
