#
# https://github.com/biicode/docker-biicode
#

# Pull base image.
FROM ubuntu:14.04

MAINTAINER David Sanchez <david.sanchez@biicode.com>

# Install.
RUN \
  apt-get update && \
  apt-get install -y build-essential wget && \
  rm -rf /var/lib/apt/lists/*

RUN wget https://s3.amazonaws.com/biibinaries/release/2.4.1/bii-ubuntu-64_2_4_1.deb && \
  dpkg -i bii-ubuntu-64_2_4_1.deb && \
  rm bii-ubuntu-64_2_4_1.deb

# Set environment.
WORKDIR /home/biiuser
ENV HOME /home/biiuser
RUN bii setup:cpp
