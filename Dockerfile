FROM ruby:alpine

RUN apk update && \
    apk add --no-cache --virtual build-deps build-base && \
    apk add --no-cache icu-dev icu-libs cmake git openssl-dev && \
    gem install gollum github-markdown gollum-rugged_adapter && \
    apk del build-deps build-base icu-dev cmake openssl-dev

WORKDIR /wiki
ENTRYPOINT ["gollum"]
CMD ["--live-preview", "--adapter", "rugged"]

EXPOSE 4567
