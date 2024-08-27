FROM ruby:alpine

ENV JEKYLL_VERSION=4.3.3

ARG BUILD_DATE

LABEL summary="Container Image for running Jekyll."
LABEL maintainer="Uco Mesdag <uco@mesd.ag>"
LABEL build-date=${BUILD_DATE}

ENV PATH=/usr/local/bundle/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apk --no-cache add \
    build-base \
    bash \
    nodejs

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc; \
    gem update --system && \
    gem install bundler jekyll:$JEKYLL_VERSION

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /srv/jekyll
VOLUME /srv/jekyll

EXPOSE 35729
EXPOSE 4000
