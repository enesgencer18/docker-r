# Build & Push Image
FROM ubuntu:20.04
ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

# Copying install_dependencies.sh & give permissions
COPY install_dependencies.sh /
RUN chmod +x /install_dependencies.sh

# Install dependencies
RUN ./install_dependencies.sh

# download a version of R and build from source
ARG R_VERSION=3.5.2
RUN wget https://cdn.rstudio.com/r/ubuntu-1604/pkgs/r-${R_VERSION}_1_amd64.deb
RUN apt-get install -y gdebi-core
RUN gdebi r-${R_VERSION}_1_amd64.deb


#  install from a versioned repo
RUN R -e 'install.packages("tidyverse")'
RUN R -e 'install.packages("tidymodels")'
RUN R -e 'install.packages("ggplot2")'

# Making home & test folders 
RUN mkdir dockerdemo 

WORKDIR "docker-r"
