# Etherpad-Lite Dockerfile
#
# https://github.com/groupsky/etherpad-docker
#
# Developed from a version by John E. Arnold at https://github.com/ether/etherpad-docker
#
# Version 1.0

# Use Docker's nodejs, which is based on ubuntu
FROM node:0
MAINTAINER Geno Roupsky, https://github.com/groupsky

# Get Etherpad-lite's other dependencies
RUN apt-get update
RUN apt-get install -y gzip git-core curl python libssl-dev pkg-config build-essential supervisor

# Configuration
ENV ETHERPAD_VERSION=1.5.7

# Grab the latest Git version
RUN cd /opt && git clone --branch ${ETHERPAD_VERSION} --depth 1 https://github.com/ether/etherpad-lite.git etherpad

WORKDIR /opt/etherpad

# Install node dependencies
RUN ./bin/installDeps.sh

# Add files
ADD settings.js runner.js ./

EXPOSE 9001
CMD ["node", "runner.js"]
