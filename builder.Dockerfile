FROM ubuntu:24.04 AS builder

ARG GCC_PREFIX="arm-linux-gnueabi"
ARG ARCH="arm"

ENV CROSS_COMPILE="$GCC_PREFIX-"

RUN mkdir -p /repo \
  echo CROSS_COMPILE=$CROSS_COMPILE \
  echo ARCH=$ARCH

RUN apt-get update \
  && apt-get install --yes \
    build-essential \
    "gcc-$GCC_PREFIX" \
    git \
    libncurses5-dev

WORKDIR /repo
