#!/bin/bash

echo "
This script is for installing dependencies for dockerdemo
"

package_list=(
    
    apt-transport-https
    build-essential
    curl
    gfortran
    libatlas-base-dev
    libbz2-dev
    libcairo2
    libcurl4-openssl-dev
    libicu-dev
    liblzma-dev
    libpango-1.0-0
    libpangocairo-1.0-0
    libpcre3-dev
    libtcl8.6
    libtiff5
    libtk8.6
    libx11-6
    libxt6 
    locales 
    tzdata 
    zlib1g-dev

)

apt-get update --fix-missing && apt-get install -y --no-install-recommends ${package_list[@]}
apt-get clean && rm -rf /var/lib/apt/lists/*
