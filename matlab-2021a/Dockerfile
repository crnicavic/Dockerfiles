FROM debian

ARG GID=100
ARG UID=1000
ARG USERNAME=matlab
ARG HOME="/home/$USERNAME"

RUN apt update && \
	apt install -y wget \
				   default-jre \
				   libgdk-pixbuf-2.0-dev \
				   libatk1.0-0 \
				   xorg \
				   net-tools \
				   apt-file
#libharfbuzz-dev


RUN useradd -r -m -u $UID -g users -G audio,video $USERNAME

WORKDIR $HOME

COPY license.lic $HOME/

# Incase of issues this should do stuff
# cd <your_matlab_location>/sys/os/glnxa64/
# sudo mv libstdc++.so.6 libstdc++.so.6.bak
# sudo ln -s /usr/lib64/libstdc++.so.6  libstdc++.so.6

RUN wget -q https://www.mathworks.com/mpm/glnxa64/mpm && \
	chmod +x mpm && \
	./mpm install \
	--release R2021a \
	--destination $HOME/matlab \
	--products Simulink 	

# 2021a uses a really old freetype so fixing linking errors
RUN rm $HOME/matlab/bin/glnxa64/libfreetype.so.6 && \
	rm $HOME/matlab/bin/glnxa64/libfreetype.so.6.16.0

RUN mkdir $HOME/workdir

USER matlab 

ENTRYPOINT ["/home/matlab/matlab/bin/matlab", "-c", "/home/matlab/license.lic"]
