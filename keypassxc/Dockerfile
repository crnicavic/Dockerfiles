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
				   apt-file

RUN useradd -r -m -u $UID -g users -G audio,video $USERNAME

RUN mkdir passdir

ADD ./icons $HOME/icons

WORKDIR $HOME

USER keepassxc

ENTRYPOINT ["keepassxc", "passdir/Passwords.kdbx"]
