#!/usr/bin/env bash

page_name="$1"
page_date=$(date +%Y%m%d)
page_filename="${page_date}_${page_name}.md"

echo "% $page_name" > "$page_filename"
