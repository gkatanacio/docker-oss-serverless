ARG NODE_BASE_IMAGE
FROM $NODE_BASE_IMAGE

ARG GLIBC_VERSION
ARG OSS_SERVERLESS_VERSION=latest

RUN apk add --no-cache \
    aws-cli \
    bash \
    wget \
    ca-certificates && \
    update-ca-certificates

RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
    wget -q https://github.com/sgerrand/alpine-pkg-glibc/releases/download/$GLIBC_VERSION/glibc-$GLIBC_VERSION.apk && \
    apk add --force-overwrite glibc-$GLIBC_VERSION.apk && \
    rm -f glibc-$GLIBC_VERSION.apk

RUN npm install -g osls@$OSS_SERVERLESS_VERSION && sls --version

WORKDIR /opt/app
