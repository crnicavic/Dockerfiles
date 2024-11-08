docker run -it -e DISPLAY=$DISPLAY \
						  -v /tmp/.X11-unix:/tmp/.X11-unix \
						  -v /home/user/Downloads:/home/firefox/Downloads \
						  --device /dev/snd \
						  --name firefox \
						  --rm \
						  firefox
