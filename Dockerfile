FROM docker.io/ubuntu:bionic

# Install extra packages
COPY extra-packages /
RUN apt-get update && \
    xargs <extra-packages apt-get install -y && \
    rm -rf /var/lib/apt/lists/*
RUN rm /extra-packages

# Set GCC 8 as the default
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8 && \
    update-alternatives --set gcc /usr/bin/gcc-8
