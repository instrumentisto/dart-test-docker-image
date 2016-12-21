# AUTOMATICALLY GENERATED
# DO NOT EDIT THIS FILE DIRECTLY, USE /Dockerfile-template.j2

# https://hub.docker.com/r/google/dart/
FROM google/dart:1.19.0

MAINTAINER Instrumentisto Team <developer@instrumentisto.com>


RUN mkdir -p /tmp/dart \

 # Install third-party dependencies
 && DEBIAN_FRONTEND=noninteractive \
 && echo 'deb http://deb.debian.org/debian jessie contrib' \
                                                      >> /etc/apt/sources.list \
 && apt-get update \
 && (echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections) \
 && apt-get install --no-install-recommends -y -q \
                    unzip \
                    xvfb xauth \
                    chromedriver \
                    libgconf-2-4 \
                    fonts-thai-tlwg \
                    fonts-indic \
                    fonts-dejavu-core \
                    ttf-kochi-gothic ttf-kochi-mincho \
                    msttcorefonts \

 && curl -L -o /tmp/dart/content_shell.zip \
         https://storage.googleapis.com/dart-archive/channels/stable/release/1.19.0/dartium/content_shell-linux-x64-release.zip \
 && unzip /tmp/dart/content_shell.zip -d /tmp/dart/ \
 && mv /tmp/dart/drt-lucid64* /usr/local/content_shell \

 && apt-get purge -y --force-yes \
                  unzip \
 && apt-get clean \
 && rm -rf /tmp/dart \
           /var/lib/apt/lists/*

ENV PATH=$PATH:/usr/local/content_shell


VOLUME ["/app"]

WORKDIR /app
