#!/bin/bash

# Generate index.html for GitHub Pages
echo "<html><head>" > index.html
echo "<title>ODM Api Documentation</title>" >> index.html
echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css\">" >> index.html
echo "<link rel=\"icon\" type=\"image/png\" href=\"images/favicon.png\">" >> index.html
echo "<style>" >> index.html
echo ".brand-logo { display: flex; align-items: center; }" >> index.html
echo "</style>" >> index.html
echo "</head><body>" >> index.html
echo "<nav class=\"blue\">" >> index.html
echo "<div class=\"nav-wrapper\">" >> index.html
echo "<a href=\"#\" class=\"brand-logo\">" >> index.html
echo "<img src=\"images/icon.png\" alt=\"Logo\">" >> index.html
echo "<span style=\"margin-left: 10px;\">ODM Api Documentation</span>" >> index.html
echo "</a>" >> index.html
echo "<ul id=\"nav-mobile\" class=\"right hide-on-med-and-down\">" >> index.html
echo "<li><a href=\"#\">Home</a></li>" >> index.html
echo "<li><a href=\"#\">About</a></li>" >> index.html
echo "<li><a href=\"#\">Contact</a></li>" >> index.html
echo "</ul>" >> index.html
echo "</div>" >> index.html
echo "</nav>" >> index.html
echo "<div class=\"container\">" >> index.html
echo "<h4>ODM Api Documentation</h4>" >> index.html
echo "<ul class=\"collection\">" >> index.html
# List version directories and their content
for dir in */; do
    if [[ "$dir" != "images/" ]]; then
        echo "<li class=\"collection-item\">$dir" >> index.html
        echo "<ul>" >> index.html
        # List HTML files inside each version directory
        for file in "$dir"*.html; do
            if [[ "$file" != "$dir""index.html" && ! -d "$file" ]]; then
                echo "<li><a href=\"$file\">$(basename "$file")</a></li>" >> index.html
            fi
        done
        echo "</ul>" >> index.html
        echo "</li>" >> index.html
    fi
done
echo "</ul>" >> index.html
echo "</div>" >> index.html
echo "</body></html>" >> index.html
