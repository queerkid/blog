#!/bin/bash

for md in ./articles/markdown/*.md; do
    arr=(${md//// })
    fn=(${arr[3]//.md/})
    pandoc -s "$md" -o ./articles/html/${fn}.html -c ../stylesheets/style.css
done
