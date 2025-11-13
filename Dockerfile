FROM rocker/rstudio:4.3.2

# Install system dependencies needed for tidyverse + xml2
RUN apt-get update && apt-get install -y \
    libxml2-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    zlib1g-dev \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Install R packages
RUN R -e "install.packages(c('tidyr','rmarkdown','ggplot2','dplyr','ggrepel','glmnet','tinytex', 'corrplot'), repos='https://cloud.r-project.org')"

WORKDIR /home/rstudio/project
