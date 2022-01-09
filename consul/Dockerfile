FROM ubuntu

RUN apt-get update && \
      apt-get -y install sudo && \
      apt-get install -y unzip

# https://releases.hashicorp.com/consul/
ARG CONSUL_VERSION=1.11.1
ARG PLATFORM=linux_arm64

ADD https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_${PLATFORM}.zip \
    consul_${CONSUL_VERSION}_${PLATFORM}.zip
RUN unzip -d /bin consul_${CONSUL_VERSION}_${PLATFORM}.zip \
  && chmod +x /bin/consul

EXPOSE 8500 8502 8600/udp

CMD consul agent -dev -bind 0.0.0.0 
#-config-file=/var/consul/consul.hcl