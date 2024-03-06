#!/bin/bash

echo "<html><body>" > index.html
echo "<h2>ODM Api Documentation</h2>" >> index.html
ls -R -1 | grep -vE 'index\.html|README\.md|ghpagesgenerator\.sh' | awk '!/\.$/ && /\.html$/{sub(/[^\/]+\//,"&<br/>")}1' >> index.html
echo "</body></html>" >> index.html
