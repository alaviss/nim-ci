FROM docker.io/ubuntu:bionic

ENV DEBIAN_FRONTEND=noninteractive

# Update repository and install prerequesties for node installation
RUN apt-get update && apt-get install --no-install-recommends -y ca-certificates curl lsb-release

# Setup NodeJS repository
RUN curl -o /etc/apt/trusted.gpg.d/nodesource.asc https://deb.nodesource.com/gpgkey/nodesource.gpg.key && \
    echo "deb https://deb.nodesource.com/node_12.x $(lsb_release -s -c) main" > /etc/apt/sources.list.d/nodesource.list

# Install extra packages
COPY extra-packages /
RUN apt-get update && \
    xargs <extra-packages apt-get install --no-install-recommends -y && \
    rm -rf /var/lib/apt/lists/*
RUN rm /extra-packages

# Set GCC 8 as the default
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8 && \
    update-alternatives --set gcc /usr/bin/gcc-8
