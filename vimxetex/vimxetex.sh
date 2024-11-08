#check for number fo arguments
if [ "$#" -ne 1 ]; then
	echo "unexpected number of arguments!"
	exit 1
fi

# read last argument
PASSED=$(readlink -f "${@: -1}")

# determine whether it's a folder or a file
if [ -f "$PASSED" ]; then
	# if it's a file just use dirname directive
	DIR=$(dirname "$PASSED")
elif [ -d "$PASSED" ]; then
	DIR="$PASSED"
else 
	echo "not a file nor a directory!"
	exit 1
fi

xhost local:docker

docker run -it \
		   -e DISPLAY=$DISPLAY \
		   -v /tmp/.X11-unix:/tmp/.X11-unix \
		   -v "$DIR:/home/vimtex/workdir:rw" \
		   --name vimxetex \
		   --rm \
		   vimxetex
