FROM 	sonnyhcl/petalinux

ENV	SSH_AUTH_SOCK=/tmp/ssh-agent
ARG 	user=plnx

# Change user to root for our changes
USER 	root

# Use default mirrors and install ssh
COPY 	sources.list /etc/apt/sources.list

RUN 	apt-get update -y && \
	apt-get install -y ssh

# Setup things for SSH
COPY 	ssh_config /home/$user/.ssh/config
RUN 	chown -R $user:$user /home/$user/.ssh

# Change user back to $user
USER 	$user
