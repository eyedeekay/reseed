FROM alpine
ENV GOPATH=/var/lib/i2p/go
ARG GOPATH=/var/lib/i2p/go
ENV SIGNER=hankhill19580@gmail.com
ARG SIGNER=hankhill19580@gmail.com
RUN mkdir -p /var/lib/i2p/i2p-config /var/lib/i2p/go
USER root
RUN apk update
RUN apk add git go make musl-dev
RUN adduser -D -u 128 i2psvc
RUN chown -R i2psvc /var/lib/i2p
WORKDIR /var/lib/i2p/i2p-config
USER i2psvc
RUN go get -u github.com/MDrollette/i2p-tools
CMD yes | $GOPATH/bin/i2p-tools reseed --signer=$SIGNER \
    --netdb=/var/lib/i2p/i2p-config/netDb \
    --port=7843 --ip=127.0.0.1 --trustProxy
