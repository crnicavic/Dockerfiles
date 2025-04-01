xhost local:docker

wmname LG3D

docker run -it \
	   -e DISPLAY=$DISPLAY \
	   -v /tmp/.X11-unix:/tmp/.X11-unix \
	   --name keepassxc \
	   --network none \
	   --rm \
	   keepassxc
