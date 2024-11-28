FROM --platform=linux/amd64 rocker/rstudio:4.4.1

WORKDIR /home/rstudio

COPY renv.lock renv.lock

# RUN apt-get update && apt-get install -y
RUN apt-get update && apt-get install -y --no-upgrade \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN quarto install tinytex

RUN R -e "install.packages('renv')"

RUN R -e "renv::restore()"