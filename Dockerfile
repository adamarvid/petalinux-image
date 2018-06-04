FROM ubuntu:16.04

ARG USER_ID

### Install packages needed for building and downloading
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y bzip2
RUN apt-get install -y make
RUN apt-get install -y lib32z1
RUN apt-get install -y build-essential
RUN apt-get install -y wget
RUN apt-get install -y cpio
RUN apt-get install -y bc
RUN apt-get install -y python
RUN apt-get install -y unzip
RUN apt-get install -y rsync
RUN apt-get install -y mtd-utils
RUN apt-get install -y zip
RUN apt-get install -y doxygen
RUN apt-get install -y bison
RUN apt-get install -y flex
RUN apt-get install -y gettext
RUN apt-get install -y texinfo
RUN apt-get install -y git
RUN apt-get install -y groff-base
RUN apt-get install -y libconfuse-dev pkg-config
RUN apt-get install -y mtools
RUN apt-get install -y dosfstools
RUN apt-get install -y ncurses-base
RUN apt-get install -y libncurses-dev

# Create buildroot dir
RUN mkdir -p /src
WORKDIR /src/buildroot

# Add a user (this is for the kernel builds whoami)
RUN useradd -ms /bin/bash -u $USER_ID docker

# Setup things for SSH
COPY ssh_config /home/docker/.ssh/config
RUN chown -R docker:docker /home/docker/.ssh

# Set default docker
USER docker

