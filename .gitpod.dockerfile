FROM gitpod/workspace-full:latest

USER gitpod

### Install Flutter
# dependencies
RUN set -ex; \
    sudo apt-get update; \
    sudo apt-get install -y libglu1-mesa xz-utils; \
    sudo rm -rf /var/lib/apt/lists/*
    
RUN cd /home/gitpod && \
    wget -qO flutter_sdk.tar.xz \
    https://storage.googleapis.com/flutter_infra/releases/beta/linux/flutter_linux_1.17.0-3.4.pre-beta.tar.xz &&\
    tar -xvf flutter_sdk.tar.xz && \
    rm -f flutter_sdk.tar.xz
    
ENV PATH="$PATH:/home/gitpod/flutter/bin"

RUN set -ex; \
    flutter config --enable-web; \
    flutter precache
