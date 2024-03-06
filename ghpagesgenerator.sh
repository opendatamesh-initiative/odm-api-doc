#!/bin/bash

# Generate index.html for GitHub Pages
echo "<html><body>" > index.html
echo "<h2>ODM Api Documentation</h2>" >> index.html
echo "<ul>" >> index.html
# List versions and their respective links
for dir in */; do
  echo "<li>$dir" >> index.html
  echo "<ul>" >> index.html
  # List HTML files inside each version directory
  for file in $dir*.html; do
    if [ "$file" != "$dir/index.html" ]; then
      echo "<li><a href=\"$file\">$(basename $file)</a></li>" >> index.html
    fi
  done
  echo "</ul>" >> index.html
  echo "</li>" >> index.html
done
echo "</ul>" >> index.html
echo "</body></html>" >> index.html
