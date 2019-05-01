# Build KindleGen Container
ARG IMAGE_USER=geoffh1977
ARG IMAGE_NAME=alpine
ARG IMAGE_VERSION=latest

FROM ${IMAGE_USER}/${IMAGE_NAME}:${IMAGE_VERSION}
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"
USER root

# Install KindleGen
RUN wget -O /tmp/kindlegen_linux_2.6_i386_v2_9.tar.gz https://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz && \
  tar -xzf /tmp/kindlegen_linux_2.6_i386_v2_9.tar.gz -C /tmp && \
  mv /tmp/kindlegen /usr/bin && \
  rm -r /tmp/* && \
  mkdir -p /data && \
  chown ${ALPINE_USER}:${ALPINE_USER} -R /data

USER ${ALPINE_USER}
WORKDIR /data
VOLUME /data
CMD ["kindlegen"]

