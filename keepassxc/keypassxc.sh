xhost local:docker

wmname LG3D

docker run -it \
		   -e DISPLAY=$DISPLAY \
		   -v /tmp/.X11-unix:/tmp/.X11-unix \
		   -v keepassxc:/home/keepassxc/passdir \
		   --network none \
		   --rm \
		   keepassxc
