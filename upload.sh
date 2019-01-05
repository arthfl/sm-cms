#!/usr/bin/env bash

username="someuser"
hostname="example.domain"
webroot="/var/www/example.domain"

scp *.html style.css "$username"@"$hostname":"$webroot"
