#!/usr/bin/env python

import configparser
import glob
import re

config_file = 'sm-cms.ini'
config = configparser.ConfigParser()
config.read(config_file)
index_title = config['general']['IndexTitle']
markdown_files = glob.glob("*.md")

# remove eventual README.md file
markdown_files.remove('README.md')
# remove index file
markdown_files.remove('index.md')

# sort list of pages, according to config
if config['general']['ReverseSorting'] == 'true':
    markdown_files.sort(reverse=True)
else:
    markdown_files.sort()

# generate index.md
index_content = "% " + config['general']['IndexTitle']
index_content += "\n\n"

for page in markdown_files:
    # get page title
    with open(page, "r") as f:
        first_line = f.readline().strip()
        page_title = re.sub('% ', '', first_line)

    #generate link in index
    index_content += "* [" + page_title + "](" + page + ")\n"

index_file = open(config['general']['IndexFile'], "w")
index_file.write(index_content)
