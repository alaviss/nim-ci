ARG RELEASE=bionic
FROM docker.io/ubuntu:$RELEASE
ARG RELEASE

ARG DEBIAN_FRONTEND=noninteractive

# Setup NodeJS repository
ADD https://deb.nodesource.com/gpgkey/nodesource.gpg.key /etc/apt/trusted.gpg.d/nodesource.asc
RUN chmod 644 /etc/apt/trusted.gpg.d/nodesource.asc
RUN echo "deb http://deb.nodesource.com/node_12.x $RELEASE main" > /etc/apt/sources.list.d/nodesource.list

# Install extra packages
COPY extra-packages /
RUN apt-get update && \
    xargs <extra-packages apt-get install --no-install-recommends -y && \
    rm -rf /var/lib/apt/lists/*
RUN rm /extra-packages

# Set GCC 8 as the default
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8 && \
    update-alternatives --set gcc /usr/bin/gcc-8
