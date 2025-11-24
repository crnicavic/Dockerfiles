# arch btw
FROM archlinux

ARG GID=100
ARG UID=1000
ARG USERNAME=vimtex
ARG HOME="/home/$USERNAME"

RUN rm /etc/pacman.d/mirrorlist
COPY ./mirrorlist /etc/pacman.d/mirrorlist
RUN pacman -Syu --noconfirm

#so many fucking dependencies
RUN pacman -Syyy && \
	yes | pacman -S git \
					vim \
					xorg-server \
					zathura \
					base-devel \
					tesseract-data-eng \
					zathura-pdf-mupdf \
					texlive-basic \
					texlive-bin \
					texlive-binextra \
					texlive-fontsrecommended \
					texlive-fontsextra \
					texlive-latex \
					texlive-latexextra \
					texlive-latexrecommended \
					texlive-mathscience \
					texlive-pictures \
					texlive-xetex \
					texlive-langcyrillic \
					ttf-dejavu-nerd \
					ttf-hack \
					inkscape \
					ttf-dejavu \
					xcolor \
					xorg-font-util \
					xterm \
					nodejs \
					npm 

#RUN groupadd -r users
RUN useradd -r -m -u $UID -g users -G audio,video $USERNAME && \
	echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER $USERNAME

#download Times New Roman
RUN mkdir $HOME/tnr 
WORKDIR $HOME/tnr
RUN git clone https://aur.archlinux.org/ttf-times-new-roman.git $HOME/tnr && \
	yes | makepkg -i

RUN git clone https://github.com/crnicavic/dwm-desktop $HOME/dwm-desktop && \
	sudo make -C $HOME/dwm-desktop/st/ install clean

RUN mkdir $HOME/workdir
WORKDIR $HOME/workdir

# install vim-plug
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# switch compiler to XeTeX
RUN echo "\$pdflatex=\"xelatex %O %S\";" > $HOME/.latexmkrc

# install configs
COPY dotfiles/the-vimrc $HOME/.vimrc
COPY dotfiles/install_plugins.vim $HOME
COPY dotfiles/Xresources $HOME/.Xresources
RUN vim -u $HOME/install_plugins.vim

#cleanup
RUN rm $HOME/install_plugins.vim && \
	rm $HOME/tnr -r

#remove sudo privileges
USER root
RUN head -n -2 /etc/sudoers > /etc/sudoers
USER $USERNAME

ENTRYPOINT ["dbus-run-session", "vim", "."]
CMD []
