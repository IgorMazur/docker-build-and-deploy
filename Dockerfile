FROM mhart/alpine-node:12

EXPOSE 8000

RUN apk update
RUN apk add --update --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community --repository http://dl-3.alpinelinux.org/alpine/edge/main vips-dev vips-tools
RUN apk add fftw-dev gcc g++ make libc6-compat
RUN apk add git
RUN apk add python3
RUN rm -rf /var/cache/apk/*

RUN npm install -g yarn gatsby-cli@2.7.50
RUN gatsby telemetry --disable

RUN node -v
RUN npm -v
RUN yarn -v

RUN mkdir -p /site
WORKDIR /site
VOLUME /site

COPY ./entry.sh /
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
