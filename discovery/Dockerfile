FROM ubuntu:20.04

ENV DOCKERIZE_VERSION v0.6.1

RUN apt-get update && apt-get install -y dnsmasq

EXPOSE 53/udp

ENTRYPOINT dnsmasq --no-daemon \
    -W "_elements._tcp.internal,app-node-0,28883,1" \
    -W "_elements._tcp.internal,app-node-1,28883,1" \
