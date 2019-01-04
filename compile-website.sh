#!/usr/bin/env bash

for FILE in *.md; do
    if [[ "$FILE" != "README.md" ]]; then
        BASENAME=$(echo "$FILE" | cut -d "." -f 1)
        echo "Processing $BASENAME..."
        pandoc -s "$BASENAME".md -o "$BASENAME".html -c style.css
    fi
done
