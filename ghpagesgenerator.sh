#!/bin/bash

# Generate doc.html for GitHub Pages
echo "<html><head>" > doc.html
echo "<title>ODM API Documentation - Doc</title>" >> doc.html
echo "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css\">" >> doc.html
echo "<link rel=\"icon\" type=\"image/png\" href=\"images/favicon.png\">" >> doc.html
echo "<link href=\"https://fonts.googleapis.com/icon?family=Material+Icons\" rel=\"stylesheet\">" >> doc.html
echo "<style>" >> doc.html
echo ".brand-logo { display: flex; align-items: center; height: 64px; }" >> doc.html
echo ".brand-logo img { height: 75%; margin-right: 10px; }" >> doc.html
echo ".brand-logo .title { font-size: 1.5rem; margin: 0; line-height: 64px; }" >> doc.html
echo ".nav-wrapper { padding-left: 10px; padding-right: 10px; }" >> doc.html
echo ".nav-wrapper .brand-logo { height: 100%; display: flex; align-items: center; }" >> doc.html
echo ".sublist { display: none; margin-top: 10px; margin-bottom: 10px;}" >> doc.html
echo ".sublist.active { display: block; }" >> doc.html
echo ".arrow { float: right; margin-left: 5px; }" >> doc.html
echo "</style>" >> doc.html
echo "</head><body>" >> doc.html
echo "<nav class=\"blue\">" >> doc.html
echo "<div class=\"nav-wrapper\">" >> doc.html
echo "<a href=\"#\" class=\"brand-logo\">" >> doc.html
# Adding logo and title on the left
echo "<img src=\"images/icon.png\" alt=\"Logo\">" >> doc.html
echo "<span class=\"title\">ODM API Documentation</span>" >> doc.html
echo "</a>" >> doc.html
echo "<ul id=\"nav-mobile\" class=\"right hide-on-med-and-down\">" >> doc.html
echo "<li><a href=\"index.html\">Overview</a></li>" >> doc.html
echo "<li><a href=\"doc.html\">Doc</a></li>" >> doc.html
echo "<li><a href=\"contacts.html\">Contacts</a></li>" >> doc.html
echo "</ul>" >> doc.html
echo "</div>" >> doc.html
echo "</nav>" >> doc.html
echo "<div class=\"container\">" >> doc.html
echo "<h4>API Documentation</h4>" >> doc.html
echo "<ul class=\"collection\">" >> doc.html
# List version directories and their content
for dir in */; do
    if [[ "$dir" != "images/" ]]; then
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
echo "<script>
function toggleList(element) {
  var sublist = element.querySelector('.sublist');
  sublist.classList.toggle('active');
  var arrow = element.querySelector('.arrow');
  if (sublist.classList.contains('active')) {
    arrow.textContent = 'arrow_drop_up';
  } else {
    arrow.textContent = 'arrow_drop_down';
  }
}
</script>" >> doc.html
echo "</body></html>" >> doc.html