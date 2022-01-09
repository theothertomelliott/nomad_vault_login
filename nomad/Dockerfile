FROM ubuntu

RUN apt-get update && \
      apt-get -y install sudo && \
      apt-get install -y unzip

# https://releases.hashicorp.com/nomad/
ARG NOMAD_VERSION=1.2.3
ARG PLATFORM=linux_arm64

ADD https://releases.hashicorp.com/nomad/${NOMAD_VERSION}/nomad_${NOMAD_VERSION}_${PLATFORM}.zip \
    nomad_${NOMAD_VERSION}_${PLATFORM}.zip
RUN unzip -d /bin nomad_${NOMAD_VERSION}_${PLATFORM}.zip \
  && chmod +x /bin/nomad

EXPOSE 4646 4647 4648 4648/udp

CMD sudo nomad agent -dev -bind 0.0.0.0 -log-level INFO -config=/var/nomad/nomad.hcl