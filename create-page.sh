#!/usr/bin/env bash

page_name="$1"
page_content_date=$(date +%Y/%m/%d)
page_filename_date=$(date +%Y%m%d)
page_filename="${page_filename_date}_${page_name}.md"

echo "% $page_content_date - $page_name" > "$page_filename"
