#!/bin/bash

# Install Apache Server in Before Install code deploy life event cycle

sudo yum install httpd
sudo yum update

# Ensure to take backup of the files and clean the folder before deploying new release

directory="/var/www/html"

if [ -d "$directory" ]; then
    sudo -i
    cd "$directory"
    mkdir -p "$directory"/dev.migrationoneviewapi.mito-lla.com
    rsync -av --exclude='dev.migrationoneviewapi.mito-lla.com/' "$directory"/* "$directory"/dev.migrationoneviewapi.mito-lla.com  >> /var/log/before_install.log
    rm -rf "$directory"/*
    exit 0
fi