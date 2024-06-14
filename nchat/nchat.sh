docker run -it --rm -e DISPLAY=$DISPLAY \
		   -v /home/user/.config/nchat:/home/nchat/.config/nchat:rw \
		   -v /tmp/.X11-unix:/tmp/.X11-unix \
		   nchat-whatsapp
