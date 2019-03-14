FROM debian:stretch-slim

LABEL maintainer="Ole Rößner <o.roessner@neusta.de>"

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    lsb-release \
    autoconf automake libtool pkg-config ragel gtk-doc-tools \
    gcc g++ libfreetype6-dev libglib2.0-dev libcairo2-dev \
    ca-certificates \
    bzip2 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN cd /tmp \
    && wget http://www.freedesktop.org/software/harfbuzz/release/harfbuzz-0.9.35.tar.bz2 \
    && tar xjf harfbuzz-0.9.35.tar.bz2 \
    && cd harfbuzz-0.9.35 \
    && ./configure --prefix=/usr \
    && make \
    && make install

CMD ["/usr/bin/hb-view"]
