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
RUN apt-get update && apt-get install -y r-base


#  install from a versioned repo
RUN R -e 'install.packages("tidyverse")'
RUN R -e 'install.packages("tidymodels")'
RUN R -e 'install.packages("ggplot2")'

# Making home & test folders 
RUN mkdir dockerdemo 

WORKDIR "docker-r"
