# Stupid-minimal CMS (sm-cms)

No-Bullshit, very (very, very) minimal CMS

* Write your content in markdown files
* Compile website to static html files
* Done

# Requirements
"pandoc" must be installed on the machine you compile your .md files on. And python should be installed for index generation

# Installation

There is none.
Clone this repo, fill markdown files with content, compile, upload generated HTML files and the
CSS style file (default is style.css) to your webroot.

# Auto-generate index
```bash
make index
```

This will auto-generate the `index.md` file (while overwrite an existing one)
like this:
```text
% foobar

* [Hello world!](hello-world.md)
* [pagename](20190104_pagename.md)
```
The list will include all `.md` files in the directory, except README.md and,
of course, index.md.

Entries will be sorted reversely, so most recent date timestamp in filename will
be first.

For this script to work, it's expected to have a `sm-cms.ini` file in the same
directory, with this content:
```ini
[general]
IndexFile = index.md
IndexTitle = foobar
ReverseSorting = true
```
At the moment, only reverse-sorting is supported.

# Create page
```bash
./create-page.sh pagename
```
This will generate a file named like this:
```sh
20190104_pagename.md
```

With this content:
```bash
$ cat 20190104_pagename.md
% pagename
```

I suggest to add new pages with this script, so you have a proper timestamp in
the filename.

# Compile website
```bash
make website
```

This will generate HTML files from all markdown files in the directory, except 
README.md

# Upload site
Put your data in `upload.sh`:
```bash
#!/usr/bin/env bash

username="someuser"
hostname="example.domain"
webroot="/var/www/example.domain"

scp *.html style.css "$username"@"$hostname":"$webroot"
```
And just run it to upload all HTML files and the `style.css` file:
```bash
$ ./upload.sh
```

# TODO
* add some actual error handling in scripts
* think of a way to automatically add a link back to the index in the pages
