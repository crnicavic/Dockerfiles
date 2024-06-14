FROM ubuntu

RUN apt-get update && apt-get install -y git -qqy x11-apps \
		ccache cmake build-essential \
		gperf help2man libreadline-dev libssl-dev libncurses-dev \
		libncursesw5-dev ncurses-doc zlib1g-dev libsqlite3-dev \
		libmagic-dev golang sudo feh zathura libpci3 libegl1 

RUN useradd -r -m -g users -G audio,video,users nchat 

RUN git clone https://github.com/d99kris/nchat /home/nchat/nchat

WORKDIR /home/nchat/nchat
RUN ./make.sh deps
RUN ./make.sh --no-telegram build 
RUN ./make.sh install

WORKDIR /home/nchat

USER nchat
