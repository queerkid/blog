#!/bin/bash

cat ./index_first.html > index.html

for md in ./articles/markdown/*.md; do
    arr=(${md//// })
    fn=(${arr[3]//.md/}) #file name
    pandoc -s "$md" -o ./articles/html/${fn}.html  -H header.html
    fl=$(head -1 ${md}) #file first line  
    node='<p><a href="articles/html/'${fn}.html'">'${fl:1}'</a></p>' #fl:1 is tile 
    echo "          "$node >> index.html  
done

cat ./index_last.html >> index.html

# go github and look my blog
git add -A && git commit -m "lalala" && git push   && xdg-open "http:techrat.xyz"