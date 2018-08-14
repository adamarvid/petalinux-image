FROM ubuntu:16.04

ARG USER_ID
ARG WITH_XILINX

### Install packages needed for building and downloading
RUN apt-get update
RUN apt-get install -y sed
RUN apt-get install -y binutils
RUN apt-get install -y gcc
RUN apt-get install -y g++
RUN apt-get install -y bash
RUN apt-get install -y gzip
RUN apt-get install -y perl
RUN apt-get install -y tar
RUN apt-get install -y file
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
RUN apt-get install -y whois
RUN apt-get install -y ncurses-base
RUN apt-get install -y libncurses-dev

# Create buildroot dir
RUN mkdir -p /src
WORKDIR /src/buildroot

# Add a user (this is for the kernel builds whoami)
RUN useradd -ms /bin/bash -u $USER_ID docker

# Install Xilinx environment
COPY xilinx_config.txt /tmp/xilinx_config.txt
ENV XILINXD_LICENSE_FILE 2100@136.163.173.175
ENV LM_LICENSE_FILE 1717@nyx1
RUN mkdir /opt/Xilinx
RUN chown -R docker:docker /opt/Xilinx
RUN if [ $WITH_XILINX = "true" ] ; then echo "XILINX will be installed" ; else echo "XILINX will not be installed" ; fi
RUN if [ $WITH_XILINX = "true" ] ; then \
curl -fSL -A "Mozilla/4.0" -o /tmp/xilinx.tar "http://foss.ldchome.org/Xilinx_Vivado_SDK_2018.1_0405_1.tar.gz" && \
cd /tmp ; tar -xvf xilinx.tar && \
cd /tmp/Xilinx_Vivado_SDK_2018.1_0405_1 ; ./xsetup -a XilinxEULA,3rdPartyEULA,WebTalkTerms -b Install -c /tmp/xilinx_config.txt \
; fi

# Setup things for SSH
COPY ssh_config /home/docker/.ssh/config
RUN chown -R docker:docker /home/docker/.ssh

# Set default docker
USER docker

