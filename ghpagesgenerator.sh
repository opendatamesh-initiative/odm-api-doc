#!/bin/bash

# Generate doc.html for GitHub Pages
echo "<!DOCTYPE html>" > doc.html
echo "<html lang=\"en\"><head>" >> doc.html
echo "<meta charset=\"UTF-8\">" >> doc.html
echo "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" >> doc.html
echo "<title>ODM API Documentation - Doc</title>" >> doc.html
echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css\">" >> doc.html
echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"style/styles.css\">" >> doc.html
echo "<link rel=\"icon\" type=\"image/png\" href=\"images/favicon.ico\">" >> doc.html
echo "<link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">" >> doc.html
echo "<style>" >> doc.html
echo ".sublist { display: none; margin-top: 10px; margin-bottom: 10px;}" >> doc.html
echo ".sublist.active { display: block; }" >> doc.html
echo ".arrow { float: right; margin-left: 5px; }" >> doc.html
echo "</style>" >> doc.html
echo "</head><body>" >> doc.html
echo "<div class=\"navbar-placeholder\" id=\"navbar\"></div>" >> doc.html
echo "<div class=\"container\">" >> doc.html
echo "<h4>API Documentation</h4>" >> doc.html
echo "<ul class=\"collection\">" >> doc.html
# List version directories and their content
for dir in */; do
    if [[ "$dir" != "images/" && "$dir" != "javascript/" && "$dir" != "style/" ]]; then
        echo "<li onclick=\"toggleList(this)\" class=\"collection-item\">$dir" >> doc.html
        echo "<i class=\"material-icons arrow\">arrow_drop_down</i>" >> doc.html
        echo "<ul class=\"sublist\">" >> doc.html
        # List HTML files inside each version directory
        for file in "$dir"*.html; do
            if [[ "$file" != "$dir""index.html" && ! -d "$file" ]]; then
                echo "<li><a href=\"$file\" target="_blank">$(basename "$file")</a></li>" >> doc.html
            fi
        done
        echo "</ul>" >> doc.html
        echo "</li>" >> doc.html
    fi
done
echo "</ul>" >> doc.html
echo "</div>" >> doc.html
echo "<script src=\"javascript/doc.js\"></script>" >> doc.html
echo "</body></html>" >> doc.html