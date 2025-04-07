FROM debian
ARG GID=100
ARG UID=1000
ARG USERNAME=keepassxc
ARG HOME="/home/$USERNAME"

RUN apt update && \
	apt install -y wget \
				   xorg \
				   net-tools \
				   keepassxc \
				   apt-file \
				   sudo

RUN groupmod -g $GID users
RUN useradd -r -m -u $UID -g users -G audio,video $USERNAME && \
	echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

WORKDIR $HOME


USER $USERNAME

RUN mkdir $HOME/passdir

COPY Passwords.kdb[x] $HOME/passdir/

RUN sudo chmod 755 $HOME/passdir/Passwords.kdb[x]

#remove sudo privileges
USER root

RUN head -n -2 /etc/sudoers > /etc/sudoers

USER $USERNAME

ENTRYPOINT ["keepassxc", "passdir/Passwords.kdbx"]
