#!/bin/bash
articlelist=''

for md in ./articles/markdown/*.md; do
    arr=(${md//// })
    fn=(${arr[3]//.md/}) #file name
    pandoc -s "$md" -o ./articles/html/${fn}.html -c ../stylesheets/style.css #-T "title"
    fl=$(head -1 ${md}) #file first line  
    node='<p><a href="articles/html/'${fn}.html'">'${fl:1}'</a></p>' #fl:1 is tile
    articlelist+=$node
done

cat ./head.html > index.html
echo $articlelist >> index.html 
cat ./foot.html >> index.html

git add -A && git commit -m "lalala" && git push   && xdg-open "http:techrat.xyz"