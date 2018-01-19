FROM node:8.9.4-alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    apk --no-cache update && \
    apk add --no-cache --virtual .build-deps gifsicle pngquant optipng libjpeg-turbo-utils udev ttf-opensans && \
    apk add --no-cache bash python py-pip alpine-sdk chromium-chromedriver chromium xvfb udev && \
    pip install awscli && \
    npm i -g nsp && \
    npm cache clean --force && \
    rm -rf /var/cache/apk /root/.npm/ /root/.cache/

ENV DISPLAY=:99 CHROME_BIN=/usr/bin/chromium-browser LIGHTHOUSE_CHROMIUM_PATH=/usr/bin/chromium-browser

WORKDIR /root

CMD ["/bin/true"]
