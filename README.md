# Dockerfiles

Build images with the follow command:
docker build -t <name> . --progress=plain
 - where <name> is what the name of the image will be
 - use --no-caching to start build all over again for debugging purposes

## Notes for matlab container

The way I setup the container is to copy a license file into the image itself,
because it's simple and convinient. Now the way to generate the license file,
is to go mathworks' site, login and go to license center. There you select
your license, and under install tab there is a 'activate a computer' thing,
add the license there for r2021a, and as host id you put in the MAC address
of the container, which in the matlab run script is set to `02:42:ac:11:00:ff`.

The reason for that is docker assigns the MAC of `02:42:ac:11:00:02` for all 
containers and increments it by 1 for each container. So by setting it to 
`02:42:ac:11:00:ff` you can have 254 containers running before problems start
to emerge.
