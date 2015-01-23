#
# https://github.com/biicode/docker-biicode
#

# Pull base image.
FROM ubuntu:14.04

MAINTAINER David Sanchez <david.sanchez@biicode.com>

# Install.
RUN \
  apt-get update && \
  apt-get install -y build-essential && \
  apt-get install -y wget && \
  wget http://apt.biicode.com/install.sh && \
  chmod +x install.sh && \
  ./install.sh

# Create a user.
RUN groupadd -f biiuser
RUN useradd -m -d /home/biiuser -s /bin/bash -c "biiuser docker dev" -g biiuser biiuser
RUN su biiuser
RUN echo "biiuser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/biiuser

# Set environment.
USER biiuser
WORKDIR /home/biiuser
ENV HOME /home/biiuser
RUN bii setup:cpp
