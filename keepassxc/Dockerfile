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

COPY Passwords.kdb[x] $HOME/passdir

RUN mkdir passdir

ADD ./icons $HOME/icons

WORKDIR $HOME

USER $USERNAME

ENTRYPOINT ["keepassxc", "passdir/Passwords.kdbx"]
