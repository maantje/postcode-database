FROM python:3.11.7-slim AS builder

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt update -y && apt install -y git gcc locales locales-all wget sqlite3
RUN pip install --upgrade psutil

WORKDIR /
RUN git clone https://github.com/digitaldutch/BAG_parser parser

WORKDIR /parser

RUN wget -q --show-progress --progress=bar:force:noscroll https://service.pdok.nl/kadaster/adressen/atom/v1_0/downloads/lvbag-extract-nl.zip
RUN mv lvbag-extract-nl.zip ./input/bag.zip

RUN python3 import_bag.py

WORKDIR /parser/output

COPY finalize.sql finalize.sql
RUN sqlite3 bag.sqlite < finalize.sql
RUN gzip bag.sqlite
RUN mv bag.sqlite.gz addresses.sqlite.gz

FROM alpine:3.19.0 AS runtime

LABEL org.opencontainers.image.source=https://github.com/maantje/postcode-database

COPY --from=builder /parser/output/addresses.sqlite.gz /database/addresses.sqlite.gz

WORKDIR /database
