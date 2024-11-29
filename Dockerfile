FROM rocker/verse:4.4.1

ENV CRAN="https://p3m.dev/cran/__linux__/jammy/2024-10-30"

RUN install2.r --error --skipinstalled --ncpus -1 \
    janitor \
    && rm -rf /tmp/downloaded_packages