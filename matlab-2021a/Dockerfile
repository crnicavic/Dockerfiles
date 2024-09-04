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

RUN useradd -r -m -u $UID -g users -G audio,video $USERNAME

WORKDIR $HOME

COPY products.txt $HOME/ 

RUN wget -q https://www.mathworks.com/mpm/glnxa64/mpm && \
	chmod +x mpm && \
	./mpm install \
	--inputfile $HOME/products.txt

# 2021a uses a really old freetype so fixing linking errors
RUN rm /opt/matlab/bin/glnxa64/libfreetype.so.6 && \
	rm /opt/matlab/bin/glnxa64/libfreetype.so.6.16.0

RUN mkdir $HOME/workdir

USER matlab 

WORKDIR $HOME/workdir

RUN rm $HOME/products.txt $HOME/mpm

COPY license.lic /opt/matlab/

ENTRYPOINT ["/opt/matlab/bin/matlab", "-c", "/opt/matlab/license.lic"]
