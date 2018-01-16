FROM node:8.9.4-alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories  && \
    apk --no-cache update && \
    apk add --no-cache --virtual .build-deps gifsicle pngquant optipng libjpeg-turbo-utils udev ttf-opensans && \
    apk add --no-cache python alpine-sdk chromium-chromedriver chromium xvfb udev bash bash-completion

WORKDIR /mnt

ENV CHROME_BIN "/usr/bin/chromium-browser"
ENV LIGHTHOUSE_CHROMIUM_PATH "/usr/bin/chromium-browser"
ENV DISPLAY ":99"
