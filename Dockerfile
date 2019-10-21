FROM ubuntu:19.04

EXPOSE 8000

RUN apt-get update
RUN apt-get install -y nodejs curl git
RUN apt-get install -y python gcc g++ make libvips-dev
RUN curl https://www.npmjs.com/install.sh | sh
RUN node -v
RUN npm -v
RUN npm install -g yarn gatsby-cli@2.7.50
RUN gatsby telemetry --disable

RUN mkdir -p /site
WORKDIR /site
VOLUME /site

COPY ./entry.sh /
RUN chmod +x /entry.sh
ENTRYPOINT ["/entry.sh"]
