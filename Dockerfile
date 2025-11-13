FROM rocker/rstudio:4.3.2

# Install system dependencies needed for tidyverse + XML + LaTeX fonts
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
    fonts-dejavu \
    && rm -rf /var/lib/apt/lists/*

# Install R packages including tinytex
RUN R -e "install.packages(c('tidyr','rmarkdown','ggplot2','dplyr','ggrepel','glmnet','tinytex','corrplot'), repos='https://cloud.r-project.org')"

# Install the TinyTeX LaTeX distribution
RUN R -e "tinytex::install_tinytex()"

# Add TinyTeX to PATH
ENV PATH=/home/rstudio/.TinyTeX/bin/x86_64-linux:$PATH

# Set working directory
WORKDIR /home/rstudio/project
