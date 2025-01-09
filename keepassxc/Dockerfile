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

RUN groupmod -g $GID users
RUN useradd -r -m -u $UID -g users -G audio,video $USERNAME

WORKDIR $HOME

USER $USERNAME

RUN mkdir $HOME/passdir

COPY Passwords.kdb[x] $HOME/passdir

ENTRYPOINT ["keepassxc", "passdir/Passwords.kdbx"]
