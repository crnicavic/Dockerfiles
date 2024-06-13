FROM ubuntu

ARG UID=1000
ARG GID=100

RUN apt-get update && apt-get install -y git -qqy ccache cmake build-essential \
		gperf help2man libreadline-dev libssl-dev libncurses-dev \
		libncursesw5-dev ncurses-doc zlib1g-dev libsqlite3-dev \
		libmagic-dev golang sudo

RUN useradd -r -m -g users -G audio,video,users nchat 

#RUN chown nchat:users /home/nchat 
#RUN chmod 777 /home/nchat

RUN git clone https://github.com/d99kris/nchat /home/nchat/nchat
WORKDIR /home/nchat/nchat
RUN ./make.sh deps
RUN ./make.sh --no-telegram build 
RUN ./make.sh install

USER nchat
