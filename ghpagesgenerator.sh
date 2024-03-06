#!/bin/bash

# Start HTML file
echo "<html><body>" > index.html

# List directories and files recursively
find . -type d -not -path '*/\.*' -exec bash -c 'echo "<h2>{}:</h2>"; ls {}/*.html' \; >> index.html

# End HTML file
echo "</body></html>" >> index.html
