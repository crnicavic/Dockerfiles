# arch btw
FROM archlinux

ARG GID=100
ARG UID=1000
ARG USERNAME=vimtex
ARG HOME="/home/$USERNAME"

RUN pacman -Syyy && \
	yes | pacman -S git \
					vim \
					xorg-server \
					zathura \
					tesseract-data-eng \
					zathura-pdf-mupdf \
					texlive-basic \
					texlive-bin \
					texlive-binextra \
					texlive-fontsrecommended \
					texlive-latex \
					texlive-latexextra \
					texlive-latexrecommended \
					texlive-mathscience \
					texlive-pictures \
					xcolor \
					nodejs \
					npm 

#RUN groupadd -r users
RUN useradd -r -m -u $UID -g users -G audio,video $USERNAME

USER $USERNAME

# install vim-plug
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

COPY .vimrc $HOME
COPY install_plugins.vim $HOME
RUN vim -u $HOME/install_plugins.vim

RUN mkdir $HOME/workdir

WORKDIR $HOME/workdir

ENTRYPOINT ["dbus-run-session", "vim", "."]
CMD []
