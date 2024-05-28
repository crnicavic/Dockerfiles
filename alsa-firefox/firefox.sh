docker run -it -e DISPLAY=$DISPLAY \
						  -v /tmp/.X11-unix:/tmp/.X11-unix \
						  -v /home/user/Downloads:/home/firefox/Downloads \
						  --device /dev/snd \
						  --env ALSA_CARD=Generic \
						  --group-add=audio \
						  --rm \
						  firefox
