# Copyright (c) 2019 FEROX YT EIRL, www.ferox.yt <devops@ferox.yt>
# Copyright (c) 2019 Jérémy WALTHER <jeremy.walther@golflima.net>
# See <https://github.com/frxyt/docker-qemu-user-static> for details.

ARG FRX_DOCKER_FROM=debian:stable-slim
FROM ${FRX_DOCKER_FROM}

LABEL maintainer="Jérémy WALTHER <jeremy@ferox.yt>"

FROM debian:stable-slim AS qemu

RUN     DEBIAN_FRONTEND=noninteractive apt-get update \
    &&  DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing --no-install-recommends qemu-user-static \
    &&  apt-get clean -y && apt-get clean -y && apt-get autoclean -y && rm -r /var/lib/apt/lists/* \
    &&  ls /usr/bin/qemu*

FROM busybox:latest

COPY --from=qemu /usr/bin/qemu-* /usr/bin/