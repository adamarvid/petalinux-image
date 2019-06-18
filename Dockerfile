FROM	sonnyhcl/petalinux:2018.2

ENV	SSH_AUTH_SOCK=/tmp/ssh-agent
ENV	CROSS_COMPILE=/opt/petalinux/tools/linux-i386/gcc-arm-linux-gnueabi/bin/arm-linux-gnueabihf-

# Change user to root for our changes
USER 	root

# Use default mirrors and install ssh
COPY 	sources.list /etc/apt/sources.list

RUN 	apt-get update -y && \
	apt-get install -y \
	ssh \
	cmake \
	gosu

# Entrypoint
COPY	entrypoint.sh /usr/local/bin/entrypoint.sh
RUN	chmod 775 /usr/local/bin/entrypoint.sh

ENTRYPOINT	["/usr/local/bin/entrypoint.sh"]

RUN	mkdir -p /workspace
WORKDIR	/workspace

CMD	["/bin/bash"]
